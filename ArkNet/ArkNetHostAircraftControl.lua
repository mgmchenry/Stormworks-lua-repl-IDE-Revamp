-- Stormworks ArkNet Host Aircraft Control
-- V 01.01 b0 Michael McHenry 2022-10-07
source={"ArkNetSasHostx01c","repl.it/@mgmchenry"}

-- dofile("BorrowedCode/stravant_luaMinify.lua")("minify", "ArkNet/ArkNetHostAircraftControl.lua")

--[[
ArkNet Theory:
ArkNet allows communications between vehicles, systems, hosts, and networks

Vehicle: a single mechanically linked body that allows direct wiring between all vehicle components

Flight hotKeys
  1: Flight/Control Mode toggles
    single - enable/disable mouse
    double - set mouse enabled
    triple - default flight, no mouse
    six - panic
    hold - control select menu
  2: Target System
  3: SAS select
  4: Weapon Control
    hold - weapons off
  5: Throttle Select

  6:
    hold - context help 

ArkNet Host:
ArkNet Command Bus:

ArkNet message

Protocols:
ArkNet Host Control:
  bool_32: Disable Host Video Out (reverts to fallback)


    XPDR Freq Out
    XPDR Radio In
    XPDR Radio Xmit
    Keypad Input X
    Keypad Input Y

ArkNet Host Aircraft Control MC Inputs and Outputs
  Col1:
    GPS X :9
    GPS Y :10
    Alt Left :11
    Forward Speed :16
    Station 1 Seat Input :1-4
  Col2:
    Clock In :24
    --Alt Rear :14
    TiltUp: 20
    Compass :15
    Alt Forwad :13
    Station 2 Seat Input :5-8
  Col3:  
    ArkNet DataLoop P1 Input :25-32
    Aux Video In
    Alt Right :12
    x
    Station1 Touch 01 In
  Col4:
    ArkNet DataLoop Root Out
    XPDR Radio Out
    Station2 Video Out
    Station1 Video Out
    Station2 Touch 01 In
  Col5:
    Elevator Pitch :Out01
    Aileron Primary :Out02
    Rudder Yaw  :Out03
    Canard Pitch :Out04
    Aileron Brake :Out05


ArkNet Host Aircraft Control luaMain Composite Inputs
  Station 1 Seat Input :1-4
  Station 2 Seat Input :5-8
  GPS X :9
  GPS Y :10
  Alt Left :11
  Alt Right :12
  Alt Forwad :13
  Alt Rear :14
  Compass :15
  Forward Speed :16
  Station 1 Seat look :17-18
  Station 1 hotkey bitflags: 19
  TiltUp :20
  Clock In :24
  MC Tick :25
  ArkNet DataLoop P1 Input :25-32
  
  Station1 Touch 01 In?
  
    

ArkNet Host Aircraft Control luaMain Composite Outputs
01  Aileron Primary :Out01 a/d axis1
    Elevator Pitch :Out02 w/s axis2
    Rudder Yaw  :Out03 l/r axis 3
    Canard Pitch :Out04 w/s axis2
    Aileron Brake :Out05  a/d axis1

    ArkNet DataLoop Root Out
    XPDR Radio Out



Composite Inputs
  Station1 Seat Input -> InputProcessor
  Station2 Seat Input -> InputProcessor

  ArkNet Host Control In -> HostControlProcessor

Sensor Bundle
  n[1-6] - GPSX,GPSY,Alt,TiltForward, TiltLeft, TiltUp
  n07:  Compass
  n08:  Clock
  n09:  Forward Speed

  Calc Heading, Bearing


]]

local G, prop_getText, gmatch, unpack
  , ipairz, commaDelimited, empty
  , luaType_string, luaType_table, luaType_number
  , nilzies -- nilzies not assigned by design - it's just nil but minimizes to one letter

  , stringUnpack, getTableValues, clamp, plop -- deferred utility function definitions

	= _ENV, property.getText, string.gmatch, table.unpack
  , ipairs, '([^,\r\n]+)', false
  , "string", "table", "number"

