-- Stormworks ArkNet GPS Radar Integrator
-- V 00.01 b0 Michael McHenry 2022-12-10

--[[minStrip]]
  -- minify helping property text assignments
	-- ArkNetGPSRadarIntegrator.lua
if propValues then
  propValues["ArkGF0"] =
    "input.getNumber,input.getBool,output.setNumber,output.setBool,property.getNumber,string.format,type,string.sub"
    --"input.getNumber,input.getBool,output.setNumber,output.setBool,string.format,type,map.screenToMap,map.mapToScreen"
  -- ArkMF0 = abs,min,max,sqrt,ceil,floor,sin,cos,atan,pi
  -- ArkMFb = abs,min,max,sqrt,ceil,floor,sin,cos,atan,asin,pi
  propValues["ArkMFc"] =
    "abs,min,max,sqrt,ceil,floor,sin,cos,tan,atan,asin,pi"
  propValues["ArkSF0"] =
    "setColor,drawLine,drawRect,drawRectF,drawTriangleF,drawText,drawTextBox,getWidth,getHeight"
end
  --was:"setColor,drawLine,drawCircle,drawCircleF,drawRect,drawRectF,drawTriangleF,drawText,drawTextBox,getWidth,getH33eight"
--[[endMinStrip]]
-- Stormworks ArkNet GPS Radar Collector
-- V 00.01 b0 Michael McHenry 2022-12-10
source={"ArkNetGPSRadarIntx01a","repl.it/@mgmchenry"}

--[[




]]

local G, prop_getText, gmatch --, unpack
  , ipairz, commaDelimited --, empty
  , luaType_string, luaType_table, luaType_number
  --, nilzies -- nilzies not assigned by design - it's just nil but minimizes to one letter

  , stringUnpack, getTableValues, clamp, plop -- deferred utility function definitions

	= _ENV, property.getText, string.gmatch --, table.unpack
  , ipairs, '([^,\r\n]+)' --, false
  , "string", "table", "number"

local unpack, insert, remove 
  = G[luaType_table].unpack
  , G[luaType_table].insert
  , G[luaType_table].remove

