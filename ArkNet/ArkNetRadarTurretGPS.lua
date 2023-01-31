-- Stormworks ArkNet Radar Turret Control
-- V 01.01 b0 Michael McHenry 2022-10-07
source={"ArkNetRadGPSTurretx01g","repl.it/@mgmchenry"}

--[[

ArkNet Radar Turret Control MC Inputs and Outputs
  Col1:
    InX Radar
    InY Radar
    Cam In
    Alt Left :11
    TiltUp: 20
  Col2:
    Gunner Handle
    Copilot Seat
    Cam Out
    Alt Forwad :13
  Col3:
    Range
    Radar FOV
    Alt Right :12

  Col4:
    OutX
    OutY
    Fire
    GPS X :9

  Col5:
    Pivot Position X
    Camera FOV
    Camera Laser
    GPS Y :10
    Basic Radar In


    Forward Speed :16
    Station 1 Seat Input :1-4
    Clock In :24
    --Alt Rear :14
    Compass :15
    Station 2 Seat Input :5-8
    
    ArkNet DataLoop P1 Input :25-32
    Aux Video In
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


ArkNet Radar Turret Control luaMain Composite Inputs
  1-4:  Station 1 Seat Input
  5-8:  Station 1 Moar Axes
  9,10: Station 1 Look X,Y
  11:   Radar Range
  12:   Radar Target X
  13:   Radar Target Y
  14:   Pivot Positions X
  15:   Pivot Positions Y
  16:   Ammo Count

  21-24:Station 2 Seat Input
  25,26:Station 2 Look X,Y
  27:   Station 2 hotkey bitflags
  
    

ArkNet Host Aircraft Control luaMain Composite Outputs
  1: Pivot Out X
  2: Pivot Out Y
  3: Camera FOV
  4: Radar FOV

  Bools:
  1: Fire
  2: Laser Active?

]]

  --[[
Y 
x*d*-4-(y*abs(y)*4)-(z*2^((w-1)*4) * clamp(w,0,1))
  x:radar, y:mousey
  d: 1 - clamp(x*x*64+y*y*64+z*z*64+w*w*64,0,1)
X
x*-12*d-y-z
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

  --local radPerTurn, degPerTurn = pi * 2, 360

  local getNumber, getBool, setNumber, setBool, property_getNumber
  , format, type, string_sub
    = getTableValues(G, --prop_getText("ArkGF0")
      "input.getNumber,input.getBool,output.setNumber,output.setBool,property.getNumber,string.format,type,string.sub")

  local I, O, Ib, Ob -- composite input/output tables
    , tickCounter, screenCount, screensRendered
    , s1, s2 -- seat1, seat2
    , ts -- turretState
    -- {targetRange, targetPosX, targetPosY, azimuthPos, elevationPos, ammoCount}
    , tc -- turretControl 
    -- {}
    = {},{},{},{}
    , 0, -1, -1
    -- seat1 {axis1,...,axis6, lookX, lookY, h={hotKeys1-6,trigger,occupied}, s=sensitivity
    , {cfg={1,2,3,4,5,6,9,10},h={},s=0} -- seat1
    , {cfg={21,22,23,24,0,0,25,26,27},h={},s=0} -- seat2
    , {cfg={11,12,13,14,15}} -- turret State(range, radarX, radarY, pivotX, PivotY)
    , {0,0,0,0.125,0,0} -- tc cOutX,cOutY,camPOV,radPOV,absX, absY

    -- maybe later:
    --, gpsX, gpsY, alt, compass, forwardSpeed
    --, clock, vehicleTick

  local function init()
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
      --O[i]=I[i];Ob[i]=Ib[i]
    end

    -- ts {targetRange, targetPosX, targetPosY, azimuthPos, elevationPos, ammoCount}
    for i=1,5 do -- get turret state
      ts[i]=I[ts.cfg[i]]
    end

    Ob[1]=false -- trigger
    Ob[2]=ts[1]>8 -- laser on with radar lock

    -- tc cOutX,cOutY,camPOV,radPOV
    tc[1],tc[2]=0,0
    local cx,cy,cz = 0,0

    for si,st in ipairs({s1,s2}) do
      st.p={unpack(st)}
      for i=1,8 do
        st[i]=I[st.cfg[i]]
      end
      if st.cfg[9] then
        getFlags(I[st.cfg[9]],st.h)
      else
        st.h = {unpack(Ib,1,6)}
        st.h[7]=Ib[31]
        st.h[8]=Ib[32]
      end
      
      -- sensitivity
      if abs(st[3])>abs(st.p[3]or 0) then
        st.s = clamp(st.s+st[3]*.1,-1,1)
      end
      -- fov
      if abs(st[4])>abs(st.p[4]or 0) then
        tc[3] = clamp(tc[3]+st[4]*.1,0,1)
      end
      st[11]=4^st.s*64
      
      if st.h[2] then
        Ob[1]=Ob[1] or st.h[7]
        Ob[2]=Ob[2] or st.h[3]
        cx, cy
          = cx + clamp(st[7] * abs(st[7]) * st[11],-1,1)
          , cy + clamp(st[8] * abs(st[8]) * st[11],-1,1)
      end
    end
    
    local stickyX, stickyY = property_getNumber("StickX") or 0, property_getNumber("StickY") or 0
    cz=1-clamp(sqrt(abs(cx*cy))*2,0,.75)
    if s1.h[4] ~= s2.h[4] then cz=0 end
    tc[1]=ts[2]*-12*cz-cx
    --tc[2]=ts[3]*-4*cz-cy
    -- handle absent rotation state information for compact pivots
    if ts[3]==0 then ts[3] = tc[2] or 0 end
    tc[6]= (ts[3]*-4*cz-cy)    
    tc[2]=clamp(tc[6]*stickyY 
      + tc[6] * (stickyY>0 and 1/60 or 1)
      , -1, 1)
    
    --[[
    color[1] = property.getNumber("Red") or 1
    color[2] = property.getNumber("Green") or 1
    color[3] = property.getNumber("Blue") or 1
    color[4] = property.getNumber("Transparency") or 1
    ]]

    for i=1,6 do
      setNumber(i,tc[i])
      setBool(i, Ob[i])
    end

    screensRendered = 0
  end

--[[
    for i=1,32 do
      setNumber(i, O[i])
      setBool(i, Ob[i])
    end

]]

  do -- screen api available inside this block
    local F, setColor, drawLine
    , drawRect, drawRectF,drawTriangleF
    , screen_getWidth, screen_getHeight
    -- ,drawText,drawTextBox  
    = 255, getTableValues(screen,--prop_getText("ArkSF0")
--      "setColor,drawLine,drawCircle,drawCircleF,drawRect,drawRectF,drawTriangleF,drawText,drawTextBox,getWidth,getHeight")
      "setColor,drawLine,drawRect,drawRectF,drawTriangleF,getWidth,getHeight")

    local cSolidWhite
      , cRed, cGreen, cBlue, cMagenta
      , cWhite, cBlack
      , screenWidth, screenHeight
      , currentDrawColor, textPosX, textPosY

      -- forward function references:
      , betterSetColor, betterSetAlpha, betterDrawRect, betterDrawLineRel
      --, drawCursor
      , printText

      = {F,F,F,F}, {F,0,0}, {0,F,0}, {0,0,F}, {F,0,F}
        , {F,F,F}, {0,0,0}

    function printText(text, color)
      drawText(textPosX, textPosY, text)
      textPosY = textPosY+6
    end

function onDraw() 
	local w, h, ds = screen_getWidth(), screen_getHeight()
  local wC, hC = w/2-.5, h/2-.5

  -- seat1 {axis1,...,axis6, lookX, lookY, h={hotKeys1-6,trigger,occupied}, s=sensitivity
  ds = s1.h[8] and s1 or s2

  -- ts {targetRange, targetPosX, targetPosY, azimuthPos, elevationPos, ammoCount}
  local rng, rX, rY=unpack(ts)

  --[[
	if w < 64 then
    dStr(2,h-6,"smol")
  else
    dStr(2,h-6, w.."x"..h)
  end
  ]]
  --dStr(2,h/2+4,(ds==s1 and "Copilot" or "Gunner"))
  --dStr(2,h/2+9,format("s %.2f", ds[11]))

  local corners, c2, cx, cy, cD, cz = {1,1,-1,-1}, {1,0,-1,0}
  
  --[[
  drawLine(wC+cx+cD,hC-cy,wC+cx,hC-cy+cD)
  drawLine(wC+cx,hC-cy+cD,wC+cx-cD,hC-cy)  
  drawLine(wC+cx-cD,hC-cy,wC+cx,hC-cy-cD)
  drawLine(wC+cx,hC-cy-cD,wC+cx+cD,hC-cy)
  
  drawLine(wC+cx+cD*1 ,hC-cy+cD*0 ,wC+cx+cD*0 ,hC-cy+cD*1 )  1  0  0  1
  drawLine(wC+cx+cD*0 ,hC-cy+cD*1 ,wC+cx+cD*-1,hC-cy+cD*0 )  0  1 -1  0
  drawLine(wC+cx+cD*-1,hC-cy+cD*0 ,wC+cx+cD*0 ,hC-cy+cD*-1) -1  0  0 -1
  drawLine(wC+cx+cD*0 ,hC-cy+cD*-1,wC+cx+cD*1 ,hC-cy+cD*0 )  0 -1  1  0
  ]]

  betterSetColor(cBlack)
  betterSetAlpha(.5)
  --sensitivity, fov
  betterDrawLineRel(5,h-2,w-10,0)
  betterDrawLineRel(w-2,5,0,w-10)

  betterSetColor(cWhite)
  --sensitivity, fov
  betterDrawRect(5,h-3,(w-9)*(ds.s+1)/2,2)  
  betterDrawRect(w-3,h-4,2, (w-9)*(tc[3])*-1 )

  --Elevation tc[2]
  betterDrawLineRel(1,5,0,w-10)
  betterDrawLineRel(0,(w-9)/2,3,0)

  betterSetColor(cGreen)
  betterSetAlpha(1)
  --Elevation tc[2
  betterDrawLineRel(0,(w-9)*(tc[2]+1)/2,3,0)
  --Azimuth ts[4]
  cx,cy,cD = sin(ts[4]*pi*2), cos(ts[4]*pi*2)*-1, min(w,h)*0.45
  betterDrawLineRel(wC+cx*cD, hC+cy*cD,cx*5,cy*5)
  betterDrawLineRel(wC+cx*cD, hC+cy*cD,cy*-2,cx*2)
  betterDrawLineRel(wC+cx*cD, hC+cy*cD,cy*2,cx*-2)
  betterDrawLineRel(wC+cx*cD*.8, hC+cy*cD*.8,cx*3,cy*3)

  --wings
  betterDrawLineRel(wC-cy*cD, hC+cx*cD,cy*-4,cx*4)
  betterDrawLineRel(wC+cy*cD, hC-cx*cD,cy*4,cx*-4)


  
  for si,st in ipairs({s1,s2}) do
    if st.h[8] or st.h[4] then
      color = si==1 and cGreen or cBlue

      cy=h-6*si-6
      for i=1,8 do
        cx=i*6+2
        betterDrawRect(cx,cy,4,4,color, st.h[i])
      end   
      cx = clamp(st[7] * abs(st[7]) * 64,-1,1) * w / 2
      cy = clamp(st[8] * abs(st[8]) * 64,-1,1) * h / 2
      cD = 2.5
      
      for i,v in ipairs(c2) do
        cz=c2[i+1] or c2[1]
        drawLine(wC+cx+cD*v,hC-cy+cD*cz ,wC+cx-cD*cz,hC-cy+cD*v)
      end
    end
  end

  cD = 1.5
  betterSetColor(cRed)
  betterDrawLineRel(wC+cD,hC+1.5,2,2)
  betterDrawLineRel(wC-cD,hC-1.5,-2,-2)
  betterDrawLineRel(wC+cD,hC-1.5,2,-2)
  betterDrawLineRel(wC-cD,hC+1.5,-2,2)
  
  cD = 5
  cx = wC - clamp(rX * rX * 64,-1,1) * w / 2
  cy = hC - clamp(rY * rY * 64,-1,1) * h / 2

  color = s1.h[4] ~= s2.h[4] and cBlue
    or rng>1 and cGreen
    or cRed
    
  betterSetColor(color)

  for i,v in ipairs(corners) do
    cz=corners[i+1] or 1
    betterDrawLineRel(cx+cD*v,cy+cD*cz,0,-2*cz)
    betterDrawLineRel(cx+cD*v,cy+cD*cz,-2*v,0)
  end

	--input.getNumber(2)
end

--[[
    function drawCursor(touchX, touchY, touchOn)
      betterSetAlpha(.5)
      betterDrawLineRel(touchX,touchY,0,0,cWhite)
      if touchOn then
        betterDrawLineRel(touchX-1,touchY-1,2,2,cWhite)
        betterDrawLineRel(touchX-1,touchY+1,2,-2,cWhite)
      end

      betterSetAlpha(1)
    end
--]]    
    
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


--[[minStrip]]
note={"Unit tests start here"}
function onTest(inValues, outValues, inBools, outBools, runTest)
  for i=1,32 do
    inValues[i]=0
    outValues[i]=0
    inBools[i]=false
    outBools[i]=false
  end

  --onTick()
  --onDraw()

  runTest(function() onTick() end, "onTick")
  runTest(function() onDraw() end, "onDraw")

  inBools[1] = true
  inBools[2] = true
  inBools[32] = true
  
  runTest(function() onTick() end, "onTick with touch input")
  runTest(function() onDraw() end, "onDraw")
  
  inBools[3] = true
  inBools[4] = true
  --inValues[15] = 1
  --inValues[16] = 1
  
  runTest(function() onTick() end, "onTick with calibration input")
  runTest(function() onDraw() end, "onDraw")
end
--[[endMinStrip]]