function main()
  local abs, min, max, sqrt, ceil, floor, sin, cos, atan, pi
    = getTableValues(math, --prop_getText("ArkMF0")
    "abs,min,max,sqrt,ceil,floor,sin,cos,atan,pi")
  _ = floor(pi)==3 or pi() -- sanity check

  local radPerTurn, degPerTurn = pi * 2, 360

  local getNumber, getBool, setNumber, setBool, format, type, screenToMap, mapToScreen
    = getTableValues(G, --prop_getText("ArkGF0")
      "input.getNumber,input.getBool,output.setNumber,output.setBool,string.format,type,map.screenToMap,map.mapToScreen")

  local numberList = {}
  for i=1,30 do numberList[i]=i end

  local I, O, Ib, Ob -- composite input/output tables
    , tickCounter
    , vAltHold, vAltHoldOn
    , screenConfig, screenCount, screensRendered
    , uiState

    , seat1, seat2
    --, gpsX, gpsY
    --, altL, altR, altF, altB, tiltUp
    --, compass, forwardSpeed, lookX, lookY
    --, hotKeys
    --, clock, vehicleTick
    , lastTriggerClick
    --, pilotLookX, pilotLookY
    , lookTrigger, triggerClick
    --, sAlt, sPitch, sRoll
    , sasPitch, sasRoll
    = {},{},{},{}
    , 0 -- tickCounter
    , 100, false -- vAltHold
    , {}, -1, -1, {}

  local -- data index names
    -- set 1: calculated data with history, delta, target, and targetDelta
    _altC, _pitch, _roll, _yaw, _hotKeyState -- index 1-6
    -- set 2: raw data with history, delta, target, and targetDelta
    , _gpsX, _gpsY, _altL, _altR, _altF, _altB -- index 6-11
    , _compass, _forwardSpeed, _tiltUp, _clock, _mcTick -- 12-16
    -- set 3: outputs with history
    , _controlPitch, _canardPitch, _controlRoll, _controlYaw -- 17-20
    -- third order: inputs with no history
    , _seat1, _seat2, _lookX, _lookY, _hotKeyFlags -- 21-25
    , _lastIndex --26
    
    = unpack(numberList)

  local sampleCount, bufferCursor, dataSamples
    , inputConfig
    , lastTickData, thisTickData
    = 60, 0, {}
    , -- input channel config
    { _seat1,0,0,0 -- 1-4 Station 1 Seat Input :1-4
      , _seat2,0,0,0 -- 5-8 Station 2 Seat Input :5-8
      , _gpsX, _gpsY, _altL, _altR, _altF, _altB -- 9-14
      , _compass, _forwardSpeed, _lookX, _lookY, _hotKeyFlags -- 15-19
      , _tiltUp, 0, 0, 0, _clock, _mcTick -- 20-25
    }

  --[[  
  MC Tick :25 ??
  ArkNet DataLoop P1 Input :25-32
  ]]
    
  local controlPitch, canardPitch, controlRoll, controlYaw

  -- forward function declarations    
  --local createTouchInput, updateTouchInput, checkTouchStart

  local function init()
    --touchDevices[1] = createTouchInput(1,9,10,11,12,13,14,15,16)
    --touchDevices[2] = createTouchInput(3,25,26,23,24,25,26,27,28)
  end

  local function getFlags(flags, result, _bit)
    result = result or {}
    for i=1,8 do
      _bit = 2^(i-1)
      result[i] = flags % (_bit*2) >= _bit
    end
    return result
  end

  function onTick()  
    screenCount = screensRendered
    tickCounter = tickCounter + 1
    
    for i=1,32 do -- load composite input array and copy to output array for pass-through
      I[i]=getNumber(i);Ib[i]=getBool(i)
      O[i]=I[i];Ob[i]=Ib[i]
    end
    
    lastTickData = dataSamples[bufferCursor] or {}
    bufferCursor = bufferCursor%(sampleCount-1) +1
    thisTickData = dataSamples[bufferCursor] or {d={}, t={}, td={}}
    dataSamples[bufferCursor] = thisTickData

    for i, dataType in ipairz(inputConfig) do
      if dataType>0 then
        thisTickData[dataType] = I[i]
      end
    end

    -- calculate position data
    --[[
    sAlt = (altL+altR)/2
    sPitch = math.asin((altF-sAlt)*2)/pi/2
    sRoll = math.asin((altL-sAlt)*2 / cos(sPitch))/pi/2
    --, gpsX, gpsY
    --, compass, forwardSpeed, lookX, lookY
      --, gpsX, gpsY
      , _, _, altL, altR, altF, altB -- I[9] ... I[14]
      --, compass, forwardSpeed
      , _, _
        --, pilotLookX, pilotLookY
        ,_ ,_ , hotKeys -- I[15]...I[19]
      , tiltUp, _, _, _ -- 20-23
      , clock, vehicleTick      
      = unpack(I,9,25)
    ]]

    thisTickData[_altC] = (thisTickData[_altL]+thisTickData[_altR])/2
    thisTickData[_pitch] = math.asin((thisTickData[_altF]-thisTickData[_altC])*2)/pi/2
    thisTickData[_roll] = math.asin((thisTickData[_altL]-thisTickData[_altC])*2 
      / cos(thisTickData[_pitch]))/pi/2
    
    if thisTickData[_tiltUp] < 0 then
      thisTickData[_pitch] = -thisTickData[_pitch]
      thisTickData[_roll] = .5 - thisTickData[_roll]
      --sasPitch = -sasPitch
    end

    -- calculate delta rate of change per second
    for dataType=_altC, _mcTick do
      thisTickData.d[dataType] = 
        ((thisTickData[dataType] or 0)
         - (lastTickData[dataType] or 0))
        * 60 -- change per second
    end

    seat1, seat2
      = {unpack(I,1,4)}
      , {unpack(I,5,8)}

    thisTickData[_hotKeyFlags] = getFlags(thisTickData[_hotKeyFlags])
    local hotKeys = thisTickData[_hotKeyFlags]
    --playerLookX, playerLookY = getTableValues(I, {9,10})
    lookTrigger, triggerClick = hotKeys[7], lookTrigger
    triggerClick = lookTrigger and not triggerClick
    local pilotLookX, pilotLookY = thisTickData[_lookX], thisTickData[_lookY]
    if triggerClick then
      lastTriggerClick = {pilotLookX, pilotLookY}
    end


    --[[    
    Aileron Primary :Out01 a/d axis1
    Elevator Pitch :Out02 w/s axis2
    Rudder Yaw  :Out03 l/r axis 3
    Canard Pitch :Out04 w/s axis2
    Aileron Brake :Out05  a/d axis1
    ]]
    local mouseControl = hotKeys[1] and 1 or 0
    controlRoll = seat1[1] + seat2[1] 
    controlPitch = seat1[2] + seat2[2]
      - clamp(mouseControl * pilotLookY * abs(pilotLookY) * 32, -.5, .5)
    controlYaw = seat1[3] + seat2[3]
      + clamp(mouseControl * pilotLookX * abs(pilotLookX) * 32, -.5, .5)


    -- target rate of pitch
    thisTickData.t[_pitch] = 0 -- target pitch
    thisTickData.td[_pitch] -- target delta
      = (thisTickData.t[_pitch] - thisTickData[_pitch])
        * .1 -- sensitivity

    sasPitch = --(abs(controlPitch)>0.01 and mouseControl>0) and 0
      thisTickData[_pitch]~=thisTickData[_pitch] and 0 -- check for pitch is nan
      --or (max(min(thisTickData[_pitch] * 16, .5),-.5))
      or clamp(
        (thisTickData.d[_pitch] - thisTickData.td[_pitch])
        * 10 -- sensitivity
        ,-.5,.5)

    sasRoll = (abs(controlRoll)>0.1) and 0
      or (max(min(thisTickData[_roll] * 16, .5),-.5))*-1

    vAltHoldOn = hotKeys[3]

    if abs(controlPitch)>0.1 and abs(thisTickData[_pitch])<0.1 and vAltHoldOn then
      vAltHold = sAlt
    end

    if vAltHoldOn and actuallyNever then
      sasPitch = sasPitch + clamp( (thisTickData[_altC] - vAltHold) / 100, -1, 0.1)
    end

    controlPitch = controlPitch 
      + ((abs(controlPitch)>0.01 and mouseControl>0) and 0 or sasPitch)

    controlRoll = controlRoll + sasRoll
    canardPitch = controlPitch

    --plop(false, O, {controlRoll, controlPitch, controlYaw, canardPitch, controlRoll})
    for i,v in ipairz({controlRoll, controlPitch, controlYaw, canardPitch, controlRoll}) do
      O[i]=v
    end
    
    for i=1,32 do
      setNumber(i, O[i])
      setBool(i, Ob[i])
    end
    screensRendered = 0
  end

  do -- screen api available inside this block
    local F, setColor, drawLine, drawCircle, drawCircleF
    , drawRect, drawRectF,drawTriangleF,drawText,drawTextBox
    , screen_getWidth, screen_getHeight  
    = 255, getTableValues(screen,--prop_getText("ArkSF0")
      "setColor,drawLine,drawCircle,drawCircleF,drawRect,drawRectF,drawTriangleF,drawText,drawTextBox,getWidth,getHeight")

    local cSolidWhite
      , cRed, cGreen, cBlue, cMagenta
      , cWhite, cBlack
      , screenWidth, screenHeight
      , currentDrawColor, textPosX, textPosY

      -- forward function references:
      , betterSetColor, betterSetAlpha, betterDrawRect, betterDrawLineRel
      , drawCursor

      = {F,F,F,F}, {F,0,0}, {0,F,0}, {0,0,F}, {F,0,F}
        , {F,F,F}, {0,0,0}

    function printText(text, color)
      drawText(textPosX, textPosY, text)
      textPosY = textPosY+6
    end

    function onDraw()
      screensRendered = screensRendered + 1
      screenCount = max(screensRendered, screenCount)
      screenWidth, screenHeight = screen_getWidth(), screen_getHeight()

      if screensRendered==1 then
        if #screenConfig==0 
          or screenConfig[1][1]~=screenWidth
          or screenConfig[1][2]~=screenHeight
          then
            screenConfig[1] = {screenWidth, screenHeight}
            screenConfig[2] = {screenWidth/2-.5, screenHeight/2-.5}


        end
      end

      betterSetColor(cSolidWhite)
      betterSetAlpha(.5)
      drawRectF(0, 0, screenWidth/2, screenHeight/2)

      betterSetAlpha(1)
      betterSetColor(cBlue)
      textPosX, textPosY = 2, 4
      --printText(format("Screen %i/%i" ,screensRendered, screenCount))
      betterSetColor(lookTrigger and cGreen or cWhite)
      
      printText(format("%.2f,%.2f", thisTickData[_lookX]*360, thisTickData[_lookY]*360))
      --printText(format("Pit: %.2f", thisTickData[_pitch] * 360))
      printText(format("Rol: %.2f", thisTickData[_roll] * 360))
      printText(format("Alt: %.2f", thisTickData[_altC]))
      betterSetColor(vAltHoldOn and cGreen or cWhite)
      printText(format("AHold: %.2f", vAltHold))
      --printText(format("P: %.2f=%.2f+%.2f", controlPitch, controlPitch - sasPitch, sasPitch))
      
      printText(format("OutRoll: %.2f", controlRoll))
      --printText(format("M: %.2f,%.2f", thisTickData[_lookX], thisTickData[_lookY]))
      printText(format("Pitch: %.2f", thisTickData[_pitch] * 360))
      printText(format("PRate: %.2f", thisTickData.d[_pitch] * 360))
      printText(format("PTarget: %.2f", thisTickData.t[_pitch] * 360))
      printText(format("PTRate: %.2f", thisTickData.td[_pitch] * 360))
      printText(format("tmath: %.4f", thisTickData.d[_pitch] - thisTickData.td[_pitch]))
      printText(format("SasPitch: %.2f", sasPitch))
      printText(format("OutPitch: %.2f", controlPitch))
      printText(format("ClimbRate: %.2f", thisTickData.d[_altC] or 0))
      --, canardPitch, , controlYaw
      
      
      if lastTriggerClick and lastTriggerClick[1] then
        printText( format("%.2f,%.2f", lastTriggerClick[1]*360, lastTriggerClick[2]*360))
      end

      if screensRendered==1 and screenConfig[2] then
        betterSetColor(cGreen)
        betterDrawLineRel(screenConfig[2][1]+1.5,screenConfig[2][2]+1.5,1,1)
        betterDrawLineRel(screenConfig[2][1]-1.5,screenConfig[2][2]-1.5,-1,-1)
        betterDrawLineRel(screenConfig[2][1]+1.5,screenConfig[2][2]-1.5,1,-1)
        betterDrawLineRel(screenConfig[2][1]-1.5,screenConfig[2][2]+1.5,-1,1)

        local dX, dY =
          clamp(thisTickData[_lookX]*8,-1,1)
          , clamp(thisTickData[_lookY]*8,-1,1)
          
        betterDrawLineRel(screenConfig[2][1],screenConfig[2][2]+.5
          ,dX*abs(dX)*screenWidth/2,0)
          
        betterDrawLineRel(screenConfig[2][1],screenConfig[2][2]-.5
          ,sign(dX)*sqrt(abs(dX))*screenWidth/2,0)

      end
      --[[
      printText("keyFlags: " .. tostring(I[19]))
      local toggles = "keys: "
      for i=1,8 do
        toggles=toggles .. (hotKeys[i] and "X" or "O")
      end
      printText(toggles)
      ]]

    end
    --[[ End onDraw]]

    function drawCursor(touchX, touchY, touchOn)
      betterSetAlpha(.5)
      --[[betterDrawLineRel(touch1X-1,touch1Y-1,-2,0,cRed)
      betterDrawLineRel(touch1X-1,touch1Y-1,0,-2,cRed)
      betterDrawLineRel(touch1X+1,touch1Y+1,0,2,cMagenta)
      betterDrawLineRel(touch1X+1,touch1Y+1,2,0,cMagenta)
      betterDrawLineRel(touch1X-1,touch1Y+1,-2,2,cBlue)
      betterDrawLineRel(touch1X+1,touch1Y-1,2,-2,cGreen)
      ]]
      betterDrawLineRel(touchX,touchY,0,0,cWhite)
      if touchOn then
        betterDrawLineRel(touchX-1,touchY-1,2,2,cWhite)
        betterDrawLineRel(touchX-1,touchY+1,2,-2,cWhite)
      end

      betterSetAlpha(1)
    end
    
    function betterSetAlpha(a)
      currentDrawColor[4] = a * F
      setColor(unpack(currentDrawColor))
    end

    function betterSetColor(r,g,b,a, local_packedColor)
      currentDrawColor = plop(
        type(r)==luaType_table and r
        or {r,g,b,a}
        , currentDrawColor)
      setColor(unpack(currentDrawColor))
    end

    function betterDrawLineRel(x,y,w,h,color,l_dis)
      if color then betterSetColor(color) end
      l_dis = sqrt(w*w + h*h)
      if l_dis<1 then
        w,h=x+w, y+h
          + (h>0 and 1 or -1)
      else
        w = x + w + w/l_dis
        h = y + h + h/l_dis
      end
      drawLine(x,y,w,h)
    end

    function betterDrawRect(x,y,w,h,color,filled)
      if color then betterSetColor(color) end
      if filled or w<2 or h<2 then
        drawRectF(x,y,w,h)
      else
        drawRect(x,y,w-1,h-1)
      end
    end

  end

  return init
