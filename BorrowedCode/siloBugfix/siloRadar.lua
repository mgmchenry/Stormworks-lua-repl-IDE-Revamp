radartbl = {{}, {}, {}, {}, {}, {}, {}, {}} --Radar targets
radarbool = {false, false, false, false, false, false, false, false}
scale = 25
local maxR,minR = 25, 25
function onTick() --Executes every stormworks logic tick
    --scale = scale + .5 --Increases scale by .2 each logic tick
    --scale = math.floor(scale/.5+.5)*.5 --Rounds the scale to every .2 to prevent float deviation
    --scale2 = math.floor(scale/50+.5)*50 --Makes the final scale a multiple of 50
	maxR,minR = 25, 25
  for i = 1, 8 do
    radartbl[i][1] = input.getNumber(i*4-3) --Distance from radar to the target (Meters)
    radartbl[i][2] = input.getNumber(i*4-2)*(math.pi*2) --Azimuth angle from the radar to the target (Turns)
    radartbl[i][3] = input.getNumber(i*4-1)*(math.pi*2) --Pitch from the radar to the target (Turns)
    radarbool[i] = input.getBool(i)
    if radartbl[i][1]>0 then
      maxR = math.max(maxR, radartbl[i][1])
      minR = math.min(minR, radartbl[i][1])
    end
  end
  scale2 = math.floor(maxR/25)*25+25
  if math.abs(scale-scale2) < 2 then
	  scale = scale2
	elseif scale > scale2+50 then
		scale = scale * .98
	else		
		scale = scale+(scale2-scale)*0.1
  end
end
function onDraw()
  sw = screen.getWidth()
  sh = screen.getHeight()
	rw = math.floor(sw/4)
  topView = {rw,sh/2}
  sideView = {rw*3,sh/2}
  screen.setColor(0, 255, 255)
  screen.drawRectF(topView[1]-2, topView[2]-5, 5, 11)
  screen.drawRectF(sideView[1]-5, sideView[2]-2, 10, 5)
  screen.drawText(0, 0, string.format('Range: %0.0f meters',scale))
  screen.drawLine(sw/2, 0, sw/2, 160)
  screen.setColor(0, 255, 255)
  
	ringw = math.max(math.floor(scale/5/50)*50,25)
  for i = 50, scale-25, ringw  do
    screen.drawCircle(topView[1], topView[2],i/scale*rw)
    screen.drawText(topView[1], topView[2] - i/scale*rw, i.."m")
  end
    for i = 1, 8 do
        if radarbool[i] then
            local x1 = ((radartbl[i][1]/scale)*rw)*math.sin(radartbl[i][2]) --Distance from radar to the target (Meters) * Cos(Azimuth angle)
            local y1 = ((radartbl[i][1]/scale)*rw)*math.cos(radartbl[i][2]) --Distance from radar to the target (Meters) * Sin(Azimuth angle)
            local x2 = ((radartbl[i][1]/scale)*rw) 
            local y2 = ((radartbl[i][1]/scale)*rw)*math.sin(radartbl[i][3]) --Distance from radar to the target (Meters) * Sin(Pitch)
            screen.setColor(255, 0, 0)
            screen.drawCircleF(topView[1] +x1, topView[2] -y1, 2)
            screen.drawCircleF(sideView[1] -x2, sideView[2] -y2, 2)
        end
    end
end


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

  
  for i=0,7 do
    inBools[i+1]=true
    inValues[i*4+1] = i*7.2
    inValues[i*4+2] = i*0.04
    inValues[i*4+3] = i*0.02   
  end
  
  runTest(function() onTick() end, "onTick with radar input")
  runTest(function() onDraw() end, "onDraw")
  
  for i=4,7 do
    inBools[i+1]=false
    inValues[i*4+1] = 0
    inValues[i*4+2] = 0
    inValues[i*4+3] = 0
  end
  
  runTest(function() onTick() end, "onTick with less radar input")
  runTest(function() onDraw() end, "onDraw")
end
--[[endMinStrip]]