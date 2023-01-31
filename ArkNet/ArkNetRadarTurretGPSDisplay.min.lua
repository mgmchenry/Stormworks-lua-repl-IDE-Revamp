--minifying 
a={"ArkNetRadGPSTurretx01e","repl.it/@mgmchenry"}local r,s,t,u,v,w,x,y,z,A,B,C,D,E,F=_ENV,property.getText,string.gmatch,table.unpack,ipairs,'([^,\r\n]+)',false,"string","table","number"function b()local G,H,I,J,K,L,M,N,O,P,Q=D(math,s("ArkMFb"))c=L(Q)==3 or Q()local R,S,T,U,V,W,X,Y=D(r,s("ArkGF0"))local Z,ab,bb,cb,db,eb,fb,gb,hb,ib,jb,kb,lb,mb={},{},{},{},{},0,-1,-1,{cfg={1,2,3,4,5,6,9,10},h={},s=0},{cfg={21,22,23,24,0,0,25,26,27},h={},s=0},{cfg={16,17,18,19,20}},{0,0,0,0.125,0,0}for qb=1,30 do db[qb]=qb end mb=(function(qb,rb,sb)qb,rb={},{9,10,11,12,13,14,15}local tb,ub,vb,wb,xb,yb,zb=60,0,{}local Ab,Bb,Cb,Db,Eb,Fb,Gb,Hb,Ib,Jb,Kb,Lb,Mb=u(db)local Nb,Ob,Pb,Qb,Rb function d()wb=vb[ub]or{}ub=ub%(tb-1)+1 xb=vb[ub]or{d={},t={},td={}}vb[ub]=xb for Yb,Zb in v(rb)do xb[Yb]=Z[Zb]end xb[Jb]=(xb[Cb]+xb[Db])/2 xb[Kb]=P((xb[Eb]-xb[Jb])*2)/Q/2 xb[Lb]=P((xb[Cb]-xb[Jb])*2/N(xb[Kb]))/Q/2 if xb[Fb]<0 then xb[Kb]=-xb[Kb]xb[Lb]=.5-xb[Lb]end for Yb=Ab,Lb do xb.d[Yb]=((xb[Yb]or 0)-(wb[Yb]or 0))*60 end end local Sb,Tb,Ub,Vb,Wb,Xb={255,0,0},{0,255,0},{0,0,255},{255,255,255}function e(Yb,Zb,ac)local bc,cc,dc,ec=3,20,{},Nb(0,xb[Kb],xb[Lb])local function fc(gc,hc)Yb(bc,cc,gc)cc=cc+6 end Ob(ec,Wb,dc,1,#Wb,0,288,288)for gc,hc in pairs(Xb)do if hc[3]~=nil then ac(hc[3])end Zb(dc[hc[1]].x,dc[hc[1]].y,dc[hc[2]].x,dc[hc[2]].y)end end function f(Yb,Zb,ac)return{x=Yb,y=Zb,z=ac}end function g(Yb)h=J(Yb.x*Yb.x+Yb.y*Yb.y+Yb.z*Yb.z)return Nb(Yb.x/h,Yb.y/h,Yb.z/h)end function i(Yb,Zb)return Yb.x*Zb.x+Yb.y*Zb.y+Yb.z*Zb.z end Wb={Nb(-50,-50,-50),Nb(50,-50,-50),Nb(50,-50,50),Nb(-50,-50,50),Nb(-50,50,-50),Nb(50,50,-50),Nb(50,50,50),Nb(-50,50,50)}Xb={{1,2,Tb},{2,3,Tb},{3,4,Tb},{4,1,Tb},{5,6,Sb},{6,7,Sb},{7,8,Sb},{8,5,Sb},{1,5,Vb},{2,6,Vb},{3,7,Ub},{4,8,Ub}}Ob=function(Yb,Zb,ac,bc,cc,dc,ec,fc)bc,cc=bc or 1,cc or#Zb local gc,hc,ic,jc,kc,lc=M(Yb.x),N(Yb.x),M(Yb.y),N(Yb.y),M(Yb.z),N(Yb.z)local mc,nc,oc,pc,qc,rc,sc,tc,uc,vc local wc,xc,yc=ec/2,fc/2,300 for zc=bc,cc do mc=Zb[zc].x nc=Zb[zc].y oc=Zb[zc].z pc=hc*nc-gc*oc qc=gc*nc+hc*oc sc=jc*qc-ic*mc rc=ic*qc+jc*mc tc=lc*rc-kc*pc uc=kc*rc+lc*pc vc=yc/(yc+sc)*(ec/288)mc=tc*vc nc=uc*vc ac[zc]=Nb(mc+wc,nc+xc,sc)ac[zc].p=Nb(tc,uc,sc)end return ac end function j(Yb,Zb)return Nb(Yb.y*Zb.z-Yb.z*Zb.y,Yb.z*Zb.x-Yb.x*Zb.z,Yb.x*Zb.y-Yb.y*Zb.x)end qb.API={yb,zb}return qb end)()local function nb()end function k(qb,rb,sb)rb=rb or{}for tb=1,8 do sb=2^(tb-1)rb[tb]=qb%(sb*2)>=sb end return rb end local ob,pb=u(mb.API)function l()fb=gb eb=eb+1 for vb=1,32 do Z[vb]=R(vb)bb[vb]=S(vb)end for vb=1,5 do jb[vb]=Z[jb.cfg[vb]]end cb[1]=false cb[2]=jb[1]>8 kb[1],kb[2]=0,0 local qb,rb,sb=0,0 for vb,wb in ipairs({hb,ib})do wb.p={u(wb)}for xb=1,8 do wb[xb]=Z[wb.cfg[xb]]end if wb.cfg[9]then lb(Z[wb.cfg[9]],wb.h)else wb.h={u(bb,1,6)}wb.h[7]=bb[31]wb.h[8]=bb[32]end if G(wb[3])>G(wb.p[3]or 0)then wb.s=E(wb.s+wb[3]*.1,-1,1)end if G(wb[4])>G(wb.p[4]or 0)then kb[3]=E(kb[3]+wb[4]*.1,0,1)end wb[11]=4^wb.s*64 if wb.h[2]then cb[1]=cb[1]or wb.h[7]cb[2]=cb[2]or wb.h[3]qb,rb=qb+E(wb[7]*G(wb[7])*wb[11],-1,1),rb+E(wb[8]*G(wb[8])*wb[11],-1,1)end end local tb,ub=0,0 sb=1-E(J(G(qb*rb))*2,0,.75)if hb.h[4]~=ib.h[4]then sb=0 end kb[1]=jb[2]*-12*sb-qb kb[6]=(jb[3]*-4*sb-rb)kb[2]=E(kb[6]*ub+kb[6]*(ub>0 and 1/60 or 1),-1,1)ob()for vb=1,6 do T(vb,kb[vb])U(vb,cb[vb])end gb=0 end do local qb,rb,sb,tb,ub,vb,wb,xb,yb,zb=255,D(screen,s("ArkSF0"))local Ab,Bb,Cb,Db,Eb,Fb,Gb,Hb,Ib,Jb,Kb,Lb,Mb,Nb,Ob,Pb,Qb={qb,qb,qb,qb},{qb,0,0},{0,qb,0},{0,0,qb},{qb,0,qb},{qb,qb,qb},{0,0,0}function m(Rb,Sb)wb(Kb,Lb,Rb)Lb=Lb+6 end function n()local Rb,Sb,Tb=yb(),zb()local Ub,Vb=Rb/2-.5,Sb/2-.5 wb(3,12,"GPSDISPLAY")pb(wb,sb,Mb)local Wb,Xb,Yb,Zb,ac,bc={1,1,-1,-1},{1,0,-1,0}end function o(Rb)Jb[4]=Rb*qb rb(u(Jb))end function p(Rb,Sb,Tb,Ub,Vb)Jb=F(X(Rb)==z and Rb or{Rb,Sb,Tb,Ub},Jb)rb(u(Jb))end function q(Rb,Sb,Tb,Ub,Vb,Wb)if Vb then Mb(Vb)end Wb=J(Tb*Tb+Ub*Ub)if Wb<1 then Tb,Ub=Rb+Tb,Sb+Ub+(Ub>0 and 1 or-1)else Tb=Rb+Tb+Tb/Wb Ub=Sb+Ub+Ub/Wb end sb(Rb,Sb,Tb,Ub)end end return nb end E,F,C,D=function(G,H,I)return H>G and H or I<G and I or G end,function()local G,H={...},{}if not G[1]then H,G=G[2],{u(G,3)}end for I,J in v(G)do for K,L in v(J)do H[K]=H[K]or L end end return H,u(H)end,function(G,H)H=H or{}for I in t(G,w)do H[#H+1]=I end return u(H)end,function(G,H,I,J,K)H,I=type(H)==y and{C(H)}or H,I or{}J=#I for L,M in pairs(H)do if type(M)==A then K=G[M]else K=G for N in t(M,'([^. ]+)')do K=K[N]end end L=type(L)==A and J+L or L I[L]=K end return u(I)end b()()
Scope variable info and rename assignments
Global Scope[??-??]
Global a<-source(Usages:0)
Global _ENV unchanged (Usages:0not assigned
Global property unchanged (Usages:0not assigned
Global string unchanged (Usages:0not assigned
Global table unchanged (Usages:0not assigned
Global ipairs unchanged (Usages:0not assigned
Global b<-main(Usages:0)
Global math unchanged (Usages:0not assigned
Global c<-_(Usages:0)
Global d<-updateTelemetry(Usages:0)
Global e<-drawTelemetry(Usages:0)
Global pairs unchanged (Usages:0not assigned
Global f<-vec3(Usages:0)
Global g<-normalizeVec3(Usages:0)
Global h<-m(Usages:0)
Global i<-vec3_DotProduct(Usages:0)
Global j<-cross(Usages:0)
Global k<-getFlags(Usages:0)
Global l<-onTick(Usages:0)
Global screen unchanged (Usages:0not assigned
Global m<-printText(Usages:0)
Global n<-onDraw(Usages:0)
Global o<-betterSetAlpha(Usages:0)
Global p<-betterSetColor(Usages:0)
Global q<-betterDrawLineRel(Usages:0)
Global type unchanged (Usages:0not assigned
Root Scope[1-1465]
Root Scope:2-1[2-1464]
Local r<-G(Usages:0not assigned
Local s<-prop_getText(Usages:0not assigned
Local t<-gmatch(Usages:0not assigned
Local u<-unpack(Usages:0not assigned
Local v<-ipairz(Usages:0not assigned
Local w<-commaDelimited(Usages:0not assigned
Local x<-empty(Usages:0not assigned
Local y<-luaType_string(Usages:0not assigned
Local z<-luaType_table(Usages:0not assigned
Local A<-luaType_number(Usages:0not assigned
Local B<-nilzies(Usages:0not assigned
Local C<-stringUnpack(Usages:0)
Local D<-getTableValues(Usages:0)
Local E<-clamp(Usages:0)
Local F<-plop(Usages:0)
Root Scope:2-1:3-1[68-1281]
Root Scope:2-1:3-1:4-1[69-1280]
Local G<-abs(Usages:0not assigned
Local H<-min(Usages:0not assigned
Local I<-max(Usages:0not assigned
Local J<-sqrt(Usages:0not assigned
Local K<-ceil(Usages:0not assigned
Local L<-floor(Usages:0not assigned
Local M<-sin(Usages:0not assigned
Local N<-cos(Usages:0not assigned
Local O<-atan(Usages:0not assigned
Local P<-asin(Usages:0not assigned
Local Q<-pi(Usages:0not assigned
Local R<-getNumber(Usages:0not assigned
Local S<-getBool(Usages:0not assigned
Local T<-setNumber(Usages:0not assigned
Local U<-setBool(Usages:0not assigned
Local V<-property_getNumber(Usages:0not assigned
Local W<-format(Usages:0not assigned
Local X<-type(Usages:0not assigned
Local Y<-string_sub(Usages:0not assigned
Local Z<-I(Usages:0not assigned
Local ab<-O(Usages:0not assigned
Local bb<-Ib(Usages:0not assigned
Local cb<-Ob(Usages:0not assigned
Local db<-numberList(Usages:0not assigned
Local eb<-tickCounter(Usages:0)
Local fb<-screenCount(Usages:0)
Local gb<-screensRendered(Usages:0)
Local hb<-s1(Usages:0not assigned
Local ib<-s2(Usages:0not assigned
Local jb<-ts(Usages:0not assigned
Local kb<-tc(Usages:0not assigned
Local lb<-getFlags(Usages:0not assigned
Local mb<-telemetryData(Usages:0)
Local nb<-init(Usages:0not assigned
Local ob<-updateTelemetry(Usages:0not assigned
Local pb<-drawTelemetry(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-1[183-192]
Local qb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-1:6-1[187-191]
Root Scope:2-1:3-1:4-1:5-2[194-765]
Local qb<-telData(Usages:0)
Local rb<-inChannels(Usages:0)
Local sb<-dataTypes(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1[204-764]
Local tb<-sampleCount(Usages:0not assigned
Local ub<-bufferCursor(Usages:0)
Local vb<-dataSamples(Usages:0not assigned
Local wb<-lastTickData(Usages:0)
Local xb<-thisTickData(Usages:0)
Local yb<-updateTelemetry(Usages:0not assigned
Local zb<-drawTelemetry(Usages:0not assigned
Local Ab<-_gpsX(Usages:0not assigned
Local Bb<-_gpsY(Usages:0not assigned
Local Cb<-_altL(Usages:0not assigned
Local Db<-_altR(Usages:0not assigned
Local Eb<-_altF(Usages:0not assigned
Local Fb<-_tiltUp(Usages:0not assigned
Local Gb<-_compass(Usages:0not assigned
Local Hb<-_clock(Usages:0not assigned
Local Ib<-_mcTick(Usages:0not assigned
Local Jb<-_altC(Usages:0not assigned
Local Kb<-_pitch(Usages:0not assigned
Local Lb<-_roll(Usages:0not assigned
Local Mb<-_yaw(Usages:0not assigned
Local Nb<-vec3(Usages:0not assigned
Local Ob<-vec3_TransformPoints(Usages:0)
Local Pb<-cross(Usages:0not assigned
Local Qb<-normalizeVec3(Usages:0not assigned
Local Rb<-vec3_DotProduct(Usages:0not assigned
Local Sb<-red(Usages:0not assigned
Local Tb<-green(Usages:0not assigned
Local Ub<-blue(Usages:0not assigned
Local Vb<-white(Usages:0not assigned
Local Wb<-pointsArray(Usages:0)
Local Xb<-linesArray(Usages:0)
Root Scope:2-1:3-1:4-1:5-2:6-1:7-1[286-369]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-1:8-1[287-368]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-1:8-1:9-1[302-315]
Local Yb<-iDataType(Usages:0not assigned
Local Zb<-channel(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-1:8-1:9-1:10-1[309-314]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-1:8-1:9-2[343-352]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-1:8-1:9-3[355-367]
Local Yb<-dataType(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-1:8-1:9-3:10-1[359-366]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-2[390-471]
Local Yb<-drawText(Usages:0not assigned
Local Zb<-drawLine(Usages:0not assigned
Local ac<-setColorRGB(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-2:8-1[400-470]
Local bc<-textPosX(Usages:0not assigned
Local cc<-textPosY(Usages:0)
Local dc<-ssPoints(Usages:0not assigned
Local ec<-axisRotations(Usages:0not assigned
Local fc<-printText(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-2:8-1:9-1[421-436]
Local gc<-text(Usages:0not assigned
Local hc<-color(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-2:8-1:9-1:10-1[428-435]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-2:8-1:9-2[446-469]
Local gc<-i(Usages:0not assigned
Local hc<-line(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-2:8-1:9-2:10-1[453-468]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-2:8-1:9-2:10-1:11-1[455-458]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-3[474-489]
Local Yb<-xVal(Usages:0not assigned
Local Zb<-yVal(Usages:0not assigned
Local ac<-zVal(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-3:8-1[484-488]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-4[492-515]
Local Yb<-point1(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-4:8-1[496-514]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-5[518-533]
Local Yb<-point1(Usages:0not assigned
Local Zb<-point2(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-5:8-1[525-532]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-6[557-734]
Local Yb<-axisRotations(Usages:0not assigned
Local Zb<-points(Usages:0not assigned
Local ac<-transformedPoints(Usages:0not assigned
Local bc<-rangeMin(Usages:0)
Local cc<-rangeMax(Usages:0)
Local dc<-offset(Usages:0not assigned
Local ec<-screenWidth(Usages:0not assigned
Local fc<-screenHeight(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-6:8-1[582-733]
Local gc<-sx(Usages:0not assigned
Local hc<-cx(Usages:0not assigned
Local ic<-sy(Usages:0not assigned
Local jc<-cy(Usages:0not assigned
Local kc<-sz(Usages:0not assigned
Local lc<-cz(Usages:0not assigned
Local mc<-x(Usages:0)
Local nc<-y(Usages:0)
Local oc<-z(Usages:0)
Local pc<-xy(Usages:0)
Local qc<-xz(Usages:0)
Local rc<-yx(Usages:0)
Local sc<-yz(Usages:0)
Local tc<-zx(Usages:0)
Local uc<-zy(Usages:0)
Local vc<-scaleRatio(Usages:0)
Local wc<-halfWidth(Usages:0not assigned
Local xc<-halfHeight(Usages:0not assigned
Local yc<-focalLength(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-6:8-1:9-1[661-731]
Local zc<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-6:8-1:9-1:10-1[665-730]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-7[737-759]
Local Yb<-v(Usages:0not assigned
Local Zb<-w(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-7:8-1[744-758]
Root Scope:2-1:3-1:4-1:5-3[769-772]
Root Scope:2-1:3-1:4-1:5-3:6-1[770-771]
Root Scope:2-1:3-1:4-1:5-4[775-804]
Local qb<-flags(Usages:0not assigned
Local rb<-result(Usages:0)
Local sb<-_bit(Usages:0)
Root Scope:2-1:3-1:4-1:5-4:6-1[785-803]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1[788-801]
Local tb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1:8-1[792-800]
Root Scope:2-1:3-1:4-1:5-5[815-1000]
Root Scope:2-1:3-1:4-1:5-5:6-1[816-999]
Local qb<-cx(Usages:0)
Local rb<-cy(Usages:0)
Local sb<-cz(Usages:0)
Local tb<-stickyX(Usages:0not assigned
Local ub<-stickyY(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-1:7-1[821-835]
Local vb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-1:7-1:8-1[825-834]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-2[836-847]
Local vb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-1:7-2:8-1[840-846]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-3[865-950]
Local vb<-si(Usages:0not assigned
Local wb<-st(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-1:7-3:8-1[872-949]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-3:8-1:9-1[876-887]
Local xb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-1:7-3:8-1:9-1:10-1[880-886]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-3:8-1:9-2[889-894]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-3:8-1:9-3[895-903]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-3:8-1:9-4[908-913]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-3:8-1:9-5[918-923]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-3:8-1:9-6[927-948]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-4[965-967]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-5[983-997]
Local vb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-1:7-5:8-1[987-996]
Root Scope:2-1:3-1:4-1:5-6[1001-1278]
Local qb<-F(Usages:0not assigned
Local rb<-setColor(Usages:0not assigned
Local sb<-drawLine(Usages:0not assigned
Local tb<-drawRect(Usages:0not assigned
Local ub<-drawRectF(Usages:0not assigned
Local vb<-drawTriangleF(Usages:0not assigned
Local wb<-drawText(Usages:0not assigned
Local xb<-drawTextBox(Usages:0not assigned
Local yb<-screen_getWidth(Usages:0not assigned
Local zb<-screen_getHeight(Usages:0not assigned
Local Ab<-cSolidWhite(Usages:0not assigned
Local Bb<-cRed(Usages:0not assigned
Local Cb<-cGreen(Usages:0not assigned
Local Db<-cBlue(Usages:0not assigned
Local Eb<-cMagenta(Usages:0not assigned
Local Fb<-cWhite(Usages:0not assigned
Local Gb<-cBlack(Usages:0not assigned
Local Hb<-screenWidth(Usages:0not assigned
Local Ib<-screenHeight(Usages:0not assigned
Local Jb<-currentDrawColor(Usages:0)
Local Kb<-textPosX(Usages:0not assigned
Local Lb<-textPosY(Usages:0)
Local Mb<-betterSetColor(Usages:0not assigned
Local Nb<-betterSetAlpha(Usages:0not assigned
Local Ob<-betterDrawRect(Usages:0not assigned
Local Pb<-betterDrawLineRel(Usages:0not assigned
Local Qb<-printText(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1[1102-1117]
Local Rb<-text(Usages:0not assigned
Local Sb<-color(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-1[1109-1116]
Root Scope:2-1:3-1:4-1:5-6:6-2[1120-1165]
Root Scope:2-1:3-1:4-1:5-6:6-2:7-1[1121-1164]
Local Rb<-w(Usages:0not assigned
Local Sb<-h(Usages:0not assigned
Local Tb<-ds(Usages:0not assigned
Local Ub<-wC(Usages:0not assigned
Local Vb<-hC(Usages:0not assigned
Local Wb<-corners(Usages:0not assigned
Local Xb<-c2(Usages:0not assigned
Local Yb<-cx(Usages:0not assigned
Local Zb<-cy(Usages:0not assigned
Local ac<-cD(Usages:0not assigned
Local bc<-cz(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-3[1168-1180]
Local Rb<-a(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-3:7-1[1172-1179]
Root Scope:2-1:3-1:4-1:5-6:6-4[1183-1215]
Local Rb<-r(Usages:0not assigned
Local Sb<-g(Usages:0not assigned
Local Tb<-b(Usages:0not assigned
Local Ub<-a(Usages:0not assigned
Local Vb<-local_packedColor(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-4:7-1[1199-1214]
Root Scope:2-1:3-1:4-1:5-6:6-5[1218-1277]
Local Rb<-x(Usages:0not assigned
Local Sb<-y(Usages:0not assigned
Local Tb<-w(Usages:0)
Local Ub<-h(Usages:0)
Local Vb<-color(Usages:0not assigned
Local Wb<-l_dis(Usages:0)
Root Scope:2-1:3-1:4-1:5-6:6-5:7-1[1237-1276]
Root Scope:2-1:3-1:4-1:5-6:6-5:7-1:8-1[1239-1242]
Root Scope:2-1:3-1:4-1:5-6:6-5:7-1:8-2[1250-1258]
Root Scope:2-1:3-1:4-1:5-6:6-5:7-1:8-3[1259-1270]
Root Scope:2-1:3-2[1286-1305]
Local G<-a(Usages:0not assigned
Local H<-b(Usages:0not assigned
Local I<-c(Usages:0not assigned
Root Scope:2-1:3-2:4-1[1296-1304]
Root Scope:2-1:3-3[1306-1355]
Root Scope:2-1:3-3:4-1[1307-1354]
Local G<-sources(Usages:0)
Local H<-result(Usages:0)
Root Scope:2-1:3-3:4-1:5-1[1315-1321]
Root Scope:2-1:3-3:4-1:5-2[1324-1350]
Local I<-i(Usages:0not assigned
Local J<-v(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-2:6-1[1331-1349]
Root Scope:2-1:3-3:4-1:5-2:6-1:7-1[1334-1348]
Local K<-i(Usages:0not assigned
Local L<-v(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-2:6-1:7-1:8-1[1341-1347]
Root Scope:2-1:3-4[1356-1382]
Local G<-text(Usages:0not assigned
Local H<-local_returnVals(Usages:0)
Root Scope:2-1:3-4:4-1[1363-1381]
Root Scope:2-1:3-4:4-1:5-1[1369-1378]
Local I<-v(Usages:0not assigned
Root Scope:2-1:3-4:4-1:5-1:6-1[1373-1377]
Root Scope:2-1:3-5[1383-1462]
Local G<-container(Usages:0not assigned
Local H<-valueList(Usages:0)
Local I<-local_returnVals(Usages:0)
Local J<-local_startIndex(Usages:0)
Local K<-local_context(Usages:0)
Root Scope:2-1:3-5:4-1[1399-1461]
Root Scope:2-1:3-5:4-1:5-1[1415-1458]
Local L<-returnValsIndex(Usages:0)
Local M<-containerKey(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-1:6-1[1422-1457]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-1[1426-1430]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2[1431-1446]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2:8-1[1436-1445]
Local N<-subkey(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2:8-1:9-1[1440-1444]
--minified 
