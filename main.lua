-- Stormworks Lua module Test Helper Example Thing
-- V 0.4 Michael McHenry 2019-06-07
os.execute("clear")

inValues, outValues, inBools, outBools = {}, {}, {}, {}

-- Set up SW environment

local swAPI = dofile("Stormworks_Stub.lua")
print("swAPI", type(swAPI), tostring(swAPI))

_ = nil
_G["_"] = nil

--dofile("QuadFlightControl.V0.07.15.lua")
--dofile("ScaleController.V2.lua")
--dofile("QuadFlightControl.V0.09.18.lua")

--dofile("FlightControl/QuadTiltFlightControl.V0.TinySig.lua")
--dofile("Experiments/keyInputAxisInfo.lua")

local buildFiles = {
--  {baseFile = "ArkNet/ArkNetHostAircraftControl"}
--  {baseFile = "ArkNet/ArkNetRadarTurretGPS"} 
  {baseFile = "ArkNet/ArkNetGPSRadarScienceLab"}
 , {baseFile = "ArkNet/ArkNetGPSRadarIntegrator"}
--  , {baseFile = "ArkNet/ArkNetRadarTurretGPSDisplay"}
}

ArkLuaLoadFile = "nope"


local minify = dofile("BorrowedCode/stravant_luaMinify.lua")

for i, buildFile in ipairs(buildFiles) do
  do
    -- todo: make these work local proper  
    -- local 
    ArkLuaLoadFile = buildFile.baseFile .. ".lua"
    --local 
    onTest = function() print("no tests defined for " .. ArkLuaLoadFile) end
    --local minify = nil

    dofile("Experiments/loaderMC.lua")

    buildFile.onTest = onTest
  end
  do    
    buildFile.onTest(inValues, outValues, inBools, outBools, runTest)

    local baseFile, minFile,err
      = buildFile.baseFile .. ".lua"
      , io.open( buildFile.baseFile .. ".min.lua", "wb" )
      
    if err then return err end
    minFile:write("--minifying \n")

    minify("minify", baseFile, minFile)

    minFile:write( "--minified \n" )
    minFile:close()
  end
end

--dofile("ArkNet/ArkNetMCBootstrap.lua")
--dofile("Experiments/CompositeDebugDisplay.lua")
--dofile("Experiments/SWGlobals.lua")
--dofile("NavSuite/ArkBeaconDisplay.lua")
--dofile("FlightControl/QuadTiltFlightControl.V0.Dev.lua")
--dofile("FlightControl/QuadTiltFlightControl.V0.Signals.lua")
--dofile("FlightControl/QuadTiltFlightControl.V0.Signals.PreMinify.lua")
--dofile("FlightControl/SW_FlightVis.lua")
--dofile("RailPulseEncoder.lua")
--dofile("OnOffDecoder.lua")

--runTest(function() onTick() end, "onTick")
--runTest(function() onDraw() end, "onDraw")
-- Those return without doing anything because inValues are nil

-- Set an inValue so it continues to the error:

--[[
inValues[1] = 0
-- actually, set them all :P
for i=1,32 do
	inValues[i] = 0
  inBools[i] = false
end

runTest(function() onTick() end, "onTick")
runTest(function() onDraw() end, "onDraw")
]]


--[[
for run=1,52 do
	inValues[1] = inValues[1] + 0.5422
  inValues[2] = inValues[2] + 0.0032122
  inValues[3] = inValues[3] + 0.000232122
  inBools[1] = run > 25
  inValues[31] = run > 25 and 10 or 0
  runTest(function() onTick() end, "onTick")
  runTest(function() onDraw() end, "onDraw")
end
--]]

--[[
-- Set rps high enough to trigger hover code
inValues[29] = 80
for i=5,26 do
	inValues[i]= 0
end
inValues[5] = 3
inValues[6] = 0.75
inBools[1] = true

runTest(function() onTick() end, "onTick")
runTest(function() onDraw() end, "onDraw")

for i=1,32 do
	inValues[i]=1
end
inValues[29] = 80

runTest(function() onTick() end, "onTick")
runTest(function() onDraw() end, "onDraw")
]]

__STRICT = false
return 0
--os.execute("clear")
--[[
Test call: onDraw
    ... 13 additional calls to drawText ...
 --> function call: drawText ( 3 parameters)
 --> f(number(185), number(7), string( 1.0))
 --> function call: getWidth ( 0 parameters)
 --> return number(98)
 --> function call: getHeight ( 0 parameters)
 --> return number(98)
 --> function call: drawText ( 3 parameters)
 --> f(number(1), number(0), string(#01 0.000000))
 --> function call: drawText ( 3 parameters)
 --> f(number(29), number(0), string( 0.0))
No Errors: Success!

PANIC: unprotected error in call to Lua API ([string "<eval>"]:57: attempt to index a nil value)
repl process died unexpectedly: exit status 1
]]