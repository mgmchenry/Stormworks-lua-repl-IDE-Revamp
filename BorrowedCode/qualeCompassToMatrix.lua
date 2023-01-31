-- Original version. This one can tolerate having only 2 compasses, but only because it misunderstood compass precision. It has half of the intended significant digits in the worst case.

local tau = 0x6.487ed8 -- Match the game's binary32 division.
local sin = math.sin
local sqrt = math.sqrt
local abs = math.abs
local cos = math.cos
local gb = input.getBool
local gn = input.getNumber
local sn = output.setNumber
local dt = screen.drawText
local fmt = string.format

local cmx,cmy,cmz=0,9/43/4,26.5/43/4
local gpsx,gpsy,gpsz=-cmx,.25-cmy,-cmz
local altx,alty,altz=-cmx,.25-cmy,.25-cmz

local column = 0
local mat = {}
local pressed = false

function onTick_()
	local i,x,y,z,c,s,m=1,sin(tau*gn(1)),sin(tau*gn(2)),sin(tau*gn(3))
	for j=2,3 do if abs(gn(i))>abs(gn(j))then i=j end end
	if i<2 then
	    m=sqrt(z*z+y*y)m={0,-z/m,y/m;m,-x*y/m,-x*z/m;x,y,z}
	elseif i<3 then
	    m=sqrt(x*x+z*z)m={z/m,0,-x/m;-y*x/m,m,-y*z/m;x,y,z}
	else
	    m=sqrt(y*y+x*x)m={-y/m,x/m,0;-z*x/m,-z*y/m,m;x,y,z}
	end
	s=tau*gn(i+3)c=cos(s)s=sin(s)
	for j=1,3 do m[j],m[j+3]=c*m[j]-s*m[j+3],s*m[j]+c*m[j+3]end
	local px=-gpsx*m[1]-gpsy*m[2]-gpsz*m[3]+gn(7)
	local py=-gpsx*m[4]-gpsy*m[5]-gpsz*m[6]+gn(8)
	local pz=-altx*m[7]-alty*m[8]-altz*m[9]+gn(9)
	mat[1] = m[1]
	mat[2] = m[7]
	mat[3] = m[4]
	mat[4] = 0
	mat[5] = m[3]
	mat[6] = m[9]
	mat[7] = m[6]
	mat[8] = 0
	mat[9] = m[2]
	mat[10] = m[8]
	mat[11] = m[5]
	mat[12] = 0
	mat[13] = px
	mat[14] = pz
	mat[15] = py
	mat[16] = 1
	for i = 1, 16 do
		sn(i, mat[i])
	end
	if gb(1) and not pressed then
		column = (column + 1) % 4
	end
	pressed = gb(1)
end
	
function onDraw()
	for i = 1, 4 do
		dt(1, 6*i-5, fmt('%.13g', mat[4 * column + i]))
	end
	dt(91, 26, column)
end

----

-- More vector-oriented version, using all compasses at once.

local tau = 0x6.487ed8 -- Match the game's binary32 division.
local sin = math.sin
local sqrt = math.sqrt
local abs = math.abs
local cos = math.cos
local gb = input.getBool
local gn = input.getNumber
local sn = output.setNumber
local dt = screen.drawText
local fmt = string.format

local cmx,cmy,cmz=0,9/43/4,26.5/43/4
local gpsx,gpsy,gpsz=-cmx,.25-cmy,-cmz
local altx,alty,altz=-cmx,.25-cmy,.25-cmz

local column = 0
local mat = {}
local pressed = false

