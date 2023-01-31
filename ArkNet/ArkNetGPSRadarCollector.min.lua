--minifying 
a=1 b={"ArkNetGPSRadarClctx02b","repl.it/@mgmchenry"}local q,r,s,t,u,v,w,x,y,z,A,B=_ENV,property.getText,string.gmatch,ipairs,'([^,\r\n]+)',"string","table","number"local C,D,E=q[w].unpack,q[w].insert,q[w].remove function c()local F,G,H,I,J,K,L,M,N,O,P,Q=z(math,r("ArkMFc"))d=K(Q)==3 or Q()local R,S,T,U,V,W,X,Y=z(q,r("ArkGF0"))local Z,ab,bb=Q*2,360,{}for zb=1,30 do bb[zb]=zb end local cb,db,eb,fb,gb,hb,ib,jb,kb,lb,mb={},{},{},{},0,-1,-1,-1 local nb,ob,pb,qb,rb,sb,tb,ub=60,0,{},{},{},{}local vb,wb,xb,yb function e(zb,Ab,Bb,Cb)Cb,Bb=(Cb or{}),Bb or 1 Cb[1],Cb[2],Cb[3]=zb[1]+Ab[1]*Bb,zb[2]+Ab[2]*Bb,zb[3]+Ab[3]*Bb return Cb end function f(zb,Ab,Bb,Cb,Db,Eb)Bb,Cb,Db,Eb=(Bb or{}),C(Ab)for Fb=1,3 do Bb[Fb]=Cb*zb[Fb]+Db*zb[Fb+3]+Eb*zb[Fb+6]end return Bb end function g(zb,Ab,Bb)Ab,Bb=Ab or{},{C(zb)}for Cb=0,2 do for Db=0,2 do Ab[1+Cb+Db*3]=Bb[1+Db+Cb*3]end end return Ab end function h(zb,Ab)for Bb,Cb in t(zb)do Ab=(Ab or 0)+Cb*Cb end return I(Ab)end function i()ib=jb gb=gb+1 cb[0]=0 for zb=1,32 do cb[zb]=R(zb)eb[zb]=S(zb)db[zb]=cb[zb]fb[zb]=eb[zb]end hb,kb,lb,mb=z(cb,{32,29,30,31})tb=pb[ob]or{}ob=ob%(nb-1)+1 ub=pb[ob]or{d={},t={},td={}}pb[ob]=ub rb={}do local zb,Ab,Bb,Cb,Db,Eb,Fb=z(cb,{4,8,12,16,20,24,28})local Gb,Hb,Ib,Jb,Kb,Lb,Mb={},L(Z*Cb),L(Z*Db),L(Z*Eb),Z*Fb qb=I(Hb*Hb+Jb*Jb)qb={Jb/qb,-Ib*Hb/qb,Hb;0,qb,Ib;-Hb/qb,-Ib*Jb/qb,Jb}Lb=M(Kb)Kb=L(Kb)for Nb=1,7,3 do qb[Nb],qb[Nb+1]=Lb*qb[Nb]-Kb*qb[Nb+1],Kb*qb[Nb]+Lb*qb[Nb+1]end qb.p={zb,Ab,Bb}for Nb=1,6 do local Ob,Pb,Qb,Rb,Sb,Tb,Ub=C(cb,4*Nb-3,4*Nb-1)if(Ob>0)then Rb,Sb=L(Pb*Z),L(Qb*Z)Pb,Qb=M(Pb*Z),M(Qb*Z)Tb={Rb*Qb*Ob,Pb*Qb*Ob,Sb*Ob}Tb=vb(wb(qb,Tb),qb.p)for Vb,Wb in t(sb)do if Wb then Rb=yb(vb(Tb,Wb.h[1],-1))if Rb<.03*Ob+2 then Wb.x=Rb Wb.i=Nb Tb.ci=Vb sb[Vb]=false Ub=Wb break end end end Ub=Ub or{h={}}Tb.d=Ob Tb.t=hb Tb.i=Nb Tb.c=Ub rb[Nb]=Tb if F(cb[25]/Ob-1)<.02 then Ub.ss=cb[26]Ub.m=cb[25]*cb[26]cb[25]=0 elseif Ub.m then Ub.ss=Ub.m/Ob end while#Ub.h>59 do E(Ub.h,60)end D(Ub.h,1,Tb)D(Gb,Ub)Rb=G(#Ub.h,10)Ub.p={0,0,0}Ub.md,Ub.ld=Ob,Ob for Vb,Wb in t(Ub.h)do if Vb>Rb then break end vb(Ub.p,Wb,1/Rb,Ub.p)Ub.md=H(Ub.md,Wb.d)Ub.ld=G(Ub.ld,Wb.d)end Ub.d=yb(vb(qb.p,Ub.p,-1))end end for Nb,Ob in t(sb)do if Ob and#Gb<60 then D(Gb,Ob)end end sb=Gb end for zb=1,32 do T(zb,db[zb])U(zb,fb[zb])end jb=0 end do local zb,Ab,Bb,Cb,Db,Eb,Fb,Gb,Hb,Ib=255,z(screen,r("ArkSF0"))local Jb,Kb,Lb,Mb,Nb,Ob,Pb,Qb,Rb,Sb,Tb,Ub,Vb,Wb,Xb,Yb,Zb,ac={zb,zb,zb,zb},{zb,0,0},{0,zb,0},{0,0,zb},{zb,0,zb},{zb,zb,zb},{0,0,0}function j(bc,cc)Fb(Tb,Ub,bc)Ub=Ub+6 end function k()jb=jb+1 ib=H(jb,ib)Qb,Rb=Hb(),Ib()local bc={Qb/2-.5,Rb/2-.5,2.2-kb*2.175}bc[4]=1/N(bc[3]/2)bc[5]=bc[4]*Rb bc[6]=Qb/Rb Vb(Jb)Vb(Kb)Tb,Ub=2,4 local cc=xb(qb)cc.p=vb({0,0,0},qb.p,-1)Vb(#rb>0 and Lb or Ob)Ub=Ub+6*a ac(W("v07 Contacts %i, Targets %i",#sb,#rb))Vb(Lb)Zb(bc[1],bc[2])if a>-1 then Vb(Mb)for ec,fc in t(rb)do local gc,hc,ic,jc=wb(cc,vb(fc,cc.p))ic,jc=bc[1]+gc[1]/gc[2]*bc[4]*Rb/2,bc[2]-gc[3]/gc[2]*bc[4]*Rb/2 Fb(ic,jc-2,W("%i %0.1fm",ec,fc.d))end end local dc={}for ec,fc in t(sb)do local gc,hc,ic,jc,kc=vb(fc.p,cc.p)wb(cc,gc,gc)ic,jc,kc=gc[1]/gc[2]*bc[4],gc[3]/gc[2]*bc[4],3/gc[2]*bc[5]if ec<3 and a>3 then local lc="%0.2f %0.2f %0.2f"ac(W("%i "..lc,ec,ic,jc,kc))ac(W("   i%i #h%i mx  %0.2f",fc.i or-1,#fc.h,fc.x or-1))ac(W("   maxD: %0.2f %0.0fm minD: %0.2f %0.0fm",fc.md/fc.d,fc.md,fc.ld/fc.d,fc.ld))end if gc[2]>0 then if a>0 and ec<7 then Wb(.6)local lc=(hb%180)/180 local mc=A(59-K(60*lc*3),1,59)local nc=A(120-K(60*lc*3),2,60)if ec<2 then end local oc,pc for qc=nc,mc,-1 do local rc=fc.h[qc]or{0,0,0}local sc,tc,uc,vc=wb(cc,vb(rc,cc.p))uc,vc=bc[1]+sc[1]/sc[2]*bc[4]*Rb/2,bc[2]-sc[3]/sc[2]*bc[4]*Rb/2 if oc then Yb(oc,pc,uc-oc,vc-pc,Mb)elseif ec<2 then ac(W("   x0:%0.0f y0:%0.0f",uc,vc))end oc,pc=uc,vc end Wb(1)end hc=F(ic)>.95*bc[6]or F(jc)>.95 if hc then ic,jc=A(ic,-.95*bc[6],.95*bc[6]),A(jc,-.95,.95)end ic,jc=bc[1]+ic*Rb/2,bc[2]-jc*Rb/2 Vb(a<1 and Kb or Lb)Zb(ic,jc,A(kc,2-a,5-a))for lc,mc in t(dc)do hc=hc or I((mc[1]-ic)^2+(mc[2]-jc)^2)<mc[3]+kc if hc then break end end if a>0 or ec<2 then if not hc then Vb(Ob)Xb(ic-kc,jc-kc,kc*2,kc*2)D(dc,{ic,jc,kc})Fb(ic-10,jc+6,W("%i %0.0fm",ec,fc.d))if fc.m then Fb(ic-10,jc+12,W("%0.1fT",ec,fc.m))end end end end end end function l(bc,cc,dc,ec)dc,ec=dc or 1,ec or 1.5 Yb(bc+ec,cc+ec,dc,dc)Yb(bc-ec,cc-ec,-dc,-dc)Yb(bc+ec,cc-ec,dc,-dc)Yb(bc-ec,cc+ec,-dc,dc)end function m(bc)Sb[4]=bc*zb Ab(C(Sb))end function n(bc,cc,dc,ec,fc)Sb=B(X(bc)==w and bc or{bc,cc,dc,ec},Sb)Ab(C(Sb))end function o(bc,cc,dc,ec,fc,gc)if fc then Vb(fc)end gc=I(dc*dc+ec*ec)if gc<1 then dc,ec=bc+dc,cc+ec+(ec>0 and 1 or-1)else dc=bc+dc+dc/gc ec=cc+ec+ec/gc end Bb(bc,cc,dc,ec)end function p(bc,cc,dc,ec,fc,gc)if fc then Vb(fc)end if gc or dc<2 or ec<2 then Db(bc,cc,dc,ec)else Cb(bc,cc,dc-1,ec-1)end end end end A,B,y,z=function(F,G,H)return G>F and G or H<F and H or F end,function()local F,G={...},{}if not F[1]then G,F=F[2],{C(F,3)}end for H,I in t(F)do for J,K in t(I)do G[J]=G[J]or K end end return G,C(G)end,function(F,G)G=G or{}for H in s(F,u)do G[#G+1]=H end return C(G)end,function(F,G,H,I,J)G,H=type(G)==v and{y(G)}or G,H or{}I=#H for K,L in pairs(G)do if type(L)==x then J=F[L]else J=F for M in s(L,'([^. ]+)')do J=J[M]end end K=type(K)==x and I+K or K H[K]=J end return C(H)end c()
Scope variable info and rename assignments
Global Scope[??-??]
Global a<-rid(Usages:0)
Global b<-source(Usages:0)
Global _ENV unchanged (Usages:0not assigned
Global property unchanged (Usages:0not assigned
Global string unchanged (Usages:0not assigned
Global ipairs unchanged (Usages:0not assigned
Global c<-main(Usages:0)
Global math unchanged (Usages:0not assigned
Global d<-_(Usages:0)
Global e<-addVec3(Usages:0)
Global f<-mulMat3Vec3(Usages:0)
Global g<-invMat3(Usages:0)
Global h<-vecLength(Usages:0)
Global i<-onTick(Usages:0)
Global screen unchanged (Usages:0not assigned
Global j<-printText(Usages:0)
Global k<-onDraw(Usages:0)
Global l<-drawCross(Usages:0)
Global m<-betterSetAlpha(Usages:0)
Global n<-betterSetColor(Usages:0)
Global o<-betterDrawLineRel(Usages:0)
Global p<-betterDrawRect(Usages:0)
Global type unchanged (Usages:0not assigned
Global pairs unchanged (Usages:0not assigned
Root Scope[1-1678]
Root Scope:2-1[2-1677]
Local q<-G(Usages:0not assigned
Local r<-prop_getText(Usages:0not assigned
Local s<-gmatch(Usages:0not assigned
Local t<-ipairz(Usages:0not assigned
Local u<-commaDelimited(Usages:0not assigned
Local v<-luaType_string(Usages:0not assigned
Local w<-luaType_table(Usages:0not assigned
Local x<-luaType_number(Usages:0not assigned
Local y<-stringUnpack(Usages:0)
Local z<-getTableValues(Usages:0)
Local A<-clamp(Usages:0)
Local B<-plop(Usages:0)
Local C<-unpack(Usages:0not assigned
Local D<-insert(Usages:0not assigned
Local E<-remove(Usages:0not assigned
Root Scope:2-1:3-1[74-1492]
Root Scope:2-1:3-1:4-1[75-1491]
Local F<-abs(Usages:0not assigned
Local G<-min(Usages:0not assigned
Local H<-max(Usages:0not assigned
Local I<-sqrt(Usages:0not assigned
Local J<-ceil(Usages:0not assigned
Local K<-floor(Usages:0not assigned
Local L<-sin(Usages:0not assigned
Local M<-cos(Usages:0not assigned
Local N<-tan(Usages:0not assigned
Local O<-atan(Usages:0not assigned
Local P<-asin(Usages:0not assigned
Local Q<-pi(Usages:0not assigned
Local R<-getNumber(Usages:0not assigned
Local S<-getBool(Usages:0not assigned
Local T<-setNumber(Usages:0not assigned
Local U<-setBool(Usages:0not assigned
Local V<-prop_getNumber(Usages:0not assigned
Local W<-format(Usages:0not assigned
Local X<-type(Usages:0not assigned
Local Y<-string_sub(Usages:0not assigned
Local Z<-tau(Usages:0not assigned
Local ab<-degPerTurn(Usages:0not assigned
Local bb<-numberList(Usages:0not assigned
Local cb<-I(Usages:0not assigned
Local db<-O(Usages:0not assigned
Local eb<-Ib(Usages:0not assigned
Local fb<-Ob(Usages:0not assigned
Local gb<-tickCounter(Usages:0)
Local hb<-mcClock(Usages:0)
Local ib<-screenCount(Usages:0)
Local jb<-screensRendered(Usages:0)
Local kb<-camFov(Usages:0)
Local lb<-pivotX(Usages:0)
Local mb<-pivotY(Usages:0)
Local nb<-sampleCount(Usages:0not assigned
Local ob<-bufferCursor(Usages:0)
Local pb<-dataSamples(Usages:0not assigned
Local qb<-rm(Usages:0)
Local rb<-targets(Usages:0)
Local sb<-contacts(Usages:0)
Local tb<-lastTickData(Usages:0)
Local ub<-thisTickData(Usages:0)
Local vb<-addVec3(Usages:0not assigned
Local wb<-mulMat3Vec3(Usages:0not assigned
Local xb<-invMat3(Usages:0not assigned
Local yb<-vecLength(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-1[160-169]
Local zb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-1:6-1[164-168]
Root Scope:2-1:3-1:4-1:5-2[241-273]
Local zb<-v1(Usages:0not assigned
Local Ab<-v2(Usages:0not assigned
Local Bb<-scale(Usages:0)
Local Cb<-_retVec(Usages:0)
Root Scope:2-1:3-1:4-1:5-2:6-1[254-272]
Root Scope:2-1:3-1:4-1:5-3[276-323]
Local zb<-rm(Usages:0not assigned
Local Ab<-vec3(Usages:0not assigned
Local Bb<-_retVec(Usages:0)
Local Cb<-_x(Usages:0)
Local Db<-_y(Usages:0)
Local Eb<-_z(Usages:0)
Root Scope:2-1:3-1:4-1:5-3:6-1[295-322]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-1[303-320]
Local Fb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-3:6-1:7-1:8-1[307-319]
Root Scope:2-1:3-1:4-1:5-4[326-364]
Local zb<-rm(Usages:0not assigned
Local Ab<-_retInv(Usages:0)
Local Bb<-_v1(Usages:0)
Root Scope:2-1:3-1:4-1:5-4:6-1[336-363]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1[342-361]
Local Cb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1:8-1[346-360]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1:8-1:9-1[347-359]
Local Db<-j(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1:8-1:9-1:10-1[351-358]
Root Scope:2-1:3-1:4-1:5-5[367-394]
Local zb<-vec(Usages:0not assigned
Local Ab<-_l(Usages:0)
Root Scope:2-1:3-1:4-1:5-5:6-1[374-393]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-1[377-390]
Local Bb<-_(Usages:0not assigned
Local Cb<-v(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-1:7-1:8-1[384-389]
Root Scope:2-1:3-1:4-1:5-6[397-778]
Root Scope:2-1:3-1:4-1:5-6:6-1[398-777]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-1[404-426]
Local zb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-1:8-1[408-425]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2[446-760]
Local zb<-gX(Usages:0not assigned
Local Ab<-gY(Usages:0not assigned
Local Bb<-gZ(Usages:0not assigned
Local Cb<-tX(Usages:0not assigned
Local Db<-tY(Usages:0not assigned
Local Eb<-tZ(Usages:0not assigned
Local Fb<-cY(Usages:0not assigned
Local Gb<-newContacts(Usages:0not assigned
Local Hb<-x(Usages:0not assigned
Local Ib<-y(Usages:0not assigned
Local Jb<-z(Usages:0not assigned
Local Kb<-s(Usages:0)
Local Lb<-c(Usages:0)
Local Mb<-newContact(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-1[529-551]
Local Nb<-j(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-1:9-1[533-550]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2[556-738]
Local Nb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1[560-737]
Local Ob<-d(Usages:0not assigned
Local Pb<-cA(Usages:0)
Local Qb<-cE(Usages:0)
Local Rb<-sA(Usages:0)
Local Sb<-sE(Usages:0)
Local Tb<-tXYZ(Usages:0)
Local Ub<-contact(Usages:0)
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1[587-736]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1:11-1[621-652]
Local Vb<-ci(Usages:0not assigned
Local Wb<-c(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1:11-1:12-1[628-651]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1:11-1:12-1:13-1[630-650]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1:11-1:12-1:13-1:14-1[638-649]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1:11-2[669-676]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1:11-3[678-682]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1:11-4[684-687]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1:11-5[704-730]
Local Vb<-i(Usages:0not assigned
Local Wb<-t(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1:11-5:12-1[711-729]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-2:9-1:10-1:11-5:12-1:13-1[714-715]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-3[741-757]
Local Nb<-_(Usages:0not assigned
Local Ob<-c(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-3:9-1[748-756]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-3:9-1:10-1[751-755]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-3[761-775]
Local zb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-3:8-1[765-774]
Root Scope:2-1:3-1:4-1:5-7[779-1490]
Local zb<-F(Usages:0not assigned
Local Ab<-setColor(Usages:0not assigned
Local Bb<-drawLine(Usages:0not assigned
Local Cb<-drawRect(Usages:0not assigned
Local Db<-drawRectF(Usages:0not assigned
Local Eb<-drawTriangleF(Usages:0not assigned
Local Fb<-drawText(Usages:0not assigned
Local Gb<-drawTextBox(Usages:0not assigned
Local Hb<-screen_getWidth(Usages:0not assigned
Local Ib<-screen_getHeight(Usages:0not assigned
Local Jb<-cSolidWhite(Usages:0not assigned
Local Kb<-cRed(Usages:0not assigned
Local Lb<-cGreen(Usages:0not assigned
Local Mb<-cBlue(Usages:0not assigned
Local Nb<-cMagenta(Usages:0not assigned
Local Ob<-cWhite(Usages:0not assigned
Local Pb<-cBlack(Usages:0not assigned
Local Qb<-screenWidth(Usages:0)
Local Rb<-screenHeight(Usages:0)
Local Sb<-currentDrawColor(Usages:0)
Local Tb<-textPosX(Usages:0)
Local Ub<-textPosY(Usages:0)
Local Vb<-betterSetColor(Usages:0not assigned
Local Wb<-betterSetAlpha(Usages:0not assigned
Local Xb<-betterDrawRect(Usages:0not assigned
Local Yb<-betterDrawLineRel(Usages:0not assigned
Local Zb<-drawCross(Usages:0not assigned
Local ac<-printText(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-1[883-898]
Local bc<-text(Usages:0not assigned
Local cc<-color(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-1:7-1[890-897]
Root Scope:2-1:3-1:4-1:5-7:6-2[901-1281]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1[902-1280]
Local bc<-screenFov(Usages:0not assigned
Local cc<-cMat(Usages:0not assigned
Local dc<-boxes(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-1[959-1009]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-1:9-1[964-1008]
Local ec<-i(Usages:0not assigned
Local fc<-t(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-1:9-1:10-1[971-1007]
Local gc<-tCam(Usages:0not assigned
Local hc<-isClipped(Usages:0not assigned
Local ic<-x(Usages:0)
Local jc<-y(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2[1015-1279]
Local ec<-i(Usages:0not assigned
Local fc<-c(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1[1022-1278]
Local gc<-tCam(Usages:0not assigned
Local hc<-isClipped(Usages:0)
Local ic<-dX(Usages:0)
Local jc<-dY(Usages:0)
Local kc<-dR(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-1[1058-1082]
Local lc<-f3(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2[1084-1277]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-1[1087-1180]
Local lc<-anim(Usages:0not assigned
Local mc<-hMin(Usages:0not assigned
Local nc<-hMax(Usages:0not assigned
Local oc<-x1(Usages:0)
Local pc<-y1(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-1:12-1[1106-1107]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-1:12-2[1116-1178]
Local qc<-ih(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-1:12-2:13-1[1120-1177]
Local rc<-h(Usages:0not assigned
Local sc<-hCam(Usages:0not assigned
Local tc<-isClipped(Usages:0not assigned
Local uc<-x0(Usages:0)
Local vc<-y0(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-1:12-2:13-1:14-1[1156-1165]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-1:12-2:13-1:14-2[1167-1172]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-2[1188-1197]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-3[1219-1240]
Local lc<-_(Usages:0not assigned
Local mc<-b(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-3:12-1[1226-1239]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-3:12-1:13-1[1237-1238]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-4[1243-1276]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-4:12-1[1245-1275]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2:9-1:10-2:11-4:12-1:13-1[1267-1274]
Root Scope:2-1:3-1:4-1:5-7:6-3[1284-1331]
Local bc<-centerX(Usages:0not assigned
Local cc<-centerY(Usages:0not assigned
Local dc<-len(Usages:0)
Local ec<-gap(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-3:7-1[1297-1330]
Root Scope:2-1:3-1:4-1:5-7:6-4[1334-1346]
Local bc<-a(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-4:7-1[1338-1345]
Root Scope:2-1:3-1:4-1:5-7:6-5[1349-1381]
Local bc<-r(Usages:0not assigned
Local cc<-g(Usages:0not assigned
Local dc<-b(Usages:0not assigned
Local ec<-a(Usages:0not assigned
Local fc<-local_packedColor(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-5:7-1[1365-1380]
Root Scope:2-1:3-1:4-1:5-7:6-6[1384-1443]
Local bc<-x(Usages:0not assigned
Local cc<-y(Usages:0not assigned
Local dc<-w(Usages:0)
Local ec<-h(Usages:0)
Local fc<-color(Usages:0not assigned
Local gc<-l_dis(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-6:7-1[1403-1442]
Root Scope:2-1:3-1:4-1:5-7:6-6:7-1:8-1[1405-1408]
Root Scope:2-1:3-1:4-1:5-7:6-6:7-1:8-2[1416-1424]
Root Scope:2-1:3-1:4-1:5-7:6-6:7-1:8-3[1425-1436]
Root Scope:2-1:3-1:4-1:5-7:6-7[1446-1489]
Local bc<-x(Usages:0not assigned
Local cc<-y(Usages:0not assigned
Local dc<-w(Usages:0not assigned
Local ec<-h(Usages:0not assigned
Local fc<-color(Usages:0not assigned
Local gc<-filled(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-7:7-1[1465-1488]
Root Scope:2-1:3-1:4-1:5-7:6-7:7-1:8-1[1467-1470]
Root Scope:2-1:3-1:4-1:5-7:6-7:7-1:8-2[1474-1480]
Root Scope:2-1:3-1:4-1:5-7:6-7:7-1:8-3[1481-1487]
Root Scope:2-1:3-2[1497-1516]
Local F<-a(Usages:0not assigned
Local G<-b(Usages:0not assigned
Local H<-c(Usages:0not assigned
Root Scope:2-1:3-2:4-1[1507-1515]
Root Scope:2-1:3-3[1517-1566]
Root Scope:2-1:3-3:4-1[1518-1565]
Local F<-sources(Usages:0)
Local G<-result(Usages:0)
Root Scope:2-1:3-3:4-1:5-1[1526-1532]
Root Scope:2-1:3-3:4-1:5-2[1535-1561]
Local H<-i(Usages:0not assigned
Local I<-v(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-2:6-1[1542-1560]
Root Scope:2-1:3-3:4-1:5-2:6-1:7-1[1545-1559]
Local J<-i(Usages:0not assigned
Local K<-v(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-2:6-1:7-1:8-1[1552-1558]
Root Scope:2-1:3-4[1567-1593]
Local F<-text(Usages:0not assigned
Local G<-local_returnVals(Usages:0)
Root Scope:2-1:3-4:4-1[1574-1592]
Root Scope:2-1:3-4:4-1:5-1[1580-1589]
Local H<-v(Usages:0not assigned
Root Scope:2-1:3-4:4-1:5-1:6-1[1584-1588]
Root Scope:2-1:3-5[1594-1675]
Local F<-container(Usages:0not assigned
Local G<-valueList(Usages:0)
Local H<-local_returnVals(Usages:0)
Local I<-local_startIndex(Usages:0)
Local J<-local_context(Usages:0)
Root Scope:2-1:3-5:4-1[1610-1674]
Root Scope:2-1:3-5:4-1:5-1[1628-1671]
Local K<-returnValsIndex(Usages:0)
Local L<-containerKey(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-1:6-1[1635-1670]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-1[1639-1643]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2[1644-1659]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2:8-1[1649-1658]
Local M<-subkey(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2:8-1:9-1[1653-1657]
--minified 
