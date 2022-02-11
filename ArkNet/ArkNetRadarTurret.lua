-- Stormworks ArkNet Radar Turret Control
-- V 01.01 b0 Michael McHenry 2022-10-07
source={"ArkNetRadTurretx01c","repl.it/@mgmchenry"}

--[[
ArkNet Theory:
ArkNet allows communications between vehicles, systems, hosts, and networks

Vehicle: a single mechanically linked body that allows direct wiring between all vehicle components

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

  local getNumber, getBool, setNumber, setBool, format, type, string_sub
    = getTableValues(G, --prop_getText("ArkGF0")
      "input.getNumber,input.getBool,output.setNumber,output.setBool,string.format,type,string.sub")

  local I, O, Ib, Ob -- composite input/output tables
    , tickCounter
    , vAltHold, vAltHoldOn
    , screenCount, screensRendered
    , uiState
    , seat1, seat2, gpsX, gpsY
    , altL, altR, altF, altB, tiltUp
    , compass, forwardSpeed, lookX, lookY, hotKeys
    , clock, vehicleTick
    , lastTriggerClick
    , pilotLookX, pilotLookY, lookTrigger, triggerClick
    , sAlt, sPitch, sRoll
    , sasPitch, sasRoll
    = {},{},{},{}
    , 0 -- tickCounter
    , 100, false -- vAltHold
    , -1, -1, {}
    
  --local controlPitch, canardPitch, controlRoll, controlYaw
  local color, range, mon
    = {}, 0, 0

  -- forward function declarations    
  local createTouchInput, updateTouchInput, checkTouchStart

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
	range = input.getNumber(1)
	mon = property.getBool("1x1 Monitor")
	
	color[1] = property.getNumber("Red") or 1
	color[2] = property.getNumber("Green") or 1
	color[3] = property.getNumber("Blue") or 1
	color[4] = property.getNumber("Transparency") or 1
	
end

--[[
  function onTickx()  
    screenCount = screensRendered
    tickCounter = tickCounter + 1
    
    for i=1,32 do -- load composite input array and copy to output array for pass-through
      I[i]=getNumber(i);Ib[i]=getBool(i)
      O[i]=I[i];Ob[i]=Ib[i]
    end

    seat1, seat2
      , gpsX, gpsY, altL, altR, altF, altB -- I[9] ... I[14]
      , compass, forwardSpeed, pilotLookX, pilotLookY, hotKeys -- I[15]...I[19]
      , tiltUp, _, _, _ -- 20-23
      , clock, vehicleTick
      = {unpack(I,1,4)}
      , {unpack(I,5,8)}
      , unpack(I,9,25)

    hotKeys = getFlags(hotKeys)    
    --playerLookX, playerLookY = getTableValues(I, {9,10})
    lookTrigger, triggerClick = hotKeys[7], lookTrigger
    triggerClick = lookTrigger and not triggerClick
    if triggerClick then
      lastTriggerClick = {pilotLookX, pilotLookY}
    end

    sAlt = (altL+altR)/2
    sPitch = math.asin((altF-sAlt)*2)/pi/2
    sRoll = math.asin((altL-sAlt)*2 / cos(sPitch))/pi/2

    mouseControl = hotKeys[1] and 1 or 0
    controlRoll = seat1[1] + seat2[1] 
    controlPitch = seat1[2] + seat2[2]
      - clamp(mouseControl * pilotLookY * abs(pilotLookY) * 32, -.5, .5)
    controlYaw = seat1[3] + seat2[3]
      + clamp(mouseControl * pilotLookX * abs(pilotLookX) * 32, -.5, .5)

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
]]

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

    
local font34
-- function names:
  , dDot, dChar, dStr

= {
0x0D0,0xC0C,0xFAF,0x2F4,0xB2D,0x6F5,0x0C0,0x690,0x096,0xAEA,0x4E4,0x560,0x444,0x010,0x168,0x79E,0x5F1,
0x9B5,0x9DA,0x6F2,0xDDA,0x6DA,0x9AC,0x3FC,0x4A7,0x050,0x1A0,0x44A,0xAAA,0xA44,0xA41,0x69D,0x7A7,0xFD6,
0x699,0xF96,0xFD9,0xFA8,0x69B,0xF2F,0x9F9,0x19E,0xF4B,0xF11,0xF4F,0xF6F,0x696,0xFA4,0x6B7,0xFA5,0x5BA,
0x8F8,0xE1E,0xC3C,0xF5F,0x969,0xC7C,0xBD9,0xF90,0x861,0x09F,0x484,0x111,0x084,0x2F9,0x0F0,0x9F4,0x462}

function dDot(x,y)
	screen.drawLine(x,y,x,y+1)
end

function dChar(x,y,char)
	c=string.byte(string.upper(char))-32
	if c>64 then c=c-26 end
	if c>0 and c<69 then
		for i=0,11 do
			if font34[c]&(1<<(11-i))>0 then dDot(x+i//4, y+i%4) end
		end
	end
end

function dStr(x,y,str)
	cs=string.len(str)
	for i=0,cs-1 do
		dChar(x+4*i,y,string.sub(str,i+1,i+1))
	end
end


function onDraw() 
	w = screen_getWidth()
	h = screen_getHeight()
	--screen.setColor(color[1],color[2],color[3],color[4])
  betterSetColor(color)
	if mon ~= true then
		dStr(w/2+5,h/2+4,"RNG:")
		dStr(w/2+20,h/2+4,floor(range))
	else
		dStr(w/2+5,h/2+4,"RNG")
		dStr(w/2+5,h/2+9,floor(range))
	end
	drawLine(w/2,0,w/2,h)
	drawLine(0,h/2,w,h/2)
	--input.getNumber(2)
end

--[[
    function onDrawx()
      screensRendered = screensRendered + 1
      screenCount = max(screensRendered, screenCount)
      screenWidth, screenHeight = screen_getWidth(), screen_getHeight()

      betterSetColor(cSolidWhite)
      betterSetAlpha(.5)
      drawRectF(0, 0, screenWidth/2, screenHeight/2)

      betterSetAlpha(1)
      betterSetColor(cBlue)
      textPosX, textPosY = 2, 4
      --printText(format("Screen %i/%i" ,screensRendered, screenCount))
      betterSetColor(lookTrigger and cGreen or cWhite)
      printText(format("%.2f,%.2f", pilotLookX*360, pilotLookY*360))
      printText(format("Pit: %.2f", sPitch * 360))
      printText(format("Rol: %.2f", sRoll * 360))
      printText(format("Alt: %.2f", sAlt))
      betterSetColor(vAltHoldOn and cGreen or cWhite)
      printText(format("AHold: %.2f", vAltHold))
      printText(format("P: %.2f=%.2f+%.2f", controlPitch, controlPitch - sasPitch, sasPitch)) 
      
      
      if lastTriggerClick and lastTriggerClick[1] then
        printText( format("%.2f,%.2f", lastTriggerClick[1]*360, lastTriggerClick[2]*360))
      end
    end
    ]]
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

clamp, plop, stringUnpack, getTableValues =

function --[[clamp]](a,b,c) return b>a and b or c<a and c or a end--min(max(a,b),c) end
,
function --[[plop]](...) -- optionally plop(boolean_returnNewSource, returnTable, ...)
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
function --[[getTableValues]](container, valueList, local_returnVals, local_startIndex, local_context)
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