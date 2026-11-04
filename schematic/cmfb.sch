v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 160 -80 160 -40 {lab=VSSA}
N 160 -40 460 -40 {lab=VSSA}
N 460 -80 460 -40 {lab=VSSA}
N 90 -110 160 -110 {lab=VSSA}
N 460 -110 550 -110 {lab=VSSA}
N 460 -220 460 -140 {lab=Vdrain_M4}
N 160 -220 160 -140 {lab=Vb4}
N 200 -110 240 -110 {lab=Vb4}
N 160 -180 240 -180 {lab=Vb4}
N 240 -180 240 -110 {lab=Vb4}
N 360 -110 420 -110 {lab=Vdrain_M4}
N 360 -180 360 -110 {lab=Vdrain_M4}
N 360 -180 460 -180 {lab=Vdrain_M4}
N 160 -250 220 -250 {lab=VDDA}
N 400 -250 460 -250 {lab=VDDA}
N 160 -300 160 -280 {lab=#net1}
N 160 -300 460 -300 {lab=#net1}
N 460 -300 460 -280 {lab=#net1}
N 300 -340 300 -300 {lab=#net1}
N 70 -250 120 -250 {lab=Balance_Level}
N 500 -250 540 -250 {lab=Vfbk}
N 300 -440 300 -400 {lab=VDDA}
N 300 -440 460 -440 {lab=VDDA}
N 200 -370 260 -370 {lab=Vb1}
N 300 -370 360 -370 {lab=VDDA}
N 240 -110 280 -110 {lab=Vb4}
N 460 -440 940 -440 {lab=VDDA}
N 1000 -440 1000 -400 {lab=VDDA}
N 720 -440 720 -400 {lab=VDDA}
N 720 -370 800 -370 {lab=VSSA}
N 1000 -370 1070 -370 {lab=VSSA}
N 620 -370 680 -370 {lab=Voutp}
N 910 -370 960 -370 {lab=Voutn}
N 940 -440 1000 -440 {lab=VDDA}
N 1000 -270 1000 -190 {lab=#net2}
N 900 -190 1000 -190 {lab=#net2}
N 780 -190 840 -190 {lab=Vfbk}
N 720 -270 720 -190 {lab=#net3}
N 1000 -340 1000 -270 {lab=#net2}
N 720 -340 720 -270 {lab=#net3}
N 720 -190 720 -140 {lab=#net3}
N 460 -40 1000 -40 {lab=VSSA}
N 1000 -80 1000 -40 {lab=VSSA}
N 1000 -190 1000 -140 {lab=#net2}
N 720 -80 720 -40 {lab=VSSA}
N 540 -250 540 -230 {lab=Vfbk}
N 810 -230 810 -190 {lab=Vfbk}
N 650 -110 680 -110 {lab=Vb5}
N 670 -150 670 -110 {lab=Vb5}
N 670 -150 940 -150 {lab=Vb5}
N 940 -150 940 -110 {lab=Vb5}
N 940 -110 960 -110 {lab=Vb5}
N 720 -110 790 -110 {lab=VSSA}
N 1000 -110 1070 -110 {lab=VSSA}
N 590 -370 620 -370 {lab=Voutp}
N 880 -370 910 -370 {lab=Voutn}
N 640 -370 640 -340 {lab=Voutp}
N 930 -370 930 -340 {lab=Voutn}
N 640 -280 640 -260 {lab=#net4}
N 640 -260 660 -260 {lab=#net4}
N 930 -280 930 -260 {lab=#net5}
N 930 -260 940 -260 {lab=#net5}
N 540 -230 810 -230 {lab=Vfbk}
C {symbols/pfet_05v0.sym} 280 -370 0 0 {name=M1
L=2u
W=28.6u
nf=1
m=10
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_05v0
spiceprefix=X
}
C {symbols/pfet_05v0.sym} 140 -250 0 0 {name=M2
L=1u
W=50u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_05v0
spiceprefix=X
}
C {symbols/pfet_05v0.sym} 480 -250 0 1 {name=M3
L=1u
W=50u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_05v0
spiceprefix=X
}
C {symbols/nfet_05v0.sym} 440 -110 0 0 {name=M4
L=2u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/nfet_05v0.sym} 180 -110 0 1 {name=M5
L=2u
W=1u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/nfet_05v0.sym} 700 -370 0 0 {name=M6
L=1u
W=0.79u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/nfet_05v0.sym} 980 -370 0 0 {name=M7
L=1u
W=0.79u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {res.sym} 750 -190 3 0 {name=R3
value=100k
footprint=1206
device=resistor
m=1}
C {res.sym} 870 -190 1 1 {name=R4
value=100k
footprint=1206
device=resistor
m=1}
C {symbols/nfet_05v0.sym} 700 -110 0 0 {name=M8
L=2u
W=1.86u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/nfet_05v0.sym} 980 -110 0 0 {name=M9
L=2u
W=1.86u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {iopin.sym} -770 -410 0 0 {name=p1 lab=VDDA}
C {lab_wire.sym} 580 -440 0 0 {name=p2 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 590 -40 0 0 {name=p3 sig_type=std_logic lab=VSSA}
C {iopin.sym} -770 -370 0 0 {name=p4 lab=VSSA}
C {lab_wire.sym} 360 -370 0 1 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 220 -250 0 1 {name=p6 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 400 -250 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 90 -110 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 550 -110 0 1 {name=p9 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 790 -110 0 1 {name=p10 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1070 -110 0 1 {name=p11 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1070 -370 0 1 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 800 -370 0 1 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 280 -110 0 1 {name=p14 sig_type=std_logic lab=Vb4}
C {ipin.sym} -700 -150 0 0 {name=p15 lab=Vb4}
C {ipin.sym} -700 -210 0 0 {name=p16 lab=Balance_Level}
C {lab_wire.sym} 70 -250 0 0 {name=p17 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 200 -370 0 0 {name=p18 sig_type=std_logic lab=Vb1}
C {ipin.sym} -700 -180 0 0 {name=p19 lab=Vb1}
C {ipin.sym} -700 -120 0 0 {name=p20 lab=Vb5}
C {lab_wire.sym} 590 -370 0 0 {name=p22 sig_type=std_logic lab=Voutp}
C {lab_wire.sym} 890 -370 0 0 {name=p23 sig_type=std_logic lab=Voutn}
C {iopin.sym} -770 -330 0 0 {name=p24 lab=Voutp}
C {iopin.sym} -770 -290 0 0 {name=p25 lab=Voutn}
C {lab_wire.sym} 650 -110 0 0 {name=p26 sig_type=std_logic lab=Vb5}
C {ngspice_get_value.sym} -20 -490 0 0 {name=r5 node=i(@m.x1.x2.xm1.m0[id])
descr="Id_M1="}
C {ngspice_get_value.sym} -20 -450 0 0 {name=r6 node=@m.x1.x2.xm1.m0[gm]
descr="gm_M1="}
C {ngspice_get_value.sym} -20 -400 0 0 {name=r7 node=v(@m.x1.x2.xm1.m0[vds])
descr="Vds_M1="}
C {ngspice_get_value.sym} 50 -490 0 0 {name=r8 node=v(@m.x1.x2.xm1.m0[vgs])
descr="Vgs_M1="}
C {ngspice_get_value.sym} 50 -450 0 0 {name=r9 node=v(@m.x1.x2.xm1.m0[vth])
descr="Vth_M1="}
C {ngspice_get_expr.sym} 120 -490 0 0 {name=r10 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x2.xm1.m0[gds]\}]]"
descr="ro_M1="}
C {ngspice_get_expr.sym} 120 -450 0 0 {name=r11
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x2.xm1.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x2.xm1.m0[id])\\\}]]]"
descr="gm/Id_M1="}
C {ngspice_get_expr.sym} 50 -400 0 0 {name=r12
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x2.xm1.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x2.xm1.m0[vth])\\\}]]]"
descr="Vov_M1="}
C {ngspice_get_value.sym} -630 -280 0 0 {name=r13 node=i(@m.x1.x2.xm2.m0[id])
descr="Id_M2="}
C {ngspice_get_value.sym} -630 -240 0 0 {name=r14 node=@m.x1.x2.xm2.m0[gm]
descr="gm_M2="}
C {ngspice_get_value.sym} -630 -190 0 0 {name=r15 node=v(@m.x1.x2.xm2.m0[vds])
descr="Vds_M2="}
C {ngspice_get_value.sym} -560 -280 0 0 {name=r16 node=v(@m.x1.x2.xm2.m0[vgs])
descr="Vgs_M2="}
C {ngspice_get_value.sym} -560 -240 0 0 {name=r17 node=v(@m.x1.x2.xm2.m0[vth])
descr="Vth_M2="}
C {ngspice_get_expr.sym} -490 -280 0 0 {name=r18 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x2.xm2.m0[gds]\}]]"
descr="ro_M2="}
C {ngspice_get_expr.sym} -490 -240 0 0 {name=r19
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x2.xm2.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x2.xm2.m0[id])\\\}]]]"
descr="gm/Id_M2="}
C {ngspice_get_expr.sym} -560 -190 0 0 {name=r20
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x2.xm2.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x2.xm2.m0[vth])\\\}]]]"
descr="Vov_M2="}
C {ngspice_get_value.sym} -300 -280 0 0 {name=r21 node=i(@m.x1.x2.xm3.m0[id])
descr="Id_M3="}
C {ngspice_get_value.sym} -300 -240 0 0 {name=r22 node=@m.x1.x2.xm3.m0[gm]
descr="gm_M3="}
C {ngspice_get_value.sym} -300 -190 0 0 {name=r23 node=v(@m.x1.x2.xm3.m0[vds])
descr="Vds_M3="}
C {ngspice_get_value.sym} -230 -280 0 0 {name=r24 node=v(@m.x1.x2.xm3.m0[vgs])
descr="Vgs_M3="}
C {ngspice_get_value.sym} -230 -240 0 0 {name=r25 node=v(@m.x1.x2.xm3.m0[vth])
descr="Vth_M3="}
C {ngspice_get_expr.sym} -160 -280 0 0 {name=r26 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x2.xm3.m0[gds]\}]]"
descr="ro_M3="}
C {ngspice_get_expr.sym} -160 -240 0 0 {name=r27
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x2.xm3.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x2.xm3.m0[id])\\\}]]]"
descr="gm/Id_M3="}
C {ngspice_get_expr.sym} -230 -190 0 0 {name=r28
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x2.xm3.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x2.xm3.m0[vth])\\\}]]]"
descr="Vov_M3="}
C {ngspice_get_value.sym} -630 -120 0 0 {name=r29 node=i(@m.x1.x2.xm5.m0[id])
descr="Id_M5="}
C {ngspice_get_value.sym} -630 -80 0 0 {name=r30 node=@m.x1.x2.xm5.m0[gm]
descr="gm_M5="}
C {ngspice_get_value.sym} -630 -30 0 0 {name=r31 node=v(@m.x1.x2.xm5.m0[vds])
descr="Vds_M5="}
C {ngspice_get_value.sym} -560 -120 0 0 {name=r32 node=v(@m.x1.x2.xm5.m0[vgs])
descr="Vgs_M5="}
C {ngspice_get_value.sym} -560 -80 0 0 {name=r33 node=v(@m.x1.x2.xm5.m0[vth])
descr="Vth_M5="}
C {ngspice_get_expr.sym} -490 -120 0 0 {name=r34 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x2.xm5.m0[gds]\}]]"
descr="ro_M5="}
C {ngspice_get_expr.sym} -490 -80 0 0 {name=r35
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x2.xm5.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x2.xm5.m0[id])\\\}]]]"
descr="gm/Id_M5="}
C {ngspice_get_expr.sym} -560 -30 0 0 {name=r36
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x2.xm5.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x2.xm5.m0[vth])\\\}]]]"
descr="Vov_M5="}
C {ngspice_get_value.sym} -300 -120 0 0 {name=r37 node=i(@m.x1.x2.xm4.m0[id])
descr="Id_M4="}
C {ngspice_get_value.sym} -300 -80 0 0 {name=r38 node=@m.x1.x2.xm4.m0[gm]
descr="gm_M4="}
C {ngspice_get_value.sym} -300 -30 0 0 {name=r39 node=v(@m.x1.x2.xm4.m0[vds])
descr="Vds_M4="}
C {ngspice_get_value.sym} -230 -120 0 0 {name=r40 node=v(@m.x1.x2.xm4.m0[vgs])
descr="Vgs_M4="}
C {ngspice_get_value.sym} -230 -80 0 0 {name=r41 node=v(@m.x1.x2.xm4.m0[vth])
descr="Vth_M4="}
C {ngspice_get_expr.sym} -160 -120 0 0 {name=r42 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x2.xm4.m0[gds]\}]]"
descr="ro_M4="}
C {ngspice_get_expr.sym} -160 -80 0 0 {name=r43
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x2.xm4.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x2.xm4.m0[id])\\\}]]]"
descr="gm/Id_M4="}
C {ngspice_get_expr.sym} -230 -30 0 0 {name=r44
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x2.xm4.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x2.xm4.m0[vth])\\\}]]]"
descr="Vov_M4="}
C {ngspice_get_value.sym} 1170 -370 0 0 {name=r45 node=i(@m.x1.x2.xm6.m0[id])
descr="Id_M6="}
C {ngspice_get_value.sym} 1170 -330 0 0 {name=r46 node=@m.x1.x2.xm6.m0[gm]
descr="gm_M6="}
C {ngspice_get_value.sym} 1170 -280 0 0 {name=r47 node=v(@m.x1.x2.xm6.m0[vds])
descr="Vds_M6="}
C {ngspice_get_value.sym} 1240 -370 0 0 {name=r48 node=v(@m.x1.x2.xm6.m0[vgs])
descr="Vgs_M6="}
C {ngspice_get_value.sym} 1240 -330 0 0 {name=r49 node=v(@m.x1.x2.xm6.m0[vth])
descr="Vth_M6="}
C {ngspice_get_expr.sym} 1310 -370 0 0 {name=r50 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x2.xm6.m0[gds]\}]]"
descr="ro_M6="}
C {ngspice_get_expr.sym} 1310 -330 0 0 {name=r51
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x2.xm6.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x2.xm6.m0[id])\\\}]]]"
descr="gm/Id_M6="}
C {ngspice_get_expr.sym} 1240 -280 0 0 {name=r52
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x2.xm6.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x2.xm6.m0[vth])\\\}]]]"
descr="Vov_M6="}
C {ngspice_get_value.sym} 1500 -370 0 0 {name=r53 node=i(@m.x1.x2.xm7.m0[id])
descr="Id_M7="}
C {ngspice_get_value.sym} 1500 -330 0 0 {name=r54 node=@m.x1.x2.xm7.m0[gm]
descr="gm_M7="}
C {ngspice_get_value.sym} 1500 -280 0 0 {name=r55 node=v(@m.x1.x2.xm7.m0[vds])
descr="Vds_M7="}
C {ngspice_get_value.sym} 1570 -370 0 0 {name=r56 node=v(@m.x1.x2.xm7.m0[vgs])
descr="Vgs_M7="}
C {ngspice_get_value.sym} 1570 -330 0 0 {name=r57 node=v(@m.x1.x2.xm7.m0[vth])
descr="Vth_M7="}
C {ngspice_get_expr.sym} 1640 -370 0 0 {name=r58 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x2.xm7.m0[gds]\}]]"
descr="ro_M7="}
C {ngspice_get_expr.sym} 1640 -330 0 0 {name=r59
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x2.xm7.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x2.xm7.m0[id])\\\}]]]"
descr="gm/Id_M7="}
C {ngspice_get_expr.sym} 1570 -280 0 0 {name=r60
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x2.xm7.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x2.xm7.m0[vth])\\\}]]]"
descr="Vov_M7="}
C {ngspice_get_value.sym} 1500 -140 0 0 {name=r1 node=i(@m.x1.x2.xm9.m0[id])
descr="Id_M9="}
C {ngspice_get_value.sym} 1500 -100 0 0 {name=r2 node=@m.x1.x2.xm9.m0[gm]
descr="gm_M9="}
C {ngspice_get_value.sym} 1500 -50 0 0 {name=r61 node=v(@m.x1.x2.xm9.m0[vds])
descr="Vds_M9="}
C {ngspice_get_value.sym} 1570 -140 0 0 {name=r62 node=v(@m.x1.x2.xm9.m0[vgs])
descr="Vgs_M9="}
C {ngspice_get_value.sym} 1570 -100 0 0 {name=r63 node=v(@m.x1.x2.xm9.m0[vth])
descr="Vth_M9="}
C {ngspice_get_expr.sym} 1640 -140 0 0 {name=r64 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x2.xm9.m0[gds]\}]]"
descr="ro_M9="}
C {ngspice_get_expr.sym} 1640 -100 0 0 {name=r65
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x2.xm9.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x2.xm9.m0[id])\\\}]]]"
descr="gm/Id_M9="}
C {ngspice_get_expr.sym} 1570 -50 0 0 {name=r66
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x2.xm9.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x2.xm9.m0[vth])\\\}]]]"
descr="Vov_M9="}
C {ngspice_get_value.sym} 1170 -140 0 0 {name=r67 node=i(@m.x1.x2.xm8.m0[id])
descr="Id_M8="}
C {ngspice_get_value.sym} 1170 -100 0 0 {name=r68 node=@m.x1.x2.xm8.m0[gm]
descr="gm_M8="}
C {ngspice_get_value.sym} 1170 -50 0 0 {name=r69 node=v(@m.x1.x2.xm8.m0[vds])
descr="Vds_M8="}
C {ngspice_get_value.sym} 1240 -140 0 0 {name=r70 node=v(@m.x1.x2.xm8.m0[vgs])
descr="Vgs_M8="}
C {ngspice_get_value.sym} 1240 -100 0 0 {name=r71 node=v(@m.x1.x2.xm8.m0[vth])
descr="Vth_M8="}
C {ngspice_get_expr.sym} 1310 -140 0 0 {name=r72 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x2.xm8.m0[gds]\}]]"
descr="ro_M8="}
C {ngspice_get_expr.sym} 1310 -100 0 0 {name=r73
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x2.xm8.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x2.xm8.m0[id])\\\}]]]"
descr="gm/Id_M8="}
C {ngspice_get_expr.sym} 1240 -50 0 0 {name=r74
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x2.xm8.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x2.xm8.m0[vth])\\\}]]]"
descr="Vov_M8="}
C {lab_wire.sym} 540 -230 0 1 {name=p35 sig_type=std_logic lab=Vfbk}
C {lab_wire.sym} 410 -180 0 0 {name=p21 sig_type=std_logic lab=Vdrain_M4}
C {res.sym} 930 -310 0 1 {name=R75
value=25k
footprint=1206
device=resistor
m=1}
C {res.sym} 640 -310 0 1 {name=R76
value=25k
footprint=1206
device=resistor
m=1}
C {capa-2.sym} 690 -260 3 0 {name=C1
m=1
value=1p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 970 -260 3 0 {name=C2
m=1
value=1p
footprint=1206
device=polarized_capacitor}