function onTick()
	-- Make a special orthogonal matrix:
	-- [We] = [a b c] [Vr]
	-- [Wn] = [d e f] [Vf]
	-- [Wu] = [g h i] [Vu]
	-- W is a column vector pointing east, north and up in the world.
	-- V is a column vector pointing right, forward and up in the vehicle.
	
	-- The sine is the most stable tilt output.
	local g=sin(tau*gn(1))
	local h=sin(tau*gn(2))
	local i=sin(tau*gn(3))
	
	-- The cosine is the most stable compass output.
	-- The square roots are really cosines of tilt sensors, computed stably.
	-- The product is stable. As the compass becomes more vertical, the cosine of tilt reduces its influence accordingly.
	local d=sqrt(h*h+i*i)*cos(tau*gn(4))
	local e=sqrt(i*i+g*g)*cos(tau*gn(5))
	local f=sqrt(g*g+h*h)*cos(tau*gn(6))
	
	-- Instead of trying and gradually losing precision, Stormworks actively sabotages compasses even nearly 2 degrees from vertical! Substitute if one might be at risk.
	if abs(g)>0.999 then d=-(h*e+i*f)/g end
	if abs(h)>0.999 then e=-(i*f+g*d)/h end
	if abs(i)>0.999 then f=-(g*d+h*e)/i end
	
	-- Infer this row using a cross product, avoiding taking less stable sines of compasses directly.
	local a=e*i-f*h
	local b=f*g-d*i
	local c=d*h-e*g
	
	-- Optional: deal with being mirrored. You obviously won't match the add-on matrix if you change basis, but it might be useful for your own purposes.
	-- Precision is not an issue here; we only need to tell diametric opposites apart. The sine still gets to the nearest arc minute or so in the worst case. Even a sabotaged compass can only change the dot product, which is otherwise very nearly +1 or -1, by 0.001.
	-- Use >0 instead of <0 so the compasses don't have to be negated.
	local A=sqrt(h*h+i*i)*sin(tau*gn(4))
	local B=sqrt(i*i+g*g)*sin(tau*gn(5))
	local C=sqrt(g*g+h*h)*sin(tau*gn(6))
	if a*A+b*B+c*C>0 then
		a=-a
		b=-b
		c=-c
	end
	
	-- The resulting matrix is precise to about 7 decimals, extracting all the precision it can from its inputs.
	
	local px=-gpsx*a-gpsy*b-gpsz*c+gn(7)
	local py=-gpsx*d-gpsy*e-gpsz*f+gn(8)
	local pz=-altx*g-alty*h-altz*i+gn(9)
	mat[1] = a
	mat[2] = g
	mat[3] = d
	mat[4] = 0
	mat[5] = c
	mat[6] = i
	mat[7] = f
	mat[8] = 0
	mat[9] = b
	mat[10] = h
	mat[11] = e
	mat[12] = 0
	mat[13] = px
	mat[14] = pz
	mat[15] = py
	mat[16] = 1
	for i = 1, 16 do
		sn(i, mat[i])
	end
	if gb(1) and not pressed then
		column = (column + 1) % 4
	end
	pressed = gb(1)
end
	
function onDraw()
	for i = 1, 4 do
		dt(1, 6*i-5, fmt('%.13g', mat[4 * column + i]))
	end
	dt(91, 26, column)
end

--- mgm - tested edits for working 2 compass implementation
-- Original version. This one can tolerate having only 2 compasses, but only because it misunderstood compass precision. It has half of the intended significant digits in the worst case.

local tau = 0x6.487ed8 -- Match the game's binary32 division.
local sin = math.sin
local sqrt = math.sqrt
local abs = math.abs
local cos = math.cos
local gb = input.getBool
local gn = input.getNumber
local sn = output.setNumber
local dt = screen.drawText
local fmt = string.format

local cmx,cmy,cmz=0,9/43/4,26.5/43/4
local gpsx,gpsy,gpsz=-cmx,.25-cmy,-cmz
local altx,alty,altz=-cmx,.25-cmy,.25-cmz

local column = 0
local mat = {}
local pressed = false

function onTick()
	--local i,x,y,z,c,s,m=2,sin(tau*gn(1)),sin(tau*gn(2)),sin(tau*gn(3))
	--for j=2,3 do if abs(gn(i))>abs(gn(j))then i=j end end
	local i,x,y,z,c,s,m=2,sin(tau*gn(1)),sin(tau*gn(2)),sin(tau*gn(3))
	--if i<2 then
	--    m=sqrt(z*z+y*y)m={0,-z/m,y/m;m,-x*y/m,-x*z/m;x,y,z}
	--elseif i<3 then
	if abs(gn(2))<abs(gn(3)) or gn(6)==0 then
	    m=sqrt(x*x+z*z)m={z/m,0,-x/m;-y*x/m,m,-y*z/m;x,y,z}
	else
		i=3--use compass Z
	    m=sqrt(y*y+x*x)m={-y/m,x/m,0;-z*x/m,-z*y/m,m;x,y,z}
	end
	s=tau*gn(i+3)c=cos(s)s=sin(s)
	for j=1,3 do m[j],m[j+3]=c*m[j]-s*m[j+3],s*m[j]+c*m[j+3]end
	local px=-gpsx*m[1]-gpsy*m[2]-gpsz*m[3]+gn(7)
	local py=-gpsx*m[4]-gpsy*m[5]-gpsz*m[6]+gn(8)
	local pz=-altx*m[7]-alty*m[8]-altz*m[9]+gn(9)
	mat[1] = m[1]
	mat[2] = m[7]
	mat[3] = m[4]
	mat[4] = 0
	mat[5] = m[3]
	mat[6] = m[9]
	mat[7] = m[6]
	mat[8] = 0
	mat[9] = m[2]
	mat[10] = m[8]
	mat[11] = m[5]
	mat[12] = 0
	mat[13] = px
	mat[14] = pz
	mat[15] = py
	mat[16] = 1
	for i = 1, 16 do
		sn(i, mat[i])
	end
	if gb(1) and not pressed then
		column = (column + 1) % 4
	end
	pressed = gb(1)
end
	
function onDraw()
	for i = 1, 4 do
		dt(1, 6*i-5, fmt('%.13g', mat[4 * column + i]))
	end
	dt(91, 26, column)
end