function main()
  local abs,min,max,sqrt,ceil,floor,sin,cos,tan,atan,asin,pi
    = getTableValues(math, 
      prop_getText("ArkMFc")
      --"abs,min,max,sqrt,ceil,floor,sin,cos,tan,atan,asin,pi"
    )
  _ = floor(pi)==3 or pi() -- sanity check

  local getNumber,getBool,setNumber,setBool,prop_getNumber,format,type,string_sub
    = getTableValues(G, 
      prop_getText("ArkGF0")
      --GF0:"input.getNumber,input.getBool,output.setNumber,output.setBool,property.getNumber,string.format,type,string.sub"
    )

  local tau, degPerTurn
    , numberList 
    = pi * 2, 360
    , {}
  for i=1,30 do numberList[i]=i end

  local I, O, Ib, Ob -- composite input/output tables
    , tickCounter, mcClock
    --, screenConfig
    , screenCount, screensRendered
    , camFov,pivotX,pivotY
    --, sync
    = {},{},{},{} -- composite input/output tables
    , 0, -1 -- tickCounter, mcClock
    --, {} -- screenConfig
    , -1, -1 --screenCount, rendered

  --[[
  local -- data index names
    inputConfig
    -- sensor inputs

    , turretX, turretY, cameraFov -- 22, 23, 24
    , _gpsX, _gpsY, _gpsZ -- 25, 26, 27
    , _tiltX, _tiltY, _tiltZ -- 28, 29, 30    
    , _compassY, _mcClock -- 31, 32
    = {??}
    , unpack(numberList)
  ]]

  local sampleCount, bufferCursor, dataSamples
    , rm, targets, contacts
    , lastTickData, thisTickData
    = 60, 0, {}
    , {}, {}, {}

  -- forward function declarations    
  local addVec3, mulMat3Vec3, invMat3, vecLength

  --function init()
    --touchDevices[1] = createTouchInput(1,9,10,11,12,13,14,15,16)
    --touchDevices[2] = createTouchInput(3,25,26,23,24,25,26,27,28)
  --end

  --[[
  function getFlags(flags, result, _bit)
    result = result or {}
    for i=1,8 do
      _bit = 2^(i-1)
      result[i] = flags % (_bit*2) >= _bit
    end
    return result
  end
  ]]

  function addVec3(v1, v2, scale, _retVec)
    _retVec,scale = (_retVec or {}),scale or 1
    _retVec[1],_retVec[2],_retVec[3]
      = v1[1]+v2[1]*scale
      , v1[2]+v2[2]*scale
      , v1[3]+v2[3]*scale
    return _retVec
  end
  
  function mulMat3Vec3(rm, vec3, _retVec, _x, _y, _z)
    _retVec, _x, _y, _z = (_retVec or {}), unpack(vec3)
    for i=1,3 do
      _retVec[i]= _x*rm[i]+_y*rm[i+3]+_z*rm[i+6]
    end
    --[[_retVec[1],_retVec[2],_retVec[3]
      = _x*rm[1]+_y*rm[4]+_z*rm[7]
      , _x*rm[2]+_y*rm[5]+_z*rm[8]
      , _x*rm[3]+_y*rm[6]+_z*rm[9] ]]
    return _retVec
  end
  function invMat3(rm, _retInv, _v1)
    _retInv, _v1 = _retInv or {}, {unpack(rm)}
    for i=0,2 do for j=0,2 do
      _retInv[1+i+j*3]= _v1[1+j+i*3]
    end end
    --[[_retVec[1],_retVec[2],_retVec[3]
      = _x*rm[1]+_y*rm[4]+_z*rm[7]
      , _x*rm[2]+_y*rm[5]+_z*rm[8]
      , _x*rm[3]+_y*rm[6]+_z*rm[9] ]]
    return _retInv
  end
  function vecLength(vec, _l)
    for _,v in ipairz(vec) do
      _l = (_l or 0)+v*v
    end
    return sqrt(_l)
  end
