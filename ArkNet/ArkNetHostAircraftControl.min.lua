--minifying 
a={"ArkNetSasHostx01c","repl.it/@mgmchenry"}local m,n,o,p,q,r,s,t,u,v,w,x,y,z,A=_ENV,property.getText,string.gmatch,table.unpack,ipairs,'([^,\r\n]+)',false,"string","table","number"function b()local B,C,D,E,F,G,H,I,J,K,L=y(math,n("ArkMFb"))c=G(L)==3 or L()local M,N=L*2,360 local O,P,Q,R,S,T,U,V=y(m,n("ArkGF0"))local W={}for bc=1,30 do W[bc]=bc end local X,Y,Z,ab,bb,cb,db,eb,fb,gb,hb,ib,jb,kb,lb,mb,nb,ob={},{},{},{},0,100,false,{},-1,-1,{}local pb,qb,rb,sb,tb,ub,vb,wb,xb,yb,zb,Ab,Bb,Cb,Db,Eb,Fb,Gb,Hb,Ib,Jb,Kb,Lb,Mb,Nb,Ob=p(W)local Pb,Qb,Rb,Sb,Tb,Ub=60,0,{},{Jb,0,0,0,Kb,0,0,0,ub,vb,wb,xb,yb,zb,Ab,Bb,Lb,Mb,Nb,Cb,0,0,0,Db,Eb}local Vb,Wb,Xb,Yb local function Zb()end local function ac(bc,cc,dc)cc=cc or{}for ec=1,8 do dc=2^(ec-1)cc[ec]=bc%(dc*2)>=dc end return cc end function d()fb=gb bb=bb+1 for fc=1,32 do X[fc]=O(fc)Z[fc]=P(fc)Y[fc]=X[fc]ab[fc]=Z[fc]end Tb=Rb[Qb]or{}Qb=Qb%(Pb-1)+1 Ub=Rb[Qb]or{d={},t={},td={}}Rb[Qb]=Ub for fc,gc in q(Sb)do if gc>0 then Ub[gc]=X[fc]end end Ub[pb]=(Ub[wb]+Ub[xb])/2 Ub[qb]=math.asin((Ub[yb]-Ub[pb])*2)/L/2 Ub[rb]=math.asin((Ub[wb]-Ub[pb])*2/I(Ub[qb]))/L/2 if Ub[Cb]<0 then Ub[qb]=-Ub[qb]Ub[rb]=.5-Ub[rb]end for fc=pb,Eb do Ub.d[fc]=((Ub[fc]or 0)-(Tb[fc]or 0))*60 end ib,jb={p(X,1,4)},{p(X,5,8)}Ub[Nb]=ac(Ub[Nb])local bc=Ub[Nb]lb,mb=bc[7],lb mb=lb and not mb local cc,dc=Ub[Lb],Ub[Mb]if mb then kb={cc,dc}end local ec=bc[1]and 1 or 0 Xb=ib[1]+jb[1]Vb=ib[2]+jb[2]-z(ec*dc*B(dc)*32,-.5,.5)Yb=ib[3]+jb[3]+z(ec*cc*B(cc)*32,-.5,.5)Ub.t[qb]=0 Ub.td[qb]=(Ub.t[qb]-Ub[qb])*.1 nb=Ub[qb]~=Ub[qb]and 0 or z((Ub.d[qb]-Ub.td[qb])*10,-.5,.5)ob=(B(Xb)>0.1)and 0 or(D(C(Ub[rb]*16,.5),-.5))*-1 db=bc[3]if B(Vb)>0.1 and B(Ub[qb])<0.1 and db then cb=sAlt end if db and actuallyNever then nb=nb+z((Ub[pb]-cb)/100,-1,0.1)end Vb=Vb+((B(Vb)>0.01 and ec>0)and 0 or nb)Xb=Xb+ob Wb=Vb for fc,gc in q({Xb,Vb,Yb,Wb,Xb})do Y[fc]=gc end for fc=1,32 do Q(fc,Y[fc])R(fc,ab[fc])end gb=0 end do local bc,cc,dc,ec,fc,gc,hc,ic,jc,kc=255,y(screen,n("ArkSF0"))local lc,mc,nc,oc,pc,qc,rc,sc,tc,uc,vc,wc,xc,yc,zc,Ac,Bc={bc,bc,bc,bc},{bc,0,0},{0,bc,0},{0,0,bc},{bc,0,bc},{bc,bc,bc},{0,0,0}function e(Cc,Dc)hc(vc,wc,Cc)wc=wc+6 end function f()gb=gb+1 fb=D(gb,fb)sc,tc=jc(),kc()if gb==1 then if#eb==0 or eb[1][1]~=sc or eb[1][2]~=tc then eb[1]={sc,tc}eb[2]={sc/2-.5,tc/2-.5}end end xc(lc)yc(.5)fc(0,0,sc/2,tc/2)yc(1)xc(oc)vc,wc=2,4 xc(lb and nc or qc)e(T("tmath: %.4f",Ub.d[qb]-Ub.td[qb]))if kb and kb[1]then e(T("%.2f,%.2f",kb[1]*360,kb[2]*360))end if gb==1 and eb[2]then xc(nc)Ac(eb[2][1]+1.5,eb[2][2]+1.5,1,1)Ac(eb[2][1]-1.5,eb[2][2]-1.5,-1,-1)Ac(eb[2][1]+1.5,eb[2][2]-1.5,1,-1)Ac(eb[2][1]-1.5,eb[2][2]+1.5,-1,1)local Cc,Dc=z(Ub[Lb]*8,-1,1),z(Ub[Mb]*8,-1,1)Ac(eb[2][1],eb[2][2]+.5,Cc*B(Cc)*sc/2,0)Ac(eb[2][1],eb[2][2]-.5,g(Cc)*E(B(Cc))*sc/2,0)end end function h(Cc,Dc,Ec)yc(.5)Ac(Cc,Dc,0,0,qc)if Ec then Ac(Cc-1,Dc-1,2,2,qc)Ac(Cc-1,Dc+1,2,-2,qc)end yc(1)end function i(Cc)uc[4]=Cc*bc cc(p(uc))end function j(Cc,Dc,Ec,Fc,Gc)uc=A(U(Cc)==u and Cc or{Cc,Dc,Ec,Fc},uc)cc(p(uc))end function k(Cc,Dc,Ec,Fc,Gc,Hc)if Gc then xc(Gc)end Hc=E(Ec*Ec+Fc*Fc)if Hc<1 then Ec,Fc=Cc+Ec,Dc+Fc+(Fc>0 and 1 or-1)else Ec=Cc+Ec+Ec/Hc Fc=Dc+Fc+Fc/Hc end dc(Cc,Dc,Ec,Fc)end function l(Cc,Dc,Ec,Fc,Gc,Hc)if Gc then xc(Gc)end if Hc or Ec<2 or Fc<2 then fc(Cc,Dc,Ec,Fc)else ec(Cc,Dc,Ec-1,Fc-1)end end end return Zb end z,g,A,x,y=function(B,C,D)return C>B and C or D<B and D or B end,function(B)return B<0 and-1 or B>0 and 1 or 0 end,function()local B,C={...},{}if not B[1]then C,B=B[2],{p(B,3)}end for D,E in q(B)do for F,G in q(E)do C[F]=C[F]or G end end return C,p(C)end,function(B,C)C=C or{}for D in o(B,r)do C[#C+1]=D end return p(C)end,function(B,C,D,E,F)C,D=type(C)==t and{x(C)}or C,D or{}E=#D for G,H in pairs(C)do if type(H)==v then F=B[H]else F=B for I in o(H,'([^. ]+)')do F=F[I]end end G=type(G)==v and E+G or G D[G]=F end return p(D)end b()()
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
Global sAlt unchanged (Usages:0not assigned
Global actuallyNever unchanged (Usages:0not assigned
Global screen unchanged (Usages:0not assigned
Global e<-printText(Usages:0)
Global f<-onDraw(Usages:0)
Global g<-sign(Usages:0)
Global h<-drawCursor(Usages:0)
Global i<-betterSetAlpha(Usages:0)
Global j<-betterSetColor(Usages:0)
Global k<-betterDrawLineRel(Usages:0)
Global l<-betterDrawRect(Usages:0)
Global type unchanged (Usages:0not assigned
Global pairs unchanged (Usages:0not assigned
Root Scope[1-1271]
Root Scope:2-1[2-1270]
Local m<-G(Usages:0not assigned
Local n<-prop_getText(Usages:0not assigned
Local o<-gmatch(Usages:0not assigned
Local p<-unpack(Usages:0not assigned
Local q<-ipairz(Usages:0not assigned
Local r<-commaDelimited(Usages:0not assigned
Local s<-empty(Usages:0not assigned
Local t<-luaType_string(Usages:0not assigned
Local u<-luaType_table(Usages:0not assigned
Local v<-luaType_number(Usages:0not assigned
Local w<-nilzies(Usages:0not assigned
Local x<-stringUnpack(Usages:0)
Local y<-getTableValues(Usages:0)
Local z<-clamp(Usages:0)
Local A<-plop(Usages:0)
Root Scope:2-1:3-1[68-1075]
Root Scope:2-1:3-1:4-1[69-1074]
Local B<-abs(Usages:0not assigned
Local C<-min(Usages:0not assigned
Local D<-max(Usages:0not assigned
Local E<-sqrt(Usages:0not assigned
Local F<-ceil(Usages:0not assigned
Local G<-floor(Usages:0not assigned
Local H<-sin(Usages:0not assigned
Local I<-cos(Usages:0not assigned
Local J<-atan(Usages:0not assigned
Local K<-asin(Usages:0not assigned
Local L<-pi(Usages:0not assigned
Local M<-radPerTurn(Usages:0not assigned
Local N<-degPerTurn(Usages:0not assigned
Local O<-getNumber(Usages:0not assigned
Local P<-getBool(Usages:0not assigned
Local Q<-setNumber(Usages:0not assigned
Local R<-setBool(Usages:0not assigned
Local S<-prop_getNumber(Usages:0not assigned
Local T<-format(Usages:0not assigned
Local U<-type(Usages:0not assigned
Local V<-string_sub(Usages:0not assigned
Local W<-numberList(Usages:0not assigned
Local X<-I(Usages:0not assigned
Local Y<-O(Usages:0not assigned
Local Z<-Ib(Usages:0not assigned
Local ab<-Ob(Usages:0not assigned
Local bb<-tickCounter(Usages:0)
Local cb<-vAltHold(Usages:0)
Local db<-vAltHoldOn(Usages:0)
Local eb<-screenConfig(Usages:0not assigned
Local fb<-screenCount(Usages:0)
Local gb<-screensRendered(Usages:0)
Local hb<-uiState(Usages:0not assigned
Local ib<-seat1(Usages:0)
Local jb<-seat2(Usages:0)
Local kb<-lastTriggerClick(Usages:0)
Local lb<-lookTrigger(Usages:0)
Local mb<-triggerClick(Usages:0)
Local nb<-sasPitch(Usages:0)
Local ob<-sasRoll(Usages:0)
Local pb<-_altC(Usages:0not assigned
Local qb<-_pitch(Usages:0not assigned
Local rb<-_roll(Usages:0not assigned
Local sb<-_yaw(Usages:0not assigned
Local tb<-_hotKeyState(Usages:0not assigned
Local ub<-_gpsX(Usages:0not assigned
Local vb<-_gpsY(Usages:0not assigned
Local wb<-_altL(Usages:0not assigned
Local xb<-_altR(Usages:0not assigned
Local yb<-_altF(Usages:0not assigned
Local zb<-_altB(Usages:0not assigned
Local Ab<-_compass(Usages:0not assigned
Local Bb<-_forwardSpeed(Usages:0not assigned
Local Cb<-_tiltUp(Usages:0not assigned
Local Db<-_clock(Usages:0not assigned
Local Eb<-_mcTick(Usages:0not assigned
Local Fb<-_controlPitch(Usages:0not assigned
Local Gb<-_canardPitch(Usages:0not assigned
Local Hb<-_controlRoll(Usages:0not assigned
Local Ib<-_controlYaw(Usages:0not assigned
Local Jb<-_seat1(Usages:0not assigned
Local Kb<-_seat2(Usages:0not assigned
Local Lb<-_lookX(Usages:0not assigned
Local Mb<-_lookY(Usages:0not assigned
Local Nb<-_hotKeyFlags(Usages:0not assigned
Local Ob<-_lastIndex(Usages:0not assigned
Local Pb<-sampleCount(Usages:0not assigned
Local Qb<-bufferCursor(Usages:0)
Local Rb<-dataSamples(Usages:0not assigned
Local Sb<-inputConfig(Usages:0not assigned
Local Tb<-lastTickData(Usages:0)
Local Ub<-thisTickData(Usages:0)
Local Vb<-controlPitch(Usages:0)
Local Wb<-canardPitch(Usages:0)
Local Xb<-controlRoll(Usages:0)
Local Yb<-controlYaw(Usages:0)
Local Zb<-init(Usages:0not assigned
Local ac<-getFlags(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-1[151-160]
Local bc<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-1:6-1[155-159]
Root Scope:2-1:3-1:4-1:5-2[344-347]
Root Scope:2-1:3-1:4-1:5-2:6-1[345-346]
Root Scope:2-1:3-1:4-1:5-3[351-380]
Local bc<-flags(Usages:0not assigned
Local cc<-result(Usages:0)
Local dc<-_bit(Usages:0)
Root Scope:2-1:3-1:4-1:5-3:6-1[361-379]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-1[364-377]
Local ec<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-3:6-1:7-1:8-1[368-376]
Root Scope:2-1:3-1:4-1:5-4[383-655]
Root Scope:2-1:3-1:4-1:5-4:6-1[384-654]
Local bc<-hotKeys(Usages:0not assigned
Local cc<-pilotLookX(Usages:0not assigned
Local dc<-pilotLookY(Usages:0not assigned
Local ec<-mouseControl(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1[389-411]
Local fc<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1:8-1[393-410]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-2[426-442]
Local fc<-i(Usages:0not assigned
Local gc<-dataType(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-2:8-1[433-441]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-2:8-1:9-1[435-440]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-3[470-479]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-4[482-494]
Local fc<-dataType(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-4:8-1[486-493]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-5[529-533]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-6[590-595]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-7[600-607]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-8[625-637]
Local fc<-i(Usages:0not assigned
Local gc<-v(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-8:8-1[632-636]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-9[638-652]
Local fc<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-9:8-1[642-651]
Root Scope:2-1:3-1:4-1:5-5[656-1072]
Local bc<-F(Usages:0not assigned
Local cc<-setColor(Usages:0not assigned
Local dc<-drawLine(Usages:0not assigned
Local ec<-drawRect(Usages:0not assigned
Local fc<-drawRectF(Usages:0not assigned
Local gc<-drawTriangleF(Usages:0not assigned
Local hc<-drawText(Usages:0not assigned
Local ic<-drawTextBox(Usages:0not assigned
Local jc<-screen_getWidth(Usages:0not assigned
Local kc<-screen_getHeight(Usages:0not assigned
Local lc<-cSolidWhite(Usages:0not assigned
Local mc<-cRed(Usages:0not assigned
Local nc<-cGreen(Usages:0not assigned
Local oc<-cBlue(Usages:0not assigned
Local pc<-cMagenta(Usages:0not assigned
Local qc<-cWhite(Usages:0not assigned
Local rc<-cBlack(Usages:0not assigned
Local sc<-screenWidth(Usages:0)
Local tc<-screenHeight(Usages:0)
Local uc<-currentDrawColor(Usages:0)
Local vc<-textPosX(Usages:0)
Local wc<-textPosY(Usages:0)
Local xc<-betterSetColor(Usages:0not assigned
Local yc<-betterSetAlpha(Usages:0not assigned
Local zc<-betterDrawRect(Usages:0not assigned
Local Ac<-betterDrawLineRel(Usages:0not assigned
Local Bc<-drawCursor(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-1[757-772]
Local Cc<-text(Usages:0not assigned
Local Dc<-color(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-1:7-1[764-771]
Root Scope:2-1:3-1:4-1:5-5:6-2[775-881]
Root Scope:2-1:3-1:4-1:5-5:6-2:7-1[776-880]
Root Scope:2-1:3-1:4-1:5-5:6-2:7-1:8-1[788-802]
Root Scope:2-1:3-1:4-1:5-5:6-2:7-1:8-1:9-1[794-801]
Root Scope:2-1:3-1:4-1:5-5:6-2:7-1:8-2[826-831]
Root Scope:2-1:3-1:4-1:5-5:6-2:7-1:8-3[834-879]
Local Cc<-dX(Usages:0not assigned
Local Dc<-dY(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-3[884-913]
Local Cc<-touchX(Usages:0not assigned
Local Dc<-touchY(Usages:0not assigned
Local Ec<-touchOn(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-3:7-1[894-912]
Root Scope:2-1:3-1:4-1:5-5:6-3:7-1:8-1[901-910]
Root Scope:2-1:3-1:4-1:5-5:6-4[916-928]
Local Cc<-a(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-4:7-1[920-927]
Root Scope:2-1:3-1:4-1:5-5:6-5[931-963]
Local Cc<-r(Usages:0not assigned
Local Dc<-g(Usages:0not assigned
Local Ec<-b(Usages:0not assigned
Local Fc<-a(Usages:0not assigned
Local Gc<-local_packedColor(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-5:7-1[947-962]
Root Scope:2-1:3-1:4-1:5-5:6-6[966-1025]
Local Cc<-x(Usages:0not assigned
Local Dc<-y(Usages:0not assigned
Local Ec<-w(Usages:0)
Local Fc<-h(Usages:0)
Local Gc<-color(Usages:0not assigned
Local Hc<-l_dis(Usages:0)
Root Scope:2-1:3-1:4-1:5-5:6-6:7-1[985-1024]
Root Scope:2-1:3-1:4-1:5-5:6-6:7-1:8-1[987-990]
Root Scope:2-1:3-1:4-1:5-5:6-6:7-1:8-2[998-1006]
Root Scope:2-1:3-1:4-1:5-5:6-6:7-1:8-3[1007-1018]
Root Scope:2-1:3-1:4-1:5-5:6-7[1028-1071]
Local Cc<-x(Usages:0not assigned
Local Dc<-y(Usages:0not assigned
Local Ec<-w(Usages:0not assigned
Local Fc<-h(Usages:0not assigned
Local Gc<-color(Usages:0not assigned
Local Hc<-filled(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-7:7-1[1047-1070]
Root Scope:2-1:3-1:4-1:5-5:6-7:7-1:8-1[1049-1052]
Root Scope:2-1:3-1:4-1:5-5:6-7:7-1:8-2[1056-1062]
Root Scope:2-1:3-1:4-1:5-5:6-7:7-1:8-3[1063-1069]
Root Scope:2-1:3-2[1081-1100]
Local B<-a(Usages:0not assigned
Local C<-b(Usages:0not assigned
Local D<-c(Usages:0not assigned
Root Scope:2-1:3-2:4-1[1091-1099]
Root Scope:2-1:3-3[1101-1109]
Local B<-n(Usages:0not assigned
Root Scope:2-1:3-3:4-1[1105-1108]
Root Scope:2-1:3-4[1110-1159]
Root Scope:2-1:3-4:4-1[1111-1158]
Local B<-sources(Usages:0)
Local C<-result(Usages:0)
Root Scope:2-1:3-4:4-1:5-1[1119-1125]
Root Scope:2-1:3-4:4-1:5-2[1128-1154]
Local D<-i(Usages:0not assigned
Local E<-v(Usages:0not assigned
Root Scope:2-1:3-4:4-1:5-2:6-1[1135-1153]
Root Scope:2-1:3-4:4-1:5-2:6-1:7-1[1138-1152]
Local F<-i(Usages:0not assigned
Local G<-v(Usages:0not assigned
Root Scope:2-1:3-4:4-1:5-2:6-1:7-1:8-1[1145-1151]
Root Scope:2-1:3-5[1160-1186]
Local B<-text(Usages:0not assigned
Local C<-local_returnVals(Usages:0)
Root Scope:2-1:3-5:4-1[1167-1185]
Root Scope:2-1:3-5:4-1:5-1[1173-1182]
Local D<-v(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-1:6-1[1177-1181]
Root Scope:2-1:3-6[1187-1268]
Local B<-container(Usages:0not assigned
Local C<-valueList(Usages:0)
Local D<-local_returnVals(Usages:0)
Local E<-local_startIndex(Usages:0)
Local F<-local_context(Usages:0)
Root Scope:2-1:3-6:4-1[1203-1267]
Root Scope:2-1:3-6:4-1:5-1[1221-1264]
Local G<-returnValsIndex(Usages:0)
Local H<-containerKey(Usages:0not assigned
Root Scope:2-1:3-6:4-1:5-1:6-1[1228-1263]
Root Scope:2-1:3-6:4-1:5-1:6-1:7-1[1232-1236]
Root Scope:2-1:3-6:4-1:5-1:6-1:7-2[1237-1252]
Root Scope:2-1:3-6:4-1:5-1:6-1:7-2:8-1[1242-1251]
Local I<-subkey(Usages:0not assigned
Root Scope:2-1:3-6:4-1:5-1:6-1:7-2:8-1:9-1[1246-1250]
--minified 
