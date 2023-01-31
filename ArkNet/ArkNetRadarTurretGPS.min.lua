--minifying 
a={"ArkNetRadGPSTurretx01g","repl.it/@mgmchenry"}local l,m,n,o,p,q,r,s,t,u,v,w,x,y,z=_ENV,property.getText,string.gmatch,table.unpack,ipairs,'([^,\r\n]+)',false,"string","table","number"function b()local A,B,C,D,E,F,G,H,I,J=x(math,"abs,min,max,sqrt,ceil,floor,sin,cos,atan,pi")c=F(J)==3 or J()local K,L,M,N,O,P,Q,R=x(l,"input.getNumber,input.getBool,output.setNumber,output.setBool,property.getNumber,string.format,type,string.sub")local S,T,U,V,W,X,Y,Z,ab,bb,cb={},{},{},{},0,-1,-1,{cfg={1,2,3,4,5,6,9,10},h={},s=0},{cfg={21,22,23,24,0,0,25,26,27},h={},s=0},{cfg={11,12,13,14,15}},{0,0,0,0.125,0,0}local function db()end local function eb(fb,gb,hb)gb=gb or{}for ib=1,8 do hb=2^(ib-1)gb[ib]=fb%(hb*2)>=hb end return gb end function d()X=Y W=W+1 for kb=1,32 do S[kb]=K(kb)U[kb]=L(kb)end for kb=1,5 do bb[kb]=S[bb.cfg[kb]]end V[1]=false V[2]=bb[1]>8 cb[1],cb[2]=0,0 local fb,gb,hb=0,0 for kb,lb in ipairs({Z,ab})do lb.p={o(lb)}for mb=1,8 do lb[mb]=S[lb.cfg[mb]]end if lb.cfg[9]then eb(S[lb.cfg[9]],lb.h)else lb.h={o(U,1,6)}lb.h[7]=U[31]lb.h[8]=U[32]end if A(lb[3])>A(lb.p[3]or 0)then lb.s=y(lb.s+lb[3]*.1,-1,1)end if A(lb[4])>A(lb.p[4]or 0)then cb[3]=y(cb[3]+lb[4]*.1,0,1)end lb[11]=4^lb.s*64 if lb.h[2]then V[1]=V[1]or lb.h[7]V[2]=V[2]or lb.h[3]fb,gb=fb+y(lb[7]*A(lb[7])*lb[11],-1,1),gb+y(lb[8]*A(lb[8])*lb[11],-1,1)end end local ib,jb=O("StickX")or 0,O("StickY")or 0 hb=1-y(D(A(fb*gb))*2,0,.75)if Z.h[4]~=ab.h[4]then hb=0 end cb[1]=bb[2]*-12*hb-fb if bb[3]==0 then bb[3]=cb[2]or 0 end cb[6]=(bb[3]*-4*hb-gb)cb[2]=y(cb[6]*jb+cb[6]*(jb>0 and 1/60 or 1),-1,1)for kb=1,6 do M(kb,cb[kb])N(kb,V[kb])end Y=0 end do local fb,gb,hb,ib,jb,kb,lb,mb=255,x(screen,"setColor,drawLine,drawRect,drawRectF,drawTriangleF,getWidth,getHeight")local nb,ob,pb,qb,rb,sb,tb,ub,vb,wb,xb,yb,zb,Ab,Bb,Cb,Db={fb,fb,fb,fb},{fb,0,0},{0,fb,0},{0,0,fb},{fb,0,fb},{fb,fb,fb},{0,0,0}function e(Eb,Fb)drawText(xb,yb,Eb)yb=yb+6 end function f()local Eb,Fb,Gb=lb(),mb()local Hb,Ib=Eb/2-.5,Fb/2-.5 Gb=Z.h[8]and Z or ab local Jb,Kb,Lb=o(bb)local Mb,Nb,Ob,Pb,Qb,Rb={1,1,-1,-1},{1,0,-1,0}zb(tb)Ab(.5)Cb(5,Fb-2,Eb-10,0)Cb(Eb-2,5,0,Eb-10)zb(sb)Bb(5,Fb-3,(Eb-9)*(Gb.s+1)/2,2)Bb(Eb-3,Fb-4,2,(Eb-9)*(cb[3])*-1)Cb(1,5,0,Eb-10)Cb(0,(Eb-9)/2,3,0)zb(pb)Ab(1)Cb(0,(Eb-9)*(cb[2]+1)/2,3,0)Ob,Pb,Qb=G(bb[4]*J*2),H(bb[4]*J*2)*-1,B(Eb,Fb)*0.45 Cb(Hb+Ob*Qb,Ib+Pb*Qb,Ob*5,Pb*5)Cb(Hb+Ob*Qb,Ib+Pb*Qb,Pb*-2,Ob*2)Cb(Hb+Ob*Qb,Ib+Pb*Qb,Pb*2,Ob*-2)Cb(Hb+Ob*Qb*.8,Ib+Pb*Qb*.8,Ob*3,Pb*3)Cb(Hb-Pb*Qb,Ib+Ob*Qb,Pb*-4,Ob*4)Cb(Hb+Pb*Qb,Ib-Ob*Qb,Pb*4,Ob*-4)for Sb,Tb in ipairs({Z,ab})do if Tb.h[8]or Tb.h[4]then g=Sb==1 and pb or qb Pb=Fb-6*Sb-6 for Ub=1,8 do Ob=Ub*6+2 Bb(Ob,Pb,4,4,g,Tb.h[Ub])end Ob=y(Tb[7]*A(Tb[7])*64,-1,1)*Eb/2 Pb=y(Tb[8]*A(Tb[8])*64,-1,1)*Fb/2 Qb=2.5 for Ub,Vb in ipairs(Nb)do Rb=Nb[Ub+1]or Nb[1]hb(Hb+Ob+Qb*Vb,Ib-Pb+Qb*Rb,Hb+Ob-Qb*Rb,Ib-Pb+Qb*Vb)end end end Qb=1.5 zb(ob)Cb(Hb+Qb,Ib+1.5,2,2)Cb(Hb-Qb,Ib-1.5,-2,-2)Cb(Hb+Qb,Ib-1.5,2,-2)Cb(Hb-Qb,Ib+1.5,-2,2)Qb=5 Ob=Hb-y(Kb*Kb*64,-1,1)*Eb/2 Pb=Ib-y(Lb*Lb*64,-1,1)*Fb/2 g=Z.h[4]~=ab.h[4]and qb or Jb>1 and pb or ob zb(g)for Sb,Tb in ipairs(Mb)do Rb=Mb[Sb+1]or 1 Cb(Ob+Qb*Tb,Pb+Qb*Rb,0,-2*Rb)Cb(Ob+Qb*Tb,Pb+Qb*Rb,-2*Tb,0)end end function h(Eb)wb[4]=Eb*fb gb(o(wb))end function i(Eb,Fb,Gb,Hb,Ib)wb=z(Q(Eb)==t and Eb or{Eb,Fb,Gb,Hb},wb)gb(o(wb))end function j(Eb,Fb,Gb,Hb,Ib,Jb)if Ib then zb(Ib)end Jb=D(Gb*Gb+Hb*Hb)if Jb<1 then Gb,Hb=Eb+Gb,Fb+Hb+(Hb>0 and 1 or-1)else Gb=Eb+Gb+Gb/Jb Hb=Fb+Hb+Hb/Jb end hb(Eb,Fb,Gb,Hb)end function k(Eb,Fb,Gb,Hb,Ib,Jb)if Ib then zb(Ib)end if Jb or Gb<2 or Hb<2 then jb(Eb,Fb,Gb,Hb)else ib(Eb,Fb,Gb-1,Hb-1)end end end return db end y,z,w,x=function(A,B,C)return B>A and B or C<A and C or A end,function()local A,B={...},{}if not A[1]then B,A=A[2],{o(A,3)}end for C,D in p(A)do for E,F in p(D)do B[E]=B[E]or F end end return B,o(B)end,function(A,B)B=B or{}for C in n(A,q)do B[#B+1]=C end return o(B)end,function(A,B,C,D,E)B,C=type(B)==s and{w(B)}or B,C or{}D=#C for F,G in pairs(B)do if type(G)==u then E=A[G]else E=A for H in n(G,'([^. ]+)')do E=E[H]end end F=type(F)==u and D+F or F C[F]=E end return o(C)end b()()
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
Global d<-onTick(Usages:0)
Global screen unchanged (Usages:0not assigned
Global e<-printText(Usages:0)
Global drawText unchanged (Usages:0not assigned
Global f<-onDraw(Usages:0)
Global g<-color(Usages:0)
Global h<-betterSetAlpha(Usages:0)
Global i<-betterSetColor(Usages:0)
Global j<-betterDrawLineRel(Usages:0)
Global k<-betterDrawRect(Usages:0)
Global type unchanged (Usages:0not assigned
Global pairs unchanged (Usages:0not assigned
Root Scope[1-1175]
Root Scope:2-1[2-1174]
Local l<-G(Usages:0not assigned
Local m<-prop_getText(Usages:0not assigned
Local n<-gmatch(Usages:0not assigned
Local o<-unpack(Usages:0not assigned
Local p<-ipairz(Usages:0not assigned
Local q<-commaDelimited(Usages:0not assigned
Local r<-empty(Usages:0not assigned
Local s<-luaType_string(Usages:0not assigned
Local t<-luaType_table(Usages:0not assigned
Local u<-luaType_number(Usages:0not assigned
Local v<-nilzies(Usages:0not assigned
Local w<-stringUnpack(Usages:0)
Local x<-getTableValues(Usages:0)
Local y<-clamp(Usages:0)
Local z<-plop(Usages:0)
Root Scope:2-1:3-1[68-989]
Root Scope:2-1:3-1:4-1[69-988]
Local A<-abs(Usages:0not assigned
Local B<-min(Usages:0not assigned
Local C<-max(Usages:0not assigned
Local D<-sqrt(Usages:0not assigned
Local E<-ceil(Usages:0not assigned
Local F<-floor(Usages:0not assigned
Local G<-sin(Usages:0not assigned
Local H<-cos(Usages:0not assigned
Local I<-atan(Usages:0not assigned
Local J<-pi(Usages:0not assigned
Local K<-getNumber(Usages:0not assigned
Local L<-getBool(Usages:0not assigned
Local M<-setNumber(Usages:0not assigned
Local N<-setBool(Usages:0not assigned
Local O<-property_getNumber(Usages:0not assigned
Local P<-format(Usages:0not assigned
Local Q<-type(Usages:0not assigned
Local R<-string_sub(Usages:0not assigned
Local S<-I(Usages:0not assigned
Local T<-O(Usages:0not assigned
Local U<-Ib(Usages:0not assigned
Local V<-Ob(Usages:0not assigned
Local W<-tickCounter(Usages:0)
Local X<-screenCount(Usages:0)
Local Y<-screensRendered(Usages:0)
Local Z<-s1(Usages:0not assigned
Local ab<-s2(Usages:0not assigned
Local bb<-ts(Usages:0not assigned
Local cb<-tc(Usages:0not assigned
Local db<-init(Usages:0not assigned
Local eb<-getFlags(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-1[172-175]
Root Scope:2-1:3-1:4-1:5-1:6-1[173-174]
Root Scope:2-1:3-1:4-1:5-2[179-208]
Local fb<-flags(Usages:0not assigned
Local gb<-result(Usages:0)
Local hb<-_bit(Usages:0)
Root Scope:2-1:3-1:4-1:5-2:6-1[189-207]
Root Scope:2-1:3-1:4-1:5-2:6-1:7-1[192-205]
Local ib<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-2:6-1:7-1:8-1[196-204]
Root Scope:2-1:3-1:4-1:5-3[211-402]
Root Scope:2-1:3-1:4-1:5-3:6-1[212-401]
Local fb<-cx(Usages:0)
Local gb<-cy(Usages:0)
Local hb<-cz(Usages:0)
Local ib<-stickyX(Usages:0not assigned
Local jb<-stickyY(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-3:6-1:7-1[217-231]
Local kb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-3:6-1:7-1:8-1[221-230]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-2[232-243]
Local kb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-3:6-1:7-2:8-1[236-242]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-3[261-346]
Local kb<-si(Usages:0not assigned
Local lb<-st(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-3:6-1:7-3:8-1[268-345]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-3:8-1:9-1[272-283]
Local mb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-3:6-1:7-3:8-1:9-1:10-1[276-282]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-3:8-1:9-2[285-290]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-3:8-1:9-3[291-299]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-3:8-1:9-4[304-309]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-3:8-1:9-5[314-319]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-3:8-1:9-6[323-344]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-4[363-365]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-5[371-374]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-6[385-399]
Local kb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-3:6-1:7-6:8-1[389-398]
Root Scope:2-1:3-1:4-1:5-4[403-986]
Local fb<-F(Usages:0not assigned
Local gb<-setColor(Usages:0not assigned
Local hb<-drawLine(Usages:0not assigned
Local ib<-drawRect(Usages:0not assigned
Local jb<-drawRectF(Usages:0not assigned
Local kb<-drawTriangleF(Usages:0not assigned
Local lb<-screen_getWidth(Usages:0not assigned
Local mb<-screen_getHeight(Usages:0not assigned
Local nb<-cSolidWhite(Usages:0not assigned
Local ob<-cRed(Usages:0not assigned
Local pb<-cGreen(Usages:0not assigned
Local qb<-cBlue(Usages:0not assigned
Local rb<-cMagenta(Usages:0not assigned
Local sb<-cWhite(Usages:0not assigned
Local tb<-cBlack(Usages:0not assigned
Local ub<-screenWidth(Usages:0not assigned
Local vb<-screenHeight(Usages:0not assigned
Local wb<-currentDrawColor(Usages:0)
Local xb<-textPosX(Usages:0not assigned
Local yb<-textPosY(Usages:0)
Local zb<-betterSetColor(Usages:0not assigned
Local Ab<-betterSetAlpha(Usages:0not assigned
Local Bb<-betterDrawRect(Usages:0not assigned
Local Cb<-betterDrawLineRel(Usages:0not assigned
Local Db<-printText(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1[497-514]
Local Eb<-text(Usages:0not assigned
Local Fb<-color(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1[504-513]
Root Scope:2-1:3-1:4-1:5-4:6-2[517-827]
Root Scope:2-1:3-1:4-1:5-4:6-2:7-1[518-826]
Local Eb<-w(Usages:0not assigned
Local Fb<-h(Usages:0not assigned
Local Gb<-ds(Usages:0)
Local Hb<-wC(Usages:0not assigned
Local Ib<-hC(Usages:0not assigned
Local Jb<-rng(Usages:0not assigned
Local Kb<-rX(Usages:0not assigned
Local Lb<-rY(Usages:0not assigned
Local Mb<-corners(Usages:0not assigned
Local Nb<-c2(Usages:0not assigned
Local Ob<-cx(Usages:0)
Local Pb<-cy(Usages:0)
Local Qb<-cD(Usages:0)
Local Rb<-cz(Usages:0)
Root Scope:2-1:3-1:4-1:5-4:6-2:7-1:8-1[670-753]
Local Sb<-si(Usages:0not assigned
Local Tb<-st(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-2:7-1:8-1:9-1[677-752]
Root Scope:2-1:3-1:4-1:5-4:6-2:7-1:8-1:9-1:10-1[680-751]
Root Scope:2-1:3-1:4-1:5-4:6-2:7-1:8-1:9-1:10-1:11-1[690-704]
Local Ub<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-2:7-1:8-1:9-1:10-1:11-1:12-1[694-703]
Root Scope:2-1:3-1:4-1:5-4:6-2:7-1:8-1:9-1:10-1:11-2[720-750]
Local Ub<-i(Usages:0not assigned
Local Vb<-v(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-2:7-1:8-1:9-1:10-1:11-2:12-1[727-749]
Root Scope:2-1:3-1:4-1:5-4:6-2:7-1:8-2[797-825]
Local Sb<-i(Usages:0not assigned
Local Tb<-v(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-2:7-1:8-2:9-1[804-824]
Root Scope:2-1:3-1:4-1:5-4:6-3[830-842]
Local Eb<-a(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-3:7-1[834-841]
Root Scope:2-1:3-1:4-1:5-4:6-4[845-877]
Local Eb<-r(Usages:0not assigned
Local Fb<-g(Usages:0not assigned
Local Gb<-b(Usages:0not assigned
Local Hb<-a(Usages:0not assigned
Local Ib<-local_packedColor(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-4:7-1[861-876]
Root Scope:2-1:3-1:4-1:5-4:6-5[880-939]
Local Eb<-x(Usages:0not assigned
Local Fb<-y(Usages:0not assigned
Local Gb<-w(Usages:0)
Local Hb<-h(Usages:0)
Local Ib<-color(Usages:0not assigned
Local Jb<-l_dis(Usages:0)
Root Scope:2-1:3-1:4-1:5-4:6-5:7-1[899-938]
Root Scope:2-1:3-1:4-1:5-4:6-5:7-1:8-1[901-904]
Root Scope:2-1:3-1:4-1:5-4:6-5:7-1:8-2[912-920]
Root Scope:2-1:3-1:4-1:5-4:6-5:7-1:8-3[921-932]
Root Scope:2-1:3-1:4-1:5-4:6-6[942-985]
Local Eb<-x(Usages:0not assigned
Local Fb<-y(Usages:0not assigned
Local Gb<-w(Usages:0not assigned
Local Hb<-h(Usages:0not assigned
Local Ib<-color(Usages:0not assigned
Local Jb<-filled(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-6:7-1[961-984]
Root Scope:2-1:3-1:4-1:5-4:6-6:7-1:8-1[963-966]
Root Scope:2-1:3-1:4-1:5-4:6-6:7-1:8-2[970-976]
Root Scope:2-1:3-1:4-1:5-4:6-6:7-1:8-3[977-983]
Root Scope:2-1:3-2[994-1013]
Local A<-a(Usages:0not assigned
Local B<-b(Usages:0not assigned
Local C<-c(Usages:0not assigned
Root Scope:2-1:3-2:4-1[1004-1012]
Root Scope:2-1:3-3[1014-1063]
Root Scope:2-1:3-3:4-1[1015-1062]
Local A<-sources(Usages:0)
Local B<-result(Usages:0)
Root Scope:2-1:3-3:4-1:5-1[1023-1029]
Root Scope:2-1:3-3:4-1:5-2[1032-1058]
Local C<-i(Usages:0not assigned
Local D<-v(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-2:6-1[1039-1057]
Root Scope:2-1:3-3:4-1:5-2:6-1:7-1[1042-1056]
Local E<-i(Usages:0not assigned
Local F<-v(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-2:6-1:7-1:8-1[1049-1055]
Root Scope:2-1:3-4[1064-1090]
Local A<-text(Usages:0not assigned
Local B<-local_returnVals(Usages:0)
Root Scope:2-1:3-4:4-1[1071-1089]
Root Scope:2-1:3-4:4-1:5-1[1077-1086]
Local C<-v(Usages:0not assigned
Root Scope:2-1:3-4:4-1:5-1:6-1[1081-1085]
Root Scope:2-1:3-5[1091-1172]
Local A<-container(Usages:0not assigned
Local B<-valueList(Usages:0)
Local C<-local_returnVals(Usages:0)
Local D<-local_startIndex(Usages:0)
Local E<-local_context(Usages:0)
Root Scope:2-1:3-5:4-1[1107-1171]
Root Scope:2-1:3-5:4-1:5-1[1125-1168]
Local F<-returnValsIndex(Usages:0)
Local G<-containerKey(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-1:6-1[1132-1167]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-1[1136-1140]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2[1141-1156]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2:8-1[1146-1155]
Local H<-subkey(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2:8-1:9-1[1150-1154]
--minified 