--[[
function reverseSortTableOnElement(someTable, elementIndex)
  table.sort(someTable, function (s1, s2) 
    return (s1[elementIndex] or 0) > (s2[elementIndex] or 0) end) -- > reverse sort, largest first
end
]]

  function onTick()  
    screenCount = screensRendered
    tickCounter = tickCounter + 1
    I[0]=0
    for i=1,32 do -- load composite input array and copy to output array for pass-through
      I[i]=getNumber(i);Ib[i]=getBool(i)
      O[i]=I[i];Ob[i]=Ib[i]
    end
    --[[
    , turretX, turretY, cameraFov -- 22, 23, 24
    , _gpsX, _gpsY, _gpsZ -- 25, 26, 27
    , _tiltX, _tiltY, _tiltZ -- 28, 29, 30    
    , _compassY, _mcClock -- 31, 32
    ]]
    
    pivotX,pivotY,camFov
      , mcClock
      = getTableValues(I,{22,23,24,32})
    --sync = mcClock % 4
    
    lastTickData = dataSamples[bufferCursor] or {}
    bufferCursor = bufferCursor%(sampleCount-1) +1
    thisTickData = dataSamples[bufferCursor] or {d={}, t={}, td={}}
    dataSamples[bufferCursor] = thisTickData

    --[[
    for iDataType, inputIndex in ipairz(inputConfig) do
      thisTickData[iDataType] = I[inputIndex]
    end
    ]]

    targets = {}
    do
      local gX, gY, gZ
        , tX, tY, tZ
        , cY
        = getTableValues(I,{25,26,27,28,29,30,31})
          --getTableValues(I,{4,8,12,16,20,24,28})
      
    --[[
    , turretX, turretY, cameraFov -- 22, 23, 24
    , _gpsX, _gpsY, _gpsZ -- 25, 26, 27
    , _tiltX, _tiltY, _tiltZ -- 28, 29, 30    
    , _compassY, _mcClock -- 31, 32
    ]]

	    --local i,x,y,z,c,s,m=2,sin(tau*gn(1)),sin(tau*gn(2)),sin(tau*gn(3))
    	--for j=2,3 do if abs(gn(i))>abs(gn(j))then i=j end end
    	local newContacts
        ,x,y,z
        ,s,c
        , newContact
        = {}
        ,sin(tau*tX),sin(tau*tY),sin(tau*tZ)
        ,tau*cY -- default compass is cY
      
    	--if i<2 then
    	--    m=sqrt(z*z+y*y)m={0,-z/m,y/m;m,-x*y/m,-x*z/m;x,y,z}
    	
      --elseif i<3 then

      --m=sqrt(x*x+z*z)m={z/m,0,-x/m;-y*x/m,m,-y*z/m;x,y,z}
      rm=sqrt(x*x+z*z)
      --[[m={
        z/m,0,-x/m;
        -y*x/m,m,-y*z/m;
        x,y,z
      }]]
      rm={
        z/rm,-y*x/rm,x;
        0,rm,y;
        -x/rm,-y*z/rm,z
      }

      --[[
    	if abs(tY)<abs(tZ) or cZ==0 then
    	  m=sqrt(x*x+z*z)m={z/m,0,-x/m;-y*x/m,m,-y*z/m;x,y,z}
    	else
    		--use compass Z
    	  m=sqrt(y*y+x*x)m={-y/m,x/m,0;-z*x/m,-z*y/m,m;x,y,z}
        s=tau*cZ
    	end
      ]]
    	c=cos(s)s=sin(s)
      
	    --for j=1,3 do m[j],m[j+3]=c*m[j]-s*m[j+3],s*m[j]+c*m[j+3]end
      for j=1,7,3 do rm[j],rm[j+1]=c*rm[j]-s*rm[j+1],s*rm[j]+c*rm[j+1]end
	    --local px=-gpsx*m[1]-gpsy*m[2]-gpsz*m[3]+gn(7)
    	--local py=-gpsx*m[4]-gpsy*m[5]-gpsz*m[6]+gn(8)
    	--local pz=-altx*m[7]-alty*m[8]-altz*m[9]+gn(9)
      --rm = m --{getTableValues(m,{1,4,7,2,5,8,3,6,9})}
      rm.p = {gX, gY, gZ}
    end

    -- calculate delta rate of change per second
    --[[
    for dataType=1,0 do --_altC, _mcTick do
      thisTickData.d[dataType] = 
        ((thisTickData[dataType] or 0)
         - (lastTickData[dataType] or 0))
        * 60 -- change per second
    end
    ]]

    
    for i=1,32 do
      setNumber(i, O[i])
      setBool(i, Ob[i])
    end
    screensRendered = 0
  end

  do -- screen api available inside this block
    local F
      , setColor, drawLine
      , drawRect, drawRectF,drawTriangleF,drawText,drawTextBox
      , screen_getWidth, screen_getHeight  
      -- removed: , drawCircle, drawCircleF
      = 255, getTableValues(screen,
        prop_getText("ArkSF0")
        --SF0:"setColor,drawLine,drawRect,drawRectF,drawTriangleF,drawText,drawTextBox,getWidth,getHeight"
        --was:"setColor,drawLine,drawCircle,drawCircleF,drawRect,drawRectF,drawTriangleF,drawText,drawTextBox,getWidth,getHeight")
      )      

    local cSolidWhite
      , cRed, cGreen, cBlue, cMagenta
      , cWhite, cBlack
      , screenWidth, screenHeight
      , currentDrawColor, textPosX, textPosY

      -- forward function references:
      , betterSetColor, betterSetAlpha, betterDrawRect, betterDrawLineRel
      , drawCross, printText

      = {F,F,F,F}, {F,0,0}, {0,F,0}, {0,0,F}, {F,0,F}
        , {F,F,F}, {0,0,0}

    function printText(text, color)
      drawText(textPosX, textPosY, text)
      textPosY = textPosY+6
    end

    
      --[[
      Camera FOV functions from quale
      -- Vertical FOV in radians
        local fov_min = 2.2
        local fov_max = 0.025
        local fov_small_camera = 1.22
        
        local function zoom_to_fov(zoom)
            return zoom * (fov_max - fov_min) + fov_min
        end
        
        local function fov_to_zoom(fov)
            return (fov - fov_min) / (fov_max - fov_min)
        end

      From Stonelabs: https://discord.com/channels/357480372084408322/578586360336875520/1041015553634078751
      function LocalSpaceToScreenSpace(local_x, local_y, local_z, fov)
        fov_rad = fov * (0.025 - 2.2) + 2.2      -- camera fov in radians (min 2.2 rad, max 0.025 rad)
        
        monitor_width = 64
        monitor_height = 64
        center_x = monitor_width / 2
        center_y = monitor_height / 2
    
        border = 0.022
        aspect = (center_x - 128 * border) / (center_y - 128 * border)
        fov_y = math.tan(fov_rad / 2)
        fov_x = fov_y * aspect
    
        screenspace_x = center_x * (1 + local_x / local_z / fov_x)
        screenspace_y = center_y * (1 + local_y / local_z / fov_y)
    
        return screenspace_x, screenspace_y
      end
      ]]

    local widestScreen = 0
    local cMat = nil
    function onDraw()
      screensRendered = screensRendered + 1
      screenCount = max(screensRendered, screenCount)
      screenWidth, screenHeight = screen_getWidth(), screen_getHeight()
      widestScreen = max(screenWidth, widestScreen)
      local isWidestScreen = screenWidth==widestScreen

      local screenFov = {
        screenWidth/2-.5
        , screenHeight/2-.5
        , 2.2-camFov*2.175 -- fov_rad
      }
      screenFov[4] -- fov_y
        = 1/tan(screenFov[3]/2)
      screenFov[5] = screenFov[4] * screenHeight -- Probably not saving time or space with this
      screenFov[6] = screenWidth/screenHeight -- aspect ratio
      
      --[[
      screenFov[5] -- fov_y
        = 1/tan(screenFov[3]/2)
      screenFov[4] -- fov_x
        = screenFov[5] * --(aspect)
          screenFov[1] -- ignoring border for now
          / screenFov[2] -- again ignoring border
      ]]

      betterSetColor( cSolidWhite)
      --betterSetAlpha(.5)
      --drawRectF(0, 0, screenWidth/2, screenHeight/2)

      --betterSetAlpha(1)
      betterSetColor(cRed)--cBlue)
      textPosX, textPosY = 2, 4
      --printText(format("Screen %i/%i" ,screensRendered, screenCount))
      if screensRendered < 2 then
        cMat = invMat3(rm)
        cMat.p = addVec3({0,0,0},rm.p,-1)
      end
        -- {-rm.p[1], -rm.p[2], -rm.p[3]}
      betterSetColor(#targets>0 and cGreen or cWhite)
      --printText(format("FOV %0.2f:%0.0fdeg",camFov,screenFov[3]/pi*180))
      local rid=4
      textPosY = textPosY+6*rid
      --printText(format("Targets %i",#targets))
      printText(format("Intv01 Contacts %i",#contacts, #targets))
      --printText(format("Pivot %0.2f,%0.2f",pivotX,pivotY))

      --if screensRendered==1 and screenConfig[2] and false then
        betterSetColor(cGreen)
        drawCross(screenFov[1],screenFov[2])

      
      local baseColor=cRed
      if rid==1 then
        baseColor=cGreen
      elseif rid==2 then
        baseColor=cBlue
      end

      if rid>-1 and isWidestScreen then
        betterSetColor(baseColor)
        for i,t in ipairz(targets) do
          local tCam, isClipped, x, y
            = mulMat3Vec3(cMat, addVec3(t, cMat.p))
          --tCam=addVec3({screenFov[1],screenFov[2]})
          x, y
            = screenFov[1]+ tCam[1]/tCam[2]*screenFov[4]*screenHeight/2
            , screenFov[2]- tCam[3]/tCam[2]*screenFov[4]*screenHeight/2
          local contact = t.c
          local parent = contact.parent
          if parent then
            betterDrawLineRel(x,y,0,1)
          else
            betterDrawLineRel(x-1,y,2,0)
          end
          --drawText(x,y-2, format("%i %0.1fm",i,t.d))
        end
      end

      local boxes = {}
      for i,c in ipairz(isWidestScreen and contacts or {}) do
        local tCam, isClipped, dX, dY, dR
          = c.p.pCam or {}
          --= addVec3(c.p, cMat.p)
          --mulMat3Vec3(cMat, tCam, tCam)
        
        if tCam.cMat~=cMat then
          tCam.cMat = cMat
          c.p.pCam = tCam
          mulMat3Vec3(cMat, addVec3(c.p, cMat.p), tCam)
        end

        dX, dY, dR =
          tCam[1]/tCam[2]*screenFov[4]
          , tCam[3]/tCam[2]*screenFov[4]
          , 3/tCam[2]*screenFov[5]  --/screenFov[4]*screenWidth/2
      
        --[[if i<3 and rid>3 then
          local f3 = "%0.2f %0.2f %0.2f"
          printText(format("%i "..f3,i,dX,dY,dR))--,tCam[2]))
          printText(format("   i%i #h%i mx  %0.2f", c.i or -1, #c.h,c.x or -1))
          printText(format("   maxD: %0.2f %0.0fm minD: %0.2f %0.0fm", c.md/c.d, c.md, c.ld/c.d, c.ld))
        end]]
        
        local parent = c.parent

        if tCam[2]>0 then
        --sA=c and vecLength(addVec3(tXYZ,c.h[1],-1))
          --[[ gratuitous debug text:
          printText(format(" r  "..f3,I[i*4-2],I[i*4-1],I[i*4-3]))
          printText(format(" t  "..f3,unpack(t)))
          printText(format(" l  "..f3,unpack(addVec3(t, cMat.p))))
          printText(format(" c  "..f3,unpack(tCam)))
          ]]
          
          isClipped = abs(dX)>.95*screenFov[6] or abs(dY)>.95
          if isClipped then
            dX, dY =
              clamp(dX,-.95*screenFov[6],.95*screenFov[6])
              , clamp(dY,-.95,.95)
          end
          
          dX, dY =
            --screenFov[1]+ clamp(dX  ,-.95,.95)*screenWidth/2
            screenFov[1]+ dX*screenHeight/2
            --, screenFov[2]- clamp(dY,-.95,.95)*screenHeight/2
            , screenFov[2]- dY*screenHeight/2

          local isBoxed = false        
          for _,b in ipairz(boxes) do
            --isClipped= isClipped or sqrt((b[1]-dX)^2+(b[2]-dY)^2)<b[3]+dR
            --if isClipped then break end
            isBoxed = sqrt((b[1]-dX)^2+(b[2]-dY)^2)<b[3]+dR
            if isBoxed then 
              break 
            end
          end
          if not isBoxed then            
            insert(boxes,{dX,dY,dR})
          end

          local debugSquiggles = 0
          if rid<1 and debugSquiggles<0 and isWidestScreen 
            and not (parent or isBoxed or isClipped) then
            debugSquiggles = debugSquiggles+1
            betterSetAlpha(.6)
            local anim = (mcClock%180)/180              
            local hMin = clamp(59-floor(60*anim*3),1,59)
            local hMax = clamp(120-floor(60*anim*3),2,60)
            if i<2 then
              --printText(format("   anim %0.2f hMin:%i hMax:%i", anim, hMin, hMax))
            end
            local x1, y1
            for ih=hMax, hMin, -1 do
              local h=c.h[ih] or {0,0,0}
              local hCam, isClipped, x0, y0
                = mulMat3Vec3(cMat, addVec3(h, cMat.p))
              x0, y0 
                = screenFov[1]+ hCam[1]/hCam[2]*screenFov[4]*screenHeight/2
                , screenFov[2]- hCam[3]/hCam[2]*screenFov[4]*screenHeight/2
              if x1 then
                betterDrawLineRel(x1,y1,x0-x1,y0-y1,cBlue)
              elseif i<2 then
                printText(format("   x0:%0.0f y0:%0.0f", x0, y0))
              end

              x1,y1 = x0,y0
            end
            betterSetAlpha(1)
          end
          
          --betterSetColor(rid<1 and cRed or cGreen)
          betterSetColor(baseColor)
          if parent then
            betterDrawLineRel(dX-1,dY,2,0)            
            betterDrawLineRel(dX,dY-1,0,2)
          elseif isBoxed then
            betterDrawLineRel(dX-1,dY-1,2,2)
          elseif isClipped then
            local lineLen = clamp(dR,3-rid,6-rid)            
            betterDrawLineRel(dX-lineLen,dY,2*lineLen,0)            
            betterDrawLineRel(dX,dY-lineLen,0,2*lineLen)
          else --if rid>0 or i<2 then            
            drawCross(dX,dY,clamp(dR,3-rid,6-rid))
            --betterDrawLineRel(screenFov[1],screenFov[2]+.5,dX,dY)
            
            if rid<1 then            
              betterSetColor(cWhite)
              betterDrawRect(dX-dR,dY-dR,dR*2,dR*2)
            end
          
            drawText(dX-10,dY+6, format("%i %0.0fm",i,c.d))
            if c.m and rid<1 then
              drawText(dX-10,dY+12, format("%0.1fT",i,c.m))
            end
            --if c.children and rid<4 then
            if c.childCount then
              drawText(dX-10,dY+18, format("c %i",c.childCount)) --maxChildren))
            end
          end
          --drawText(screenFov[1]+dX,screenFov[2]+.5+dY, format("%i",i))
          --drawText(dX-10,dY+6, format("%i %0.2fkm",i,t.d/1000))
          --drawText(dX-10,dY+6, format("%i %0.0fm",i,t.d))
        end
      end
    end
    --[[ End onDraw]]
    
    function drawCross(centerX, centerY, len, gap)
      len, gap = len or 1, gap or 1.5
      betterDrawLineRel(centerX +gap,centerY +gap,len,len)
      betterDrawLineRel(centerX -gap,centerY -gap,-len,-len)
      betterDrawLineRel(centerX +gap,centerY -gap,len,-len)
      betterDrawLineRel(centerX -gap,centerY +gap,-len,len)        
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

  --return init
end


--[[
function inject(destination, ...)
  destination = destination or {}
  for i, stuffing in ipairz({...}) do
    stuffing = type(stuffing)==tableType and stuffing or {stuffing}
    for i2=1,#stuffing do
      destination[#destination+1] = stuffing[i2]
    end
  end
  return destination
end
]]
clamp, plop, stringUnpack, getTableValues =

function --[[clamp]]
(a,b,c) return b>a and b or c<a and c or a end
--min(max(a,b),c) end
,
--function --[[sign]]
--(n) return n < 0 and -1 or n > 0 and 1 or 0 end
--,
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

main()--()

--[[minStrip]]
note={"Unit tests start here"}
function onTest(inValues, outValues, inBools, outBools, runTest)
  for i=1,32 do
    inValues[i]=i
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