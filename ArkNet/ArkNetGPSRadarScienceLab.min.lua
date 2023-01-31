--minifying 
a=a or 0 b={"ArkNetGPSRadarSciLabx01a","repl.it/@mgmchenry"}c=1/60 function f(Z,ab,bb,cb)g=ab*c h=Z*muzzleVelociy*ab i=1-j(g,cb,1)return h*i end function j(Z,ab,bb)k=1-ab l=1-k^bb m=bb<Z and portionNotCutByDrag(Z,ab,bb+1)or 0 return m+l end local K,L,M,N,O,P,Q,R,S,T,U,V=_ENV,property.getText,string.gmatch,ipairs,'([^,\r\n]+)',"string","table","number"local W,X,Y=K[Q].unpack,K[Q].insert,K[Q].remove function n()local Z,ab,bb,cb,db,eb,fb,gb,hb,ib,jb,kb=T(math,L("ArkMFc"))o=eb(kb)==3 or kb()local lb,mb,nb,ob,pb,qb,rb,sb=T(K,L("ArkGF0"))local tb,ub,vb=kb*2,360,{}for Xb=1,30 do vb[Xb]=Xb end local wb,xb,yb,zb,Ab,Bb,Cb,Db,Eb,Fb,Gb={},{},{},{},0,-1,-1,-1 local Hb,Ib,Jb,Kb,Lb,Mb,Nb,Ob,Pb=60,0,{},{},{},{n=0},{n=0}local Qb,Rb,Sb,Tb,Ub,Vb function p(Xb,Yb)while Yb<Xb.n do Yb=Yb+1 if Xb[Yb]then return Yb,Xb[Yb]end end end function q(Xb)Xb.n=Xb.n or#Xb return Ub,Xb,0 end local Wb={0,0,0}function r(Xb,Yb,Zb,ac)Xb,ac,Zb=Xb or Wb,(ac or{}),Zb or 1 if not(rb(Yb)==Q and rb(Yb[1])==R and rb(Yb[2])==R and rb(Yb[3])==R)then return false end if not(rb(Xb)==Q and rb(Xb[1])==R and rb(Xb[2])==R and rb(Xb[3])==R)then return false end ac[1],ac[2],ac[3]=Xb[1]+Yb[1]*Zb,Xb[2]+Yb[2]*Zb,Xb[3]+Yb[3]*Zb return ac end function s(Xb,Yb,Zb,ac,bc,cc)Zb,ac,bc,cc=(Zb or{}),W(Yb)for dc=1,3 do Zb[dc]=ac*Xb[dc]+bc*Xb[dc+3]+cc*Xb[dc+6]end return Zb end function u(Xb,Yb,Zb)Yb,Zb=Yb or{},{W(Xb)}for ac=0,2 do for bc=0,2 do Yb[1+ac+bc*3]=Zb[1+bc+ac*3]end end return Yb end function v(Xb,Yb)for Zb,ac in N(Xb)do Yb=(Yb or 0)+ac*ac end return cb(Yb)end function w()local Xb,Yb Xb={n=3,[1]=false,[2]={t=timeLastConfirmed,s=secondsSinceDetected,p={0,0,0,t=Bb,e=likelyErrorRadius},v={0,9,0,m=metersPerSec}or nil,d=distanceFromCurrentRadarPosition,pl={0,0,0},pb={0,0,0},ph={[1]={x,y,z,t,etc},[2]={x,y,z,t,etc}or nil,n=1,r0={}or nil,r1={}or nil,s={x,y,z},c=countOfSamples,ri=reportIndex},rh={{0,0,0,t=avgTimeOfSamples,v={0,0,0},}}}}Yb={n=2,[1]={0,0,0,d,e,t,pd,ci=ci or nil,}}end function A()Cb=Db Ab=Ab+1 wb[0]=0 for jc=1,32 do wb[jc]=lb(jc)yb[jc]=mb(jc)xb[jc]=wb[jc]zb[jc]=yb[jc]end Bb,Eb,Fb,Gb=T(wb,{32,29,30,31})Ob=Jb[Ib]or{}Ib=Ib%(Hb-1)+1 Pb=Jb[Ib]or{d={},t={},td={}}Jb[Ib]=Pb local Xb,Yb,Zb,ac,bc,cc,dc=T(wb,{4,8,12,16,20,24,28})local ec,fc,gc,hc,ic=fb(tb*ac),fb(tb*bc),fb(tb*cc),tb*dc Kb=cb(ec*ec+gc*gc)Kb={gc/Kb,-fc*ec/Kb,ec;0,Kb,fc;-ec/Kb,-fc*gc/Kb,gc}ic=gb(hc)hc=fb(hc)for jc=1,7,3 do Kb[jc],Kb[jc+1]=ic*Kb[jc]-hc*Kb[jc+1],hc*Kb[jc]+ic*Kb[jc+1]end Kb.p={Xb,Yb,Zb}for jc,kc,lc in Vb(Mb)do kc.s=(Bb-kc.t)/1000 if kc.v then lc=kc.rh[1]Qb(lc,kc.v,(Bb-lc.t)/60,kc.p)kc.p.t=Bb kc.p.e=kc.v.m*kc.s*0.01 end end Lb.n=0 for jc=1,6 do local kc,lc,mc,nc,oc,pc,qc=W(wb,4*jc-3,4*jc-1)if kc<2 then break end pc={pd=4000,d=kc,e=kc*.01,t=Bb,i=jc,ci=jc}nc,oc=fb(lc*tb),fb(mc*tb)lc,mc=gb(lc*tb),gb(mc*tb)Qb(Rb(Kb,{nc*mc*kc,lc*mc*kc,oc*kc}),Kb.p,1,pc)Lb[jc]=pc Lb.n=jc for rc,sc,tc in Vb(Mb)do tc=Tb(Qb(pc,sc.p,-1))pc.pd=ab(pc.pd,tc)if tc<sc.p.e+pc.e+1 then qc=sc Mb[rc]=false break end end if qc then local rc=qc.ph local sc=rc.r0 or{v={0,0,0}}rc.n=rc.n+1 rc[rc.n]=pc Qb(rc.s,pc,1,rc.s)rc.c=rc.c+1 if rc.c>7 then Qb(rc.s,rc[rc.ri],-1,rc.s)rc.c=rc.c-1 rc.ri=rc.ri+1 end sc.t=rc[rc.ri+eb(rc.c/2)].t if rc.n>60 then for tc=1,rc.c do rc[tc]=rc[rc.ri+tc-1]end rc.n=rc.c end if rc.r0 then if rc.r1 then end else if rc.n~=2 then print("Big problem probably")end rc.rh0=sc end Qb(nil,rc.s,1/rc.c,sc)sc.e=pc.e*(.5^rc.c)Qb(nil,sc,1,qc.p)qc.p.e=sc.e else qc={p=Qb(pc,pc,0,{t=Bb,e=pc.e}),ph={pc,n=1,s=(W(pc)),c=1,ri=1},rh={}}end qc.t=Bb qc.s=0 Nb[jc]=qc Nb.n=jc if Z(wb[25]/kc-1)<.02 then qc.ss=wb[26]qc.m=wb[25]*wb[26]wb[25]=0 elseif qc.m then qc.ss=qc.m/kc end if qc.parent then local rc=Tb(Qb(qc.p,qc.parent.p,-1))else for rc,sc in Vb(Nb)do local tc=Tb(Qb(qc.p,sc.p,-1))if tc<(qc.p.e+sc.p.e+2)then while sc.parent do sc=sc.parent end qc.parent=sc sc.childCount=(sc.childCount or 0)+1 break end end end qc.d=Tb(Qb(Kb.p,qc.p,-1))end for jc,kc in Vb(Mb)do if Nb.n>=30 then break end Nb.n=Nb.n+1 Nb[Nb.n]=kc end Mb,Nb=Nb,Mb xb[32]=wb[32]%4+1 for jc=1,32 do nb(jc,xb[jc])ob(jc,zb[jc])end Db=0 end do local Xb,Yb,Zb,ac,bc,cc,dc,ec,fc,gc=255,T(screen,L("ArkSF0"))local hc,ic,jc,kc,lc,mc,nc,oc,pc,qc,rc,sc,tc,uc,vc,wc,xc,yc={Xb,Xb,Xb,Xb},{Xb,0,0},{0,Xb,0},{0,0,Xb},{Xb,0,Xb},{Xb,Xb,Xb},{0,0,0}function B(Bc,Cc)dc(rc,sc,Bc)sc=sc+6 end local zc=0 local Ac=nil function C()Db=Db+1 Cb=bb(Db,Cb)oc,pc=fc(),gc()zc=bb(oc,zc)local Bc=oc==zc local Cc={oc/2-.5,pc/2-.5,2.2-Eb*2.175}Cc[4]=1/hb(Cc[3]/2)Cc[5]=Cc[4]*pc Cc[6]=oc/pc tc(hc)tc(ic)rc,sc=2,4 if Db<2 then Ac=Sb(Kb)Ac.p=Qb({0,0,0},Kb.p,-1)end tc(#Lb>0 and jc or mc)sc=sc+6*a yc(qb("v09 Contacts %i, Targets %i",Mb.n,Lb.n))tc(jc)xc(Cc[1],Cc[2])local Dc=ic if a==1 then Dc=jc elseif a==2 then Dc=kc end if a>-1 and Bc then tc(Dc)for Fc,Gc in Vb(Lb)do local Hc,Ic,Jc,Kc=Rb(Ac,Qb(Gc,Ac.p))Jc,Kc=Cc[1]+Hc[1]/Hc[2]*Cc[4]*pc/2,Cc[2]-Hc[3]/Hc[2]*Cc[4]*pc/2 local Lc=Mb[Gc.ci]local Mc=Lc and Lc.parent if Mc then wc(Jc,Kc,0,1)else wc(Jc-1,Kc,2,0)end end end local Ec={}for Fc,Gc in Vb(Bc and Mb or{})do local Hc,Ic,Jc,Kc,Lc=Gc.p.pCam or{}if Hc.cMat~=Ac then Hc.cMat=Ac Gc.p.pCam=Hc Rb(Ac,Qb(Gc.p,Ac.p),Hc)end Jc,Kc,Lc=Hc[1]/Hc[2]*Cc[4],Hc[3]/Hc[2]*Cc[4],3/Hc[2]*Cc[5]local Mc=Gc.parent if Hc[2]>0 then Ic=Z(Jc)>.95*Cc[6]or Z(Kc)>.95 if Ic then Jc,Kc=U(Jc,-.95*Cc[6],.95*Cc[6]),U(Kc,-.95,.95)end Jc,Kc=Cc[1]+Jc*pc/2,Cc[2]-Kc*pc/2 local Nc=false for Pc,Qc in N(Ec)do Nc=cb((Qc[1]-Jc)^2+(Qc[2]-Kc)^2)<Qc[3]+Lc if Nc then break end end if not Nc then X(Ec,{Jc,Kc,Lc})end local Oc=0 if a<1 and Oc<0 and Bc and not(Mc or Nc or Ic)then Oc=Oc+1 uc(.6)local Pc=(Bb%180)/180 local Qc=U(59-eb(60*Pc*3),1,59)local Rc=U(120-eb(60*Pc*3),2,60)if Fc<2 then end local Sc,Tc for Uc=Rc,Qc,-1 do local Vc=Gc.h[Uc]or{0,0,0}local Wc,Xc,Yc,Zc=Rb(Ac,Qb(Vc,Ac.p))Yc,Zc=Cc[1]+Wc[1]/Wc[2]*Cc[4]*pc/2,Cc[2]-Wc[3]/Wc[2]*Cc[4]*pc/2 if Sc then wc(Sc,Tc,Yc-Sc,Zc-Tc,kc)elseif Fc<2 then yc(qb("   x0:%0.0f y0:%0.0f",Yc,Zc))end Sc,Tc=Yc,Zc end uc(1)end tc(Dc)if Mc then wc(Jc-1,Kc,2,0)wc(Jc,Kc-1,0,2)elseif Nc then wc(Jc-1,Kc-1,2,2)elseif Ic then local Pc=U(Lc,3-a,6-a)wc(Jc-Pc,Kc,2*Pc,0)wc(Jc,Kc-Pc,0,2*Pc)else xc(Jc,Kc,U(Lc,3-a,6-a))if a<1 then tc(mc)vc(Jc-Lc,Kc-Lc,Lc*2,Lc*2)end dc(Jc-10,Kc+6,qb("%i %0.0fm",Fc,Gc.d))if Gc.m and a<1 then dc(Jc-10,Kc+12,qb("%0.1fT",Fc,Gc.m))end if Gc.childCount then dc(Jc-10,Kc+18,qb("c %i",Gc.childCount))end end end end end function D(Bc,Cc,Dc,Ec)Dc,Ec=Dc or 1,Ec or 1.5 wc(Bc+Ec,Cc+Ec,Dc,Dc)wc(Bc-Ec,Cc-Ec,-Dc,-Dc)wc(Bc+Ec,Cc-Ec,Dc,-Dc)wc(Bc-Ec,Cc+Ec,-Dc,Dc)end function E(Bc)qc[4]=Bc*Xb Yb(W(qc))end function F(Bc,Cc,Dc,Ec,Fc)qc=V(rb(Bc)==Q and Bc or{Bc,Cc,Dc,Ec},qc)Yb(W(qc))end function G(Bc,Cc,Dc,Ec,Fc,Gc)if Fc then tc(Fc)end Gc=cb(Dc*Dc+Ec*Ec)if Gc<1 then Dc,Ec=Bc+Dc,Cc+Ec+(Ec>0 and 1 or-1)else Dc=Bc+Dc+Dc/Gc Ec=Cc+Ec+Ec/Gc end Zb(Bc,Cc,Dc,Ec)end function H(Bc,Cc,Dc,Ec,Fc,Gc)if Fc then tc(Fc)end if Gc or Dc<2 or Ec<2 then bc(Bc,Cc,Dc,Ec)else ac(Bc,Cc,Dc-1,Ec-1)end end function I()Db=Db+1 Cb=bb(Db,Cb)oc,pc=fc(),gc()zc=bb(oc,zc)local Bc=oc==zc tc(hc)rc,sc=2,4 sc=sc+6*a yc(qb("v08 Noperoni RID %i Screen %i/%i",a,Db,Cb))end end function J()Cb=Db Ab=Ab+1 wb[0]=0 for Xb=1,32 do wb[Xb]=lb(Xb)yb[Xb]=mb(Xb)xb[Xb]=wb[Xb]zb[Xb]=yb[Xb]end Bb,Eb,Fb,Gb=T(wb,{32,29,30,31})Ob=Jb[Ib]or{}Ib=Ib%(Hb-1)+1 Pb=Jb[Ib]or{d={},t={},td={}}Jb[Ib]=Pb xb[32]=wb[32]%4+1 for Xb=1,32 do nb(Xb,xb[Xb])ob(Xb,zb[Xb])end Db=0 end end U,V,S,T=function(Z,ab,bb)return ab>Z and ab or bb<Z and bb or Z end,function()local Z,ab={...},{}if not Z[1]then ab,Z=Z[2],{W(Z,3)}end for bb,cb in N(Z)do for db,eb in N(cb)do ab[db]=ab[db]or eb end end return ab,W(ab)end,function(Z,ab)ab=ab or{}for bb in M(Z,O)do ab[#ab+1]=bb end return W(ab)end,function(Z,ab,bb,cb,db)ab,bb=type(ab)==P and{S(ab)}or ab,bb or{}cb=#bb for eb,fb in pairs(ab)do if type(fb)==R then db=Z[fb]else db=Z for gb in M(fb,'([^. ]+)')do db=db[gb]end end eb=type(eb)==R and cb+eb or eb bb[eb]=db end return W(bb)end n()if nopeOut then A=J C=I end
Scope variable info and rename assignments
Global Scope[??-??]
Global a<-rid(Usages:0)
Global b<-source(Usages:0)
Global c<-tickDt(Usages:0)
Global f<-getPosition(Usages:0)
Global g<-totalTicks(Usages:0)
Global h<-distanceWithoutDrag(Usages:0)
Global muzzleVelociy unchanged (Usages:0not assigned
Global i<-pctAllowedAfterDrag(Usages:0)
Global j<-portionCutByDrag(Usages:0)
Global k<-notDrag(Usages:0)
Global l<-portionCutThisTick(Usages:0)
Global m<-futureTickDrag(Usages:0)
Global portionNotCutByDrag unchanged (Usages:0not assigned
Global _ENV unchanged (Usages:0not assigned
Global property unchanged (Usages:0not assigned
Global string unchanged (Usages:0not assigned
Global ipairs unchanged (Usages:0not assigned
Global n<-main(Usages:0)
Global math unchanged (Usages:0not assigned
Global o<-_(Usages:0)
Global p<-npIter(Usages:0)
Global q<-npairs(Usages:0)
Global r<-addVec3(Usages:0)
Global s<-mulMat3Vec3(Usages:0)
Global u<-invMat3(Usages:0)
Global v<-vecLength(Usages:0)
Global w<-dataDefinitions(Usages:0)
Global timeLastConfirmed unchanged (Usages:0not assigned
Global secondsSinceDetected unchanged (Usages:0not assigned
Global likelyErrorRadius unchanged (Usages:0not assigned
Global metersPerSec unchanged (Usages:0not assigned
Global distanceFromCurrentRadarPosition unchanged (Usages:0not assigned
Global x unchanged (Usages:0not assigned
Global y unchanged (Usages:0not assigned
Global z unchanged (Usages:0not assigned
Global t unchanged (Usages:0not assigned
Global etc unchanged (Usages:0not assigned
Global countOfSamples unchanged (Usages:0not assigned
Global reportIndex unchanged (Usages:0not assigned
Global avgTimeOfSamples unchanged (Usages:0not assigned
Global d unchanged (Usages:0not assigned
Global e unchanged (Usages:0not assigned
Global pd unchanged (Usages:0not assigned
Global ci unchanged (Usages:0not assigned
Global A<-onTick(Usages:0)
Global print unchanged (Usages:0not assigned
Global screen unchanged (Usages:0not assigned
Global B<-printText(Usages:0)
Global C<-onDraw(Usages:0)
Global D<-drawCross(Usages:0)
Global E<-betterSetAlpha(Usages:0)
Global F<-betterSetColor(Usages:0)
Global G<-betterDrawLineRel(Usages:0)
Global H<-betterDrawRect(Usages:0)
Global I<-nopeDraw(Usages:0)
Global J<-nopeTick(Usages:0)
Global type unchanged (Usages:0not assigned
Global pairs unchanged (Usages:0not assigned
Global nopeOut unchanged (Usages:0not assigned
Root Scope[1-2244]
Root Scope:2-1[2-2243]
Local K<-G(Usages:0not assigned
Local L<-prop_getText(Usages:0not assigned
Local M<-gmatch(Usages:0not assigned
Local N<-ipairz(Usages:0not assigned
Local O<-commaDelimited(Usages:0not assigned
Local P<-luaType_string(Usages:0not assigned
Local Q<-luaType_table(Usages:0not assigned
Local R<-luaType_number(Usages:0not assigned
Local S<-stringUnpack(Usages:0)
Local T<-getTableValues(Usages:0)
Local U<-clamp(Usages:0)
Local V<-plop(Usages:0)
Local W<-unpack(Usages:0not assigned
Local X<-insert(Usages:0not assigned
Local Y<-remove(Usages:0not assigned
Root Scope:2-1:3-1[15-53]
Local Z<-startPos(Usages:0not assigned
Local ab<-time(Usages:0not assigned
Local bb<-muzzleVelocity(Usages:0not assigned
Local cb<-cDrag(Usages:0not assigned
Root Scope:2-1:3-1:4-1[28-52]
Root Scope:2-1:3-2[54-88]
Local Z<-totalTicks(Usages:0not assigned
Local ab<-cDrag(Usages:0not assigned
Local bb<-currentTick(Usages:0not assigned
Root Scope:2-1:3-2:4-1[64-87]
Root Scope:2-1:3-3[154-2049]
Root Scope:2-1:3-3:4-1[155-2048]
Local Z<-abs(Usages:0not assigned
Local ab<-min(Usages:0not assigned
Local bb<-max(Usages:0not assigned
Local cb<-sqrt(Usages:0not assigned
Local db<-ceil(Usages:0not assigned
Local eb<-floor(Usages:0not assigned
Local fb<-sin(Usages:0not assigned
Local gb<-cos(Usages:0not assigned
Local hb<-tan(Usages:0not assigned
Local ib<-atan(Usages:0not assigned
Local jb<-asin(Usages:0not assigned
Local kb<-pi(Usages:0not assigned
Local lb<-getNumber(Usages:0not assigned
Local mb<-getBool(Usages:0not assigned
Local nb<-setNumber(Usages:0not assigned
Local ob<-setBool(Usages:0not assigned
Local pb<-prop_getNumber(Usages:0not assigned
Local qb<-format(Usages:0not assigned
Local rb<-type(Usages:0not assigned
Local sb<-string_sub(Usages:0not assigned
Local tb<-tau(Usages:0not assigned
Local ub<-degPerTurn(Usages:0not assigned
Local vb<-numberList(Usages:0not assigned
Local wb<-I(Usages:0not assigned
Local xb<-O(Usages:0not assigned
Local yb<-Ib(Usages:0not assigned
Local zb<-Ob(Usages:0not assigned
Local Ab<-tickCounter(Usages:0)
Local Bb<-mcClock(Usages:0)
Local Cb<-screenCount(Usages:0)
Local Db<-screensRendered(Usages:0)
Local Eb<-camFov(Usages:0)
Local Fb<-pivotX(Usages:0)
Local Gb<-pivotY(Usages:0)
Local Hb<-sampleCount(Usages:0not assigned
Local Ib<-bufferCursor(Usages:0)
Local Jb<-dataSamples(Usages:0not assigned
Local Kb<-rm(Usages:0)
Local Lb<-targets(Usages:0not assigned
Local Mb<-contacts(Usages:0)
Local Nb<-newContacts(Usages:0)
Local Ob<-lastTickData(Usages:0)
Local Pb<-thisTickData(Usages:0)
Local Qb<-addVec3(Usages:0not assigned
Local Rb<-mulMat3Vec3(Usages:0not assigned
Local Sb<-invMat3(Usages:0not assigned
Local Tb<-vecLength(Usages:0not assigned
Local Ub<-npIter(Usages:0not assigned
Local Vb<-npairs(Usages:0not assigned
Local Wb<-_zeroVec3(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-1[240-249]
Local Xb<-i(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-1:6-1[244-248]
Root Scope:2-1:3-3:4-1:5-2[330-352]
Local Xb<-a(Usages:0not assigned
Local Yb<-i(Usages:0)
Root Scope:2-1:3-3:4-1:5-2:6-1[337-351]
Root Scope:2-1:3-3:4-1:5-2:6-1:7-1[340-350]
Root Scope:2-1:3-3:4-1:5-2:6-1:7-1:8-1[345-349]
Root Scope:2-1:3-3:4-1:5-3[355-366]
Local Xb<-a(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-3:6-1[359-365]
Root Scope:2-1:3-3:4-1:5-4[372-435]
Local Xb<-v1(Usages:0)
Local Yb<-v2(Usages:0not assigned
Local Zb<-scale(Usages:0)
Local ac<-_retVec(Usages:0)
Root Scope:2-1:3-3:4-1:5-4:6-1[385-434]
Root Scope:2-1:3-3:4-1:5-4:6-1:7-1[405-406]
Root Scope:2-1:3-3:4-1:5-4:6-1:7-2[419-420]
Root Scope:2-1:3-3:4-1:5-5[438-485]
Local Xb<-rm(Usages:0not assigned
Local Yb<-vec3(Usages:0not assigned
Local Zb<-_retVec(Usages:0)
Local ac<-_x(Usages:0)
Local bc<-_y(Usages:0)
Local cc<-_z(Usages:0)
Root Scope:2-1:3-3:4-1:5-5:6-1[457-484]
Root Scope:2-1:3-3:4-1:5-5:6-1:7-1[465-482]
Local dc<-i(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-5:6-1:7-1:8-1[469-481]
Root Scope:2-1:3-3:4-1:5-6[488-526]
Local Xb<-rm(Usages:0not assigned
Local Yb<-_retInv(Usages:0)
Local Zb<-_v1(Usages:0)
Root Scope:2-1:3-3:4-1:5-6:6-1[498-525]
Root Scope:2-1:3-3:4-1:5-6:6-1:7-1[504-523]
Local ac<-i(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-6:6-1:7-1:8-1[508-522]
Root Scope:2-1:3-3:4-1:5-6:6-1:7-1:8-1:9-1[509-521]
Local bc<-j(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-6:6-1:7-1:8-1:9-1:10-1[513-520]
Root Scope:2-1:3-3:4-1:5-7[529-556]
Local Xb<-vec(Usages:0not assigned
Local Yb<-_l(Usages:0)
Root Scope:2-1:3-3:4-1:5-7:6-1[536-555]
Root Scope:2-1:3-3:4-1:5-7:6-1:7-1[539-552]
Local Zb<-_(Usages:0not assigned
Local ac<-v(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-7:6-1:7-1:8-1[546-551]
Root Scope:2-1:3-3:4-1:5-8[559-631]
Root Scope:2-1:3-3:4-1:5-8:6-1[560-630]
Local Xb<-contacts_def(Usages:0)
Local Yb<-targets_def(Usages:0)
Root Scope:2-1:3-3:4-1:5-9[634-1142]
Root Scope:2-1:3-3:4-1:5-9:6-1[635-1141]
Local Xb<-gX(Usages:0not assigned
Local Yb<-gY(Usages:0not assigned
Local Zb<-gZ(Usages:0not assigned
Local ac<-tX(Usages:0not assigned
Local bc<-tY(Usages:0not assigned
Local cc<-tZ(Usages:0not assigned
Local dc<-cY(Usages:0not assigned
Local ec<-x(Usages:0not assigned
Local fc<-y(Usages:0not assigned
Local gc<-z(Usages:0not assigned
Local hc<-s(Usages:0)
Local ic<-c(Usages:0)
Root Scope:2-1:3-3:4-1:5-9:6-1:7-1[641-663]
Local jc<-i(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-9:6-1:7-1:8-1[645-662]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-2[758-780]
Local jc<-j(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-9:6-1:7-2:8-1[762-779]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-3[787-818]
Local jc<-_(Usages:0not assigned
Local kc<-contact(Usages:0not assigned
Local lc<-r(Usages:0)
Root Scope:2-1:3-3:4-1:5-9:6-1:7-3:8-1[797-817]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-3:8-1:9-1[802-816]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4[820-1098]
Local jc<-ti(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1[824-1097]
Local kc<-d(Usages:0not assigned
Local lc<-cA(Usages:0)
Local mc<-cE(Usages:0)
Local nc<-sA(Usages:0)
Local oc<-sE(Usages:0)
Local pc<-target(Usages:0)
Local qc<-contact(Usages:0)
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-1[851-852]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-2[895-925]
Local rc<-ci(Usages:0not assigned
Local sc<-c(Usages:0not assigned
Local tc<-pd(Usages:0)
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-2:10-1[905-924]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-2:10-1:11-1[918-923]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-3[927-1010]
Local rc<-pings(Usages:0not assigned
Local sc<-report(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-3:10-1[948-958]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-3:10-2[965-981]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-3:10-2:11-1[967-978]
Local tc<-pi(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-3:10-2:11-1:12-1[971-977]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-3:10-3[983-987]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-3:10-3:11-1[985-986]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-3:10-4[988-997]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-3:10-4:11-1[990-994]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-4[1011-1021]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-5[1033-1040]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-6[1042-1046]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-7[1048-1056]
Local rc<-pDis(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-8[1057-1091]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-8:10-1[1060-1090]
Local rc<-pi(Usages:0not assigned
Local sc<-parent(Usages:0)
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-8:10-1:11-1[1067-1089]
Local tc<-pDis(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-8:10-1:11-1:12-1[1078-1088]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-4:8-1:9-8:10-1:11-1:12-1:13-1[1080-1083]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-5[1101-1118]
Local jc<-_(Usages:0not assigned
Local kc<-c(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-9:6-1:7-5:8-1[1108-1117]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-5:8-1:9-1[1110-1111]
Root Scope:2-1:3-3:4-1:5-9:6-1:7-6[1125-1139]
Local jc<-i(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-9:6-1:7-6:8-1[1129-1138]
Root Scope:2-1:3-3:4-1:5-10[1143-1977]
Local Xb<-F(Usages:0not assigned
Local Yb<-setColor(Usages:0not assigned
Local Zb<-drawLine(Usages:0not assigned
Local ac<-drawRect(Usages:0not assigned
Local bc<-drawRectF(Usages:0not assigned
Local cc<-drawTriangleF(Usages:0not assigned
Local dc<-drawText(Usages:0not assigned
Local ec<-drawTextBox(Usages:0not assigned
Local fc<-screen_getWidth(Usages:0not assigned
Local gc<-screen_getHeight(Usages:0not assigned
Local hc<-cSolidWhite(Usages:0not assigned
Local ic<-cRed(Usages:0not assigned
Local jc<-cGreen(Usages:0not assigned
Local kc<-cBlue(Usages:0not assigned
Local lc<-cMagenta(Usages:0not assigned
Local mc<-cWhite(Usages:0not assigned
Local nc<-cBlack(Usages:0not assigned
Local oc<-screenWidth(Usages:0)
Local pc<-screenHeight(Usages:0)
Local qc<-currentDrawColor(Usages:0)
Local rc<-textPosX(Usages:0)
Local sc<-textPosY(Usages:0)
Local tc<-betterSetColor(Usages:0not assigned
Local uc<-betterSetAlpha(Usages:0not assigned
Local vc<-betterDrawRect(Usages:0not assigned
Local wc<-betterDrawLineRel(Usages:0not assigned
Local xc<-drawCross(Usages:0not assigned
Local yc<-printText(Usages:0not assigned
Local zc<-widestScreen(Usages:0)
Local Ac<-cMat(Usages:0)
Root Scope:2-1:3-3:4-1:5-10:6-1[1247-1262]
Local Bc<-text(Usages:0not assigned
Local Cc<-color(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-1:7-1[1254-1261]
Root Scope:2-1:3-3:4-1:5-10:6-2[1271-1731]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1[1272-1730]
Local Bc<-isWidestScreen(Usages:0not assigned
Local Cc<-screenFov(Usages:0not assigned
Local Dc<-baseColor(Usages:0)
Local Ec<-boxes(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-1[1314-1321]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-2[1343-1346]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-3[1348-1351]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-4[1354-1419]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-4:9-1[1359-1418]
Local Fc<-i(Usages:0not assigned
Local Gc<-t(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-4:9-1:10-1[1366-1417]
Local Hc<-tCam(Usages:0not assigned
Local Ic<-isClipped(Usages:0not assigned
Local Jc<-x(Usages:0)
Local Kc<-y(Usages:0)
Local Lc<-contact(Usages:0not assigned
Local Mc<-parent(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-4:9-1:10-1:11-1[1407-1411]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-4:9-1:10-1:11-2[1412-1416]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5[1426-1729]
Local Fc<-i(Usages:0not assigned
Local Gc<-c(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1[1433-1728]
Local Hc<-tCam(Usages:0not assigned
Local Ic<-isClipped(Usages:0)
Local Jc<-dX(Usages:0)
Local Kc<-dY(Usages:0)
Local Lc<-dR(Usages:0)
Local Mc<-parent(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-1[1452-1463]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2[1480-1727]
Local Nc<-isBoxed(Usages:0)
Local Oc<-debugSquiggles(Usages:0)
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-1[1488-1497]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-2[1511-1531]
Local Pc<-_(Usages:0not assigned
Local Qc<-b(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-2:12-1[1518-1530]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-2:12-1:13-1[1528-1529]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-3[1533-1539]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-4[1549-1644]
Local Pc<-anim(Usages:0not assigned
Local Qc<-hMin(Usages:0not assigned
Local Rc<-hMax(Usages:0not assigned
Local Sc<-x1(Usages:0)
Local Tc<-y1(Usages:0)
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-4:12-1[1570-1571]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-4:12-2[1580-1642]
Local Uc<-ih(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-4:12-2:13-1[1584-1641]
Local Vc<-h(Usages:0not assigned
Local Wc<-hCam(Usages:0not assigned
Local Xc<-isClipped(Usages:0not assigned
Local Yc<-x0(Usages:0)
Local Zc<-y0(Usages:0)
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-4:12-2:13-1:14-1[1620-1629]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-4:12-2:13-1:14-2[1631-1636]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-5[1648-1655]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-6[1657-1661]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-7[1663-1681]
Local Pc<-lineLen(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-8[1682-1726]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-8:12-1[1691-1701]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-8:12-2[1710-1717]
Root Scope:2-1:3-3:4-1:5-10:6-2:7-1:8-5:9-1:10-2:11-8:12-3[1719-1725]
Root Scope:2-1:3-3:4-1:5-10:6-3[1734-1781]
Local Bc<-centerX(Usages:0not assigned
Local Cc<-centerY(Usages:0not assigned
Local Dc<-len(Usages:0)
Local Ec<-gap(Usages:0)
Root Scope:2-1:3-3:4-1:5-10:6-3:7-1[1747-1780]
Root Scope:2-1:3-3:4-1:5-10:6-4[1784-1796]
Local Bc<-a(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-4:7-1[1788-1795]
Root Scope:2-1:3-3:4-1:5-10:6-5[1799-1831]
Local Bc<-r(Usages:0not assigned
Local Cc<-g(Usages:0not assigned
Local Dc<-b(Usages:0not assigned
Local Ec<-a(Usages:0not assigned
Local Fc<-local_packedColor(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-5:7-1[1815-1830]
Root Scope:2-1:3-3:4-1:5-10:6-6[1834-1893]
Local Bc<-x(Usages:0not assigned
Local Cc<-y(Usages:0not assigned
Local Dc<-w(Usages:0)
Local Ec<-h(Usages:0)
Local Fc<-color(Usages:0not assigned
Local Gc<-l_dis(Usages:0)
Root Scope:2-1:3-3:4-1:5-10:6-6:7-1[1853-1892]
Root Scope:2-1:3-3:4-1:5-10:6-6:7-1:8-1[1855-1858]
Root Scope:2-1:3-3:4-1:5-10:6-6:7-1:8-2[1866-1874]
Root Scope:2-1:3-3:4-1:5-10:6-6:7-1:8-3[1875-1886]
Root Scope:2-1:3-3:4-1:5-10:6-7[1896-1939]
Local Bc<-x(Usages:0not assigned
Local Cc<-y(Usages:0not assigned
Local Dc<-w(Usages:0not assigned
Local Ec<-h(Usages:0not assigned
Local Fc<-color(Usages:0not assigned
Local Gc<-filled(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-10:6-7:7-1[1915-1938]
Root Scope:2-1:3-3:4-1:5-10:6-7:7-1:8-1[1917-1920]
Root Scope:2-1:3-3:4-1:5-10:6-7:7-1:8-2[1924-1930]
Root Scope:2-1:3-3:4-1:5-10:6-7:7-1:8-3[1931-1937]
Root Scope:2-1:3-3:4-1:5-10:6-8[1942-1976]
Root Scope:2-1:3-3:4-1:5-10:6-8:7-1[1943-1975]
Local Bc<-isWidestScreen(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-11[1980-2047]
Root Scope:2-1:3-3:4-1:5-11:6-1[1981-2046]
Root Scope:2-1:3-3:4-1:5-11:6-1:7-1[1987-2009]
Local Xb<-i(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-11:6-1:7-1:8-1[1991-2008]
Root Scope:2-1:3-3:4-1:5-11:6-1:7-2[2030-2044]
Local Xb<-i(Usages:0not assigned
Root Scope:2-1:3-3:4-1:5-11:6-1:7-2:8-1[2034-2043]
Root Scope:2-1:3-4[2054-2073]
Local Z<-a(Usages:0not assigned
Local ab<-b(Usages:0not assigned
Local bb<-c(Usages:0not assigned
Root Scope:2-1:3-4:4-1[2064-2072]
Root Scope:2-1:3-5[2074-2123]
Root Scope:2-1:3-5:4-1[2075-2122]
Local Z<-sources(Usages:0)
Local ab<-result(Usages:0)
Root Scope:2-1:3-5:4-1:5-1[2083-2089]
Root Scope:2-1:3-5:4-1:5-2[2092-2118]
Local bb<-i(Usages:0not assigned
Local cb<-v(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-2:6-1[2099-2117]
Root Scope:2-1:3-5:4-1:5-2:6-1:7-1[2102-2116]
Local db<-i(Usages:0not assigned
Local eb<-v(Usages:0not assigned
Root Scope:2-1:3-5:4-1:5-2:6-1:7-1:8-1[2109-2115]
Root Scope:2-1:3-6[2124-2150]
Local Z<-text(Usages:0not assigned
Local ab<-local_returnVals(Usages:0)
Root Scope:2-1:3-6:4-1[2131-2149]
Root Scope:2-1:3-6:4-1:5-1[2137-2146]
Local bb<-v(Usages:0not assigned
Root Scope:2-1:3-6:4-1:5-1:6-1[2141-2145]
Root Scope:2-1:3-7[2151-2232]
Local Z<-container(Usages:0not assigned
Local ab<-valueList(Usages:0)
Local bb<-local_returnVals(Usages:0)
Local cb<-local_startIndex(Usages:0)
Local db<-local_context(Usages:0)
Root Scope:2-1:3-7:4-1[2167-2231]
Root Scope:2-1:3-7:4-1:5-1[2185-2228]
Local eb<-returnValsIndex(Usages:0)
Local fb<-containerKey(Usages:0not assigned
Root Scope:2-1:3-7:4-1:5-1:6-1[2192-2227]
Root Scope:2-1:3-7:4-1:5-1:6-1:7-1[2196-2200]
Root Scope:2-1:3-7:4-1:5-1:6-1:7-2[2201-2216]
Root Scope:2-1:3-7:4-1:5-1:6-1:7-2:8-1[2206-2215]
Local gb<-subkey(Usages:0not assigned
Root Scope:2-1:3-7:4-1:5-1:6-1:7-2:8-1:9-1[2210-2214]
Root Scope:2-1:3-8[2237-2242]
--minified 