end

clamp, sign, plop, stringUnpack, getTableValues =

function --[[clamp]]
(a,b,c) return b>a and b or c<a and c or a end
--min(max(a,b),c) end
,
function --[[sign]]
(n) return n < 0 and -1 or n > 0 and 1 or 0 end
,
function 
--[[plop]]
(...) 
-- optionally plop(boolean_returnNewSource, returnTable, ...)
  local sources, result = {...}, {}
  if not sources[1] then
    result,sources = sources[2]
      , {unpack(sources,3)}
  end
  for i,v in ipairz(sources) do
    for i,v in ipairz(v) do
      result[i] = result[i] or v
    end
  end
  return result, unpack(result)
end
,
-- stringUnpack("string1,string2")
-- returns unpacked list of strings from comma delimited list
-- stringUnpack("string1,string2", existingArray)
-- same, but also appends the values to the supplied table
function(text, local_returnVals)
  local_returnVals = local_returnVals or {}
  for v in gmatch(text, commaDelimited) do
    local_returnVals[#local_returnVals+1]=v
  end
  return unpack(local_returnVals)
end
,
--[[
  getTableValues({1,2,"a","b"},{1,4}):
  getTableValues({this="a",that="b",other=2},"this,other")
  getTableValues(deepArray, "val1,val2,deep.val3,deep.deeper.val4")

  sourceTable = {replaceValue="newValue",insertValue="selectedValue",ignore="goingNowhere",1="a",2="b"}
  selectionList = {replaced="replaceValue", inserted="insertValue", 2,3} 
      -- vs {replaceValue,insertValue,2,3} or {"replaceValue,insertValue,2,3"}  
  destinationTable = {keeps="kept",replaced="oldValue"}
  getTableValues(sourceTable, selectionList, destinationTable
    returns unpack({keeps="kept", replaced=""})
]]
function --[[getTableValues]] (container, valueList, local_returnVals, local_startIndex, local_context)
  valueList, local_returnVals = 
    type(valueList)==luaType_string and {stringUnpack(valueList)}
    or valueList
    , local_returnVals or {}
  local_startIndex = #local_returnVals
	for returnValsIndex,containerKey in pairs(valueList) do    
    if type(containerKey)==luaType_number then
      local_context = container[containerKey]
    else
      local_context = container
      for subkey in gmatch(containerKey,'([^. ]+)') do
        local_context = local_context[subkey]
      end
    end
    returnValsIndex = 
      type(returnValsIndex)==luaType_number and local_startIndex + returnValsIndex
      or returnValsIndex
    local_returnVals[returnValsIndex] = local_context
	end
	return unpack(local_returnVals)
end

main()()

--[[minStrip]]
note={"Unit tests start here"}
function onTest(inValues, outValues, inBools, outBools, runTest)
  for i=1,32 do
    inValues[i]=0
    outValues[i]=0
    inBools[i]=false
    outBools[i]=false
  end

  onTick()
  onDraw()

  runTest(function() onTick() end, "onTick")
  runTest(function() onDraw() end, "onDraw")

  inBools[9] = true
  inValues[11] = 96
  inValues[12] = 96
  inValues[13] = 13
  inValues[14] = 14
  
  runTest(function() onTick() end, "onTick with touch input")
  runTest(function() onDraw() end, "onDraw")
  
  inBools[10] = true
  inValues[15] = 1
  inValues[16] = 1
  
  runTest(function() onTick() end, "onTick with calibration input")
  runTest(function() onDraw() end, "onDraw")
end
--[[endMinStrip]]