
propValues["BaseIndex"] = 1
--[[
propValues["Ark0"] =
[ [
string,math,input,output,property
,tostring,tonumber,ipairs,pairs
,input.getNumber,input.getBool,output.setNumber
] ]
propValues["Ark1"] =
[ [
,math.abs,math.sin,math.cos,math.max,math.min
,math.atan,math.sqrt,math.floor,math.pi
] ] 
--]]
propValues["Ark0"] =
[[
string,math,input,output,property,screen
,tostring,tonumber,ipairs,pairs,string.format
,input.getNumber,input.getBool,output.setNumber
]]
propValues["Ark1"] =
[[
,screen.drawTextBox,screen.drawLine,screen.getWidth,screen.getHeight,screen.setColor
]] 
propValues["Ark2"] =
[[
,math.abs,math.sin,math.cos,math.max,math.min
,math.atan,math.sqrt,math.floor,math.pi
]] 
propValues["ArkSF0"] =
[[
setColor,drawLine,drawCircle,drawCircleF,drawRectF,drawTriangleF,drawText,drawTextBox,getWidth,getHeight
]]
propValues["ArkGF0"] = 
"map.screenToMap,map.mapToScreen,input.getNumber,input.getBool,output.setNumber,output.setBool,string.format,type"

propValues["ArkMF0"] =
"abs,min,max,sqrt,ceil,floor,sin,cos,atan,pi"