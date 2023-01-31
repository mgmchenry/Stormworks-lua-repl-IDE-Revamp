--minifying 
a={"ArkNetGPSRadarIntx01a","repl.it/@mgmchenry"}local p,q,r,s,t,u,v,w,x,y,z,A=_ENV,property.getText,string.gmatch,ipairs,'([^,\r\n]+)',"string","table","number"local B,C,D=p[v].unpack,p[v].insert,p[v].remove function b()local E,F,G,H,I,J,K,L,M,N,O,P=y(math,q("ArkMFc"))c=J(P)==3 or P()local Q,R,S,T,U,V,W,X=y(p,q("ArkGF0"))local Y,Z,ab=P*2,360,{}for yb=1,30 do ab[yb]=yb end local bb,cb,db,eb,fb,gb,hb,ib,jb,kb,lb={},{},{},{},0,-1,-1,-1 local mb,nb,ob,pb,qb,rb,sb,tb=60,0,{},{},{},{}local ub,vb,wb,xb function d(yb,zb,Ab,Bb)Bb,Ab=(Bb or{}),Ab or 1 Bb[1],Bb[2],Bb[3]=yb[1]+zb[1]*Ab,yb[2]+zb[2]*Ab,yb[3]+zb[3]*Ab return Bb end function e(yb,zb,Ab,Bb,Cb,Db)Ab,Bb,Cb,Db=(Ab or{}),B(zb)for Eb=1,3 do Ab[Eb]=Bb*yb[Eb]+Cb*yb[Eb+3]+Db*yb[Eb+6]end return Ab end function f(yb,zb,Ab)zb,Ab=zb or{},{B(yb)}for Bb=0,2 do for Cb=0,2 do zb[1+Bb+Cb*3]=Ab[1+Cb+Bb*3]end end return zb end function g(yb,zb)for Ab,Bb in s(yb)do zb=(zb or 0)+Bb*Bb end return H(zb)end function h()hb=ib fb=fb+1 bb[0]=0 for yb=1,32 do bb[yb]=Q(yb)db[yb]=R(yb)cb[yb]=bb[yb]eb[yb]=db[yb]end kb,lb,jb,gb=y(bb,{22,23,24,32})sb=ob[nb]or{}nb=nb%(mb-1)+1 tb=ob[nb]or{d={},t={},td={}}ob[nb]=tb qb={}do local yb,zb,Ab,Bb,Cb,Db,Eb=y(bb,{25,26,27,28,29,30,31})local Fb,Gb,Hb,Ib,Jb,Kb,Lb={},K(Y*Bb),K(Y*Cb),K(Y*Db),Y*Eb pb=H(Gb*Gb+Ib*Ib)pb={Ib/pb,-Hb*Gb/pb,Gb;0,pb,Hb;-Gb/pb,-Hb*Ib/pb,Ib}Kb=L(Jb)Jb=K(Jb)for Mb=1,7,3 do pb[Mb],pb[Mb+1]=Kb*pb[Mb]-Jb*pb[Mb+1],Jb*pb[Mb]+Kb*pb[Mb+1]end pb.p={yb,zb,Ab}end for yb=1,32 do S(yb,cb[yb])T(yb,eb[yb])end ib=0 end do local yb,zb,Ab,Bb,Cb,Db,Eb,Fb,Gb,Hb=255,y(screen,q("ArkSF0"))local Ib,Jb,Kb,Lb,Mb,Nb,Ob,Pb,Qb,Rb,Sb,Tb,Ub,Vb,Wb,Xb,Yb,Zb={yb,yb,yb,yb},{yb,0,0},{0,yb,0},{0,0,yb},{yb,0,yb},{yb,yb,yb},{0,0,0}function i(cc,dc)Eb(Sb,Tb,cc)Tb=Tb+6 end local ac=0 local bc=nil function j()ib=ib+1 hb=G(ib,hb)Pb,Qb=Gb(),Hb()ac=G(Pb,ac)local cc=Pb==ac local dc={Pb/2-.5,Qb/2-.5,2.2-jb*2.175}dc[4]=1/M(dc[3]/2)dc[5]=dc[4]*Qb dc[6]=Pb/Qb Ub(Ib)Ub(Jb)Sb,Tb=2,4 if ib<2 then bc=wb(pb)bc.p=ub({0,0,0},pb.p,-1)end Ub(#qb>0 and Kb or Nb)local ec=4 Tb=Tb+6*ec Zb(V("Intv01 Contacts %i",#rb,#qb))Ub(Kb)Yb(dc[1],dc[2])local fc=Jb if ec==1 then fc=Kb elseif ec==2 then fc=Lb end if ec>-1 and cc then Ub(fc)for hc,ic in s(qb)do local jc,kc,lc,mc=vb(bc,ub(ic,bc.p))lc,mc=dc[1]+jc[1]/jc[2]*dc[4]*Qb/2,dc[2]-jc[3]/jc[2]*dc[4]*Qb/2 local nc=ic.c local oc=nc.parent if oc then Xb(lc,mc,0,1)else Xb(lc-1,mc,2,0)end end end local gc={}for hc,ic in s(cc and rb or{})do local jc,kc,lc,mc,nc=ic.p.pCam or{}if jc.cMat~=bc then jc.cMat=bc ic.p.pCam=jc vb(bc,ub(ic.p,bc.p),jc)end lc,mc,nc=jc[1]/jc[2]*dc[4],jc[3]/jc[2]*dc[4],3/jc[2]*dc[5]local oc=ic.parent if jc[2]>0 then kc=E(lc)>.95*dc[6]or E(mc)>.95 if kc then lc,mc=z(lc,-.95*dc[6],.95*dc[6]),z(mc,-.95,.95)end lc,mc=dc[1]+lc*Qb/2,dc[2]-mc*Qb/2 local pc=false for rc,sc in s(gc)do pc=H((sc[1]-lc)^2+(sc[2]-mc)^2)<sc[3]+nc if pc then break end end if not pc then C(gc,{lc,mc,nc})end local qc=0 if ec<1 and qc<0 and cc and not(oc or pc or kc)then qc=qc+1 Vb(.6)local rc=(gb%180)/180 local sc=z(59-J(60*rc*3),1,59)local tc=z(120-J(60*rc*3),2,60)if hc<2 then end local uc,vc for wc=tc,sc,-1 do local xc=ic.h[wc]or{0,0,0}local yc,zc,Ac,Bc=vb(bc,ub(xc,bc.p))Ac,Bc=dc[1]+yc[1]/yc[2]*dc[4]*Qb/2,dc[2]-yc[3]/yc[2]*dc[4]*Qb/2 if uc then Xb(uc,vc,Ac-uc,Bc-vc,Lb)elseif hc<2 then Zb(V("   x0:%0.0f y0:%0.0f",Ac,Bc))end uc,vc=Ac,Bc end Vb(1)end Ub(fc)if oc then Xb(lc-1,mc,2,0)Xb(lc,mc-1,0,2)elseif pc then Xb(lc-1,mc-1,2,2)elseif kc then local rc=z(nc,3-ec,6-ec)Xb(lc-rc,mc,2*rc,0)Xb(lc,mc-rc,0,2*rc)else Yb(lc,mc,z(nc,3-ec,6-ec))if ec<1 then Ub(Nb)Wb(lc-nc,mc-nc,nc*2,nc*2)end Eb(lc-10,mc+6,V("%i %0.0fm",hc,ic.d))if ic.m and ec<1 then Eb(lc-10,mc+12,V("%0.1fT",hc,ic.m))end if ic.childCount then Eb(lc-10,mc+18,V("c %i",ic.childCount))end end end end end function k(cc,dc,ec,fc)ec,fc=ec or 1,fc or 1.5 Xb(cc+fc,dc+fc,ec,ec)Xb(cc-fc,dc-fc,-ec,-ec)Xb(cc+fc,dc-fc,ec,-ec)Xb(cc-fc,dc+fc,-ec,ec)end function l(cc)Rb[4]=cc*yb zb(B(Rb))end function m(cc,dc,ec,fc,gc)Rb=A(W(cc)==v and cc or{cc,dc,ec,fc},Rb)zb(B(Rb))end function n(cc,dc,ec,fc,gc,hc)if gc then Ub(gc)end hc=H(ec*ec+fc*fc)if hc<1 then ec,fc=cc+ec,dc+fc+(fc>0 and 1 or-1)else ec=cc+ec+ec/hc fc=dc+fc+fc/hc end Ab(cc,dc,ec,fc)end function o(cc,dc,ec,fc,gc,hc)if gc then Ub(gc)end if hc or ec<2 or fc<2 then Cb(cc,dc,ec,fc)else Bb(cc,dc,ec-1,fc-1)end end end end z,A,x,y=function(E,F,G)return F>E and F or G<E and G or E end,function()local E,F={...},{}if not E[1]then F,E=E[2],{B(E,3)}end for G,H in s(E)do for I,J in s(H)do F[I]=F[I]or J end end return F,B(F)end,function(E,F)F=F or{}for G in r(E,t)do F[#F+1]=G end return B(F)end,function(E,F,G,H,I)F,G=type(F)==u and{x(F)}or F,G or{}H=#G for J,K in pairs(F)do if type(K)==w then I=E[K]else I=E for L in r(K,'([^. ]+)')do I=I[L]end end J=type(J)==w and H+J or J G[J]=I end return B(G)end b()
Scope variable info and rename assignments
Global Scope[??-??]
Global a<-source(Usages:0)
Global _ENV unchanged (Usages:0not assigned
Global property unchanged (Usages:0not assigned
Global string unchanged (Usages:0not assigned
Global ipairs unchanged (Usages:0not assigned
Global b<-main(Usages:0)
Global math unchanged (Usages:0not assigned
Global c<-_(Usages:0)
Global d<-addVec3(Usages:0)
Global e<-mulMat3Vec3(Usages:0)
Global f<-invMat3(Usages:0)
Global g<-vecLength(Usages:0)
Global h<-onTick(Usages:0)
Global screen unchanged (Usages:0not assigned
Global i<-printText(Usages:0)
Global j<-onDraw(Usages:0)
Global k<-drawCross(Usages:0)
Global l<-betterSetAlpha(Usages:0)
Global m<-betterSetColor(Usages:0)
Global n<-betterDrawLineRel(Usages:0)
Global o<-betterDrawRect(Usages:0)
Global type unchanged (Usages:0not assigned
Global pairs unchanged (Usages:0not assigned
Root Scope[1-1558]
Root Scope:2-1[2-1557]
Local p<-G(Usages:0not assigned
Local q<-prop_getText(Usages:0not assigned
Local r<-gmatch(Usages:0not assigned
Local s<-ipairz(Usages:0not assigned
Local t<-commaDelimited(Usages:0not assigned
Local u<-luaType_string(Usages:0not assigned
Local v<-luaType_table(Usages:0not assigned
Local w<-luaType_number(Usages:0not assigned
Local x<-stringUnpack(Usages:0)
Local y<-getTableValues(Usages:0)
Local z<-clamp(Usages:0)
Local A<-plop(Usages:0)
Local B<-unpack(Usages:0not assigned
Local C<-insert(Usages:0not assigned
Local D<-remove(Usages:0not assigned
Root Scope:2-1:3-1[71-1372]
Root Scope:2-1:3-1:4-1[72-1371]
Local E<-abs(Usages:0not assigned
Local F<-min(Usages:0not assigned
Local G<-max(Usages:0not assigned
Local H<-sqrt(Usages:0not assigned
Local I<-ceil(Usages:0not assigned
Local J<-floor(Usages:0not assigned
Local K<-sin(Usages:0not assigned
Local L<-cos(Usages:0not assigned
Local M<-tan(Usages:0not assigned
Local N<-atan(Usages:0not assigned
Local O<-asin(Usages:0not assigned
Local P<-pi(Usages:0not assigned
Local Q<-getNumber(Usages:0not assigned
Local R<-getBool(Usages:0not assigned
Local S<-setNumber(Usages:0not assigned
Local T<-setBool(Usages:0not assigned
Local U<-prop_getNumber(Usages:0not assigned
Local V<-format(Usages:0not assigned
Local W<-type(Usages:0not assigned
Local X<-string_sub(Usages:0not assigned
Local Y<-tau(Usages:0not assigned
Local Z<-degPerTurn(Usages:0not assigned
Local ab<-numberList(Usages:0not assigned
Local bb<-I(Usages:0not assigned
Local cb<-O(Usages:0not assigned
Local db<-Ib(Usages:0not assigned
Local eb<-Ob(Usages:0not assigned
Local fb<-tickCounter(Usages:0)
Local gb<-mcClock(Usages:0)
Local hb<-screenCount(Usages:0)
Local ib<-screensRendered(Usages:0)
Local jb<-camFov(Usages:0)
Local kb<-pivotX(Usages:0)
Local lb<-pivotY(Usages:0)
Local mb<-sampleCount(Usages:0not assigned
Local nb<-bufferCursor(Usages:0)
Local ob<-dataSamples(Usages:0not assigned
Local pb<-rm(Usages:0)
Local qb<-targets(Usages:0)
Local rb<-contacts(Usages:0not assigned
Local sb<-lastTickData(Usages:0)
Local tb<-thisTickData(Usages:0)
Local ub<-addVec3(Usages:0not assigned
Local vb<-mulMat3Vec3(Usages:0not assigned
Local wb<-invMat3(Usages:0not assigned
Local xb<-vecLength(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-1[157-166]
Local yb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-1:6-1[161-165]
Root Scope:2-1:3-1:4-1:5-2[238-270]
Local yb<-v1(Usages:0not assigned
Local zb<-v2(Usages:0not assigned
Local Ab<-scale(Usages:0)
Local Bb<-_retVec(Usages:0)
Root Scope:2-1:3-1:4-1:5-2:6-1[251-269]
Root Scope:2-1:3-1:4-1:5-3[273-320]
Local yb<-rm(Usages:0not assigned
Local zb<-vec3(Usages:0not assigned
Local Ab<-_retVec(Usages:0)
Local Bb<-_x(Usages:0)
Local Cb<-_y(Usages:0)
Local Db<-_z(Usages:0)
Root Scope:2-1:3-1:4-1:5-3:6-1[292-319]
Root Scope:2-1:3-1:4-1:5-3:6-1:7-1[300-317]
Local Eb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-3:6-1:7-1:8-1[304-316]
Root Scope:2-1:3-1:4-1:5-4[323-361]
Local yb<-rm(Usages:0not assigned
Local zb<-_retInv(Usages:0)
Local Ab<-_v1(Usages:0)
Root Scope:2-1:3-1:4-1:5-4:6-1[333-360]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1[339-358]
Local Bb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1:8-1[343-357]
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1:8-1:9-1[344-356]
Local Cb<-j(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-4:6-1:7-1:8-1:9-1:10-1[348-355]
Root Scope:2-1:3-1:4-1:5-5[364-391]
Local yb<-vec(Usages:0not assigned
Local zb<-_l(Usages:0)
Root Scope:2-1:3-1:4-1:5-5:6-1[371-390]
Root Scope:2-1:3-1:4-1:5-5:6-1:7-1[374-387]
Local Ab<-_(Usages:0not assigned
Local Bb<-v(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-5:6-1:7-1:8-1[381-386]
Root Scope:2-1:3-1:4-1:5-6[394-571]
Root Scope:2-1:3-1:4-1:5-6:6-1[395-570]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-1[401-423]
Local yb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-1:8-1[405-422]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2[443-553]
Local yb<-gX(Usages:0not assigned
Local zb<-gY(Usages:0not assigned
Local Ab<-gZ(Usages:0not assigned
Local Bb<-tX(Usages:0not assigned
Local Cb<-tY(Usages:0not assigned
Local Db<-tZ(Usages:0not assigned
Local Eb<-cY(Usages:0not assigned
Local Fb<-newContacts(Usages:0not assigned
Local Gb<-x(Usages:0not assigned
Local Hb<-y(Usages:0not assigned
Local Ib<-z(Usages:0not assigned
Local Jb<-s(Usages:0)
Local Kb<-c(Usages:0)
Local Lb<-newContact(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-1[526-548]
Local Mb<-j(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-2:8-1:9-1[530-547]
Root Scope:2-1:3-1:4-1:5-6:6-1:7-3[554-568]
Local yb<-i(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-6:6-1:7-3:8-1[558-567]
Root Scope:2-1:3-1:4-1:5-7[572-1370]
Local yb<-F(Usages:0not assigned
Local zb<-setColor(Usages:0not assigned
Local Ab<-drawLine(Usages:0not assigned
Local Bb<-drawRect(Usages:0not assigned
Local Cb<-drawRectF(Usages:0not assigned
Local Db<-drawTriangleF(Usages:0not assigned
Local Eb<-drawText(Usages:0not assigned
Local Fb<-drawTextBox(Usages:0not assigned
Local Gb<-screen_getWidth(Usages:0not assigned
Local Hb<-screen_getHeight(Usages:0not assigned
Local Ib<-cSolidWhite(Usages:0not assigned
Local Jb<-cRed(Usages:0not assigned
Local Kb<-cGreen(Usages:0not assigned
Local Lb<-cBlue(Usages:0not assigned
Local Mb<-cMagenta(Usages:0not assigned
Local Nb<-cWhite(Usages:0not assigned
Local Ob<-cBlack(Usages:0not assigned
Local Pb<-screenWidth(Usages:0)
Local Qb<-screenHeight(Usages:0)
Local Rb<-currentDrawColor(Usages:0)
Local Sb<-textPosX(Usages:0)
Local Tb<-textPosY(Usages:0)
Local Ub<-betterSetColor(Usages:0not assigned
Local Vb<-betterSetAlpha(Usages:0not assigned
Local Wb<-betterDrawRect(Usages:0not assigned
Local Xb<-betterDrawLineRel(Usages:0not assigned
Local Yb<-drawCross(Usages:0not assigned
Local Zb<-printText(Usages:0not assigned
Local ac<-widestScreen(Usages:0)
Local bc<-cMat(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-1[676-691]
Local cc<-text(Usages:0not assigned
Local dc<-color(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-1:7-1[683-690]
Root Scope:2-1:3-1:4-1:5-7:6-2[700-1161]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1[701-1160]
Local cc<-isWidestScreen(Usages:0not assigned
Local dc<-screenFov(Usages:0not assigned
Local ec<-rid(Usages:0not assigned
Local fc<-baseColor(Usages:0)
Local gc<-boxes(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-1[743-750]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-2[775-778]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-3[780-783]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-4[786-849]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-4:9-1[791-848]
Local hc<-i(Usages:0not assigned
Local ic<-t(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-4:9-1:10-1[798-847]
Local jc<-tCam(Usages:0not assigned
Local kc<-isClipped(Usages:0not assigned
Local lc<-x(Usages:0)
Local mc<-y(Usages:0)
Local nc<-contact(Usages:0not assigned
Local oc<-parent(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-4:9-1:10-1:11-1[837-841]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-4:9-1:10-1:11-2[842-846]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5[856-1159]
Local hc<-i(Usages:0not assigned
Local ic<-c(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1[863-1158]
Local jc<-tCam(Usages:0not assigned
Local kc<-isClipped(Usages:0)
Local lc<-dX(Usages:0)
Local mc<-dY(Usages:0)
Local nc<-dR(Usages:0)
Local oc<-parent(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-1[882-893]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2[910-1157]
Local pc<-isBoxed(Usages:0)
Local qc<-debugSquiggles(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-1[918-927]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-2[941-961]
Local rc<-_(Usages:0not assigned
Local sc<-b(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-2:12-1[948-960]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-2:12-1:13-1[958-959]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-3[963-969]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-4[979-1074]
Local rc<-anim(Usages:0not assigned
Local sc<-hMin(Usages:0not assigned
Local tc<-hMax(Usages:0not assigned
Local uc<-x1(Usages:0)
Local vc<-y1(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-4:12-1[1000-1001]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-4:12-2[1010-1072]
Local wc<-ih(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-4:12-2:13-1[1014-1071]
Local xc<-h(Usages:0not assigned
Local yc<-hCam(Usages:0not assigned
Local zc<-isClipped(Usages:0not assigned
Local Ac<-x0(Usages:0)
Local Bc<-y0(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-4:12-2:13-1:14-1[1050-1059]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-4:12-2:13-1:14-2[1061-1066]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-5[1078-1085]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-6[1087-1091]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-7[1093-1111]
Local rc<-lineLen(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-8[1112-1156]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-8:12-1[1121-1131]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-8:12-2[1140-1147]
Root Scope:2-1:3-1:4-1:5-7:6-2:7-1:8-5:9-1:10-2:11-8:12-3[1149-1155]
Root Scope:2-1:3-1:4-1:5-7:6-3[1164-1211]
Local cc<-centerX(Usages:0not assigned
Local dc<-centerY(Usages:0not assigned
Local ec<-len(Usages:0)
Local fc<-gap(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-3:7-1[1177-1210]
Root Scope:2-1:3-1:4-1:5-7:6-4[1214-1226]
Local cc<-a(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-4:7-1[1218-1225]
Root Scope:2-1:3-1:4-1:5-7:6-5[1229-1261]
Local cc<-r(Usages:0not assigned
Local dc<-g(Usages:0not assigned
Local ec<-b(Usages:0not assigned
Local fc<-a(Usages:0not assigned
Local gc<-local_packedColor(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-5:7-1[1245-1260]
Root Scope:2-1:3-1:4-1:5-7:6-6[1264-1323]
Local cc<-x(Usages:0not assigned
Local dc<-y(Usages:0not assigned
Local ec<-w(Usages:0)
Local fc<-h(Usages:0)
Local gc<-color(Usages:0not assigned
Local hc<-l_dis(Usages:0)
Root Scope:2-1:3-1:4-1:5-7:6-6:7-1[1283-1322]
Root Scope:2-1:3-1:4-1:5-7:6-6:7-1:8-1[1285-1288]
Root Scope:2-1:3-1:4-1:5-7:6-6:7-1:8-2[1296-1304]
Root Scope:2-1:3-1:4-1:5-7:6-6:7-1:8-3[1305-1316]
Root Scope:2-1:3-1:4-1:5-7:6-7[1326-1369]
Local cc<-x(Usages:0not assigned
Local dc<-y(Usages:0not assigned
Local ec<-w(Usages:0not assigned
Local fc<-h(Usages:0not assigned
Local gc<-color(Usages:0not assigned
Local hc<-filled(Usages:0not assigned
Root Scope:2-1:3-1:4-1:5-7:6-7:7-1[1345-1368]
Root Scope:2-1:3-1:4-1:5-7:6-7:7-1:8-1[1347-1350]
Root Scope:2-1:3-1:4-1:5-7:6-7:7-1:8-2[1354-1360]
Root Scope:2-1:3-1:4-1:5-7:6-7:7-1:8-3[1361-1367]
Root Scope:2-1:3-2[1377-1396]
Local E<-a(Usages:0not assigned
Local F<-b(Usages:0not assigned
Local G<-c(Usages:0not assigned
Root Scope:2-1:3-2:4-1[1387-1395]
Root Scope:2-1:3-3[1397-1446]
Root Scope:2-1:3-3:4-1[1398-1445]
Local E<-sources(Usages:0)
Local F<-result(Usages:0)
Root Scope:2-1:3-3:4-1:5-1[1406-1412]
Root Scope:2-1:3-3:4-1:5-2[1415-1441]
Local G<-i(Usages:0not assigned
Local H<-v(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-2:6-1[1422-1440]
Root Scope:2-1:3-3:4-1:5-2:6-1:7-1[1425-1439]
Local I<-i(Usages:0not assigned
Local J<-v(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-2:6-1:7-1:8-1[1432-1438]
Root Scope:2-1:3-4[1447-1473]
Local E<-text(Usages:0not assigned
Local F<-local_returnVals(Usages:0)
Root Scope:2-1:3-4:4-1[1454-1472]
Root Scope:2-1:3-4:4-1:5-1[1460-1469]
Local G<-v(Usages:0not assigned
Root Scope:2-1:3-4:4-1:5-1:6-1[1464-1468]
Root Scope:2-1:3-5[1474-1555]
Local E<-container(Usages:0not assigned
Local F<-valueList(Usages:0)
Local G<-local_returnVals(Usages:0)
Local H<-local_startIndex(Usages:0)
Local I<-local_context(Usages:0)
Root Scope:2-1:3-5:4-1[1490-1554]
Root Scope:2-1:3-5:4-1:5-1[1508-1551]
Local J<-returnValsIndex(Usages:0)
Local K<-containerKey(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-1:6-1[1515-1550]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-1[1519-1523]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2[1524-1539]
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2:8-1[1529-1538]
Local L<-subkey(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-1:6-1:7-2:8-1:9-1[1533-1537]
--minified 
