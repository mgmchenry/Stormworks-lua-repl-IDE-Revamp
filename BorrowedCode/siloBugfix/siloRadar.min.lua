--minifying 
a={{},{},{},{},{},{},{},{}}b={false,false,false,false,false,false,false,false}c=25 local m,n=25,25 function d()m,n=25,25 for o=1,8 do a[o][1]=input.getNumber(o*4-3)a[o][2]=input.getNumber(o*4-2)*(math.pi*2)a[o][3]=input.getNumber(o*4-1)*(math.pi*2)b[o]=input.getBool(o)if a[o][1]>0 then m=math.max(m,a[o][1])n=math.min(n,a[o][1])end end e=math.floor(m/25)*25+25 if math.abs(c-e)<2 then c=e elseif c>e+50 then c=c*.98 else c=c+(e-c)*0.1 end end function f()g=screen.getWidth()h=screen.getHeight()i=math.floor(g/4)j={i,h/2}k={i*3,h/2}screen.setColor(0,255,255)screen.drawRectF(j[1]-2,j[2]-5,5,11)screen.drawRectF(k[1]-5,k[2]-2,10,5)screen.drawText(0,0,string.format('Range: %0.0f meters',c))screen.drawLine(g/2,0,g/2,160)screen.setColor(0,255,255)l=math.max(math.floor(c/5/50)*50,25)for o=50,c-25,l do screen.drawCircle(j[1],j[2],o/c*i)screen.drawText(j[1],j[2]-o/c*i,o.."m")end for o=1,8 do if b[o]then local p=((a[o][1]/c)*i)*math.sin(a[o][2])local q=((a[o][1]/c)*i)*math.cos(a[o][2])local r=((a[o][1]/c)*i)local s=((a[o][1]/c)*i)*math.sin(a[o][3])screen.setColor(255,0,0)screen.drawCircleF(j[1]+p,j[2]-q,2)screen.drawCircleF(k[1]-r,k[2]-s,2)end end end
Scope variable info and rename assignments
Global Scope[??-??]
Global a<-radartbl(Usages:0)
Global b<-radarbool(Usages:0)
Global c<-scale(Usages:0)
Global d<-onTick(Usages:0)
Global input unchanged (Usages:0not assigned
Global math unchanged (Usages:0not assigned
Global e<-scale2(Usages:0)
Global f<-onDraw(Usages:0)
Global g<-sw(Usages:0)
Global screen unchanged (Usages:0not assigned
Global h<-sh(Usages:0)
Global i<-rw(Usages:0)
Global j<-topView(Usages:0)
Global k<-sideView(Usages:0)
Global string unchanged (Usages:0not assigned
Global l<-ringw(Usages:0)
Root Scope[1-228]
Root Scope:2-1[2-227]
Local m<-maxR(Usages:0)
Local n<-minR(Usages:0)
Root Scope:2-1:3-1[20-92]
Root Scope:2-1:3-1:4-1[21-91]
Root Scope:2-1:3-1:4-1:5-1[24-66]
Local o<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-1:6-1[28-65]
Root Scope:2-1:3-1:4-1:5-1:6-1:7-1[53-64]
Root Scope:2-1:3-1:4-1:5-2[75-78]
Root Scope:2-1:3-1:4-1:5-3[81-84]
Root Scope:2-1:3-1:4-1:5-4[85-90]
Root Scope:2-1:3-2[95-226]
Root Scope:2-1:3-2:4-1[96-225]
Root Scope:2-1:3-2:4-1:5-1[146-165]
Local o<-i(Usages:0not assigned
Root Scope:2-1:3-2:4-1:5-1:6-1[150-164]
Root Scope:2-1:3-2:4-1:5-2[166-224]
Local o<-i(Usages:0not assigned
Root Scope:2-1:3-2:4-1:5-2:6-1[170-223]
Root Scope:2-1:3-2:4-1:5-2:6-1:7-1[173-222]
Local p<-x1(Usages:0not assigned
Local q<-y1(Usages:0not assigned
Local r<-x2(Usages:0not assigned
Local s<-y2(Usages:0not assigned
--minified 
