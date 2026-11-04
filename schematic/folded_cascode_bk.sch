v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 220 -500 220 -470 {lab=d_XM1}
N 220 -470 360 -470 {lab=d_XM1}
N 360 -470 360 -430 {lab=d_XM1}
N 120 -470 120 -430 {lab=d_XM1}
N 120 -470 220 -470 {lab=d_XM1}
N 220 -610 220 -570 {lab=VDDA}
N 220 -570 220 -560 {lab=VDDA}
N 220 -530 290 -530 {lab=VDDA}
N 120 -400 190 -400 {lab=VDDA}
N 290 -400 360 -400 {lab=VDDA}
N 30 -400 80 -400 {lab=Vinp}
N 400 -400 470 -400 {lab=Vinn}
N 590 -140 590 -110 {lab=VSSA}
N 590 -110 790 -110 {lab=VSSA}
N 790 -140 790 -110 {lab=VSSA}
N 630 -170 750 -170 {lab=Vb5}
N 120 -370 120 -220 {lab=d_XM5}
N 120 -220 500 -220 {lab=d_XM5}
N 590 -220 590 -200 {lab=d_XM5}
N 360 -370 360 -250 {lab=d_XM4}
N 360 -250 700 -250 {lab=d_XM4}
N 790 -250 790 -200 {lab=d_XM4}
N 500 -170 590 -170 {lab=VSSA}
N 790 -170 870 -170 {lab=VSSA}
N 500 -220 590 -220 {lab=d_XM5}
N 700 -250 790 -250 {lab=d_XM4}
N 790 -290 790 -250 {lab=d_XM4}
N 590 -290 590 -220 {lab=d_XM5}
N 590 -610 590 -560 {lab=VDDA}
N 590 -610 790 -610 {lab=VDDA}
N 790 -610 790 -560 {lab=VDDA}
N 790 -500 790 -450 {lab=d_XM11}
N 590 -500 590 -450 {lab=d_XM9}
N 590 -390 590 -350 {lab=Voutn}
N 790 -390 790 -350 {lab=Voutp}
N 630 -420 750 -420 {lab=Vb3}
N 630 -530 750 -530 {lab=Vb2}
N 510 -530 590 -530 {lab=VDDA}
N 790 -530 880 -530 {lab=VDDA}
N 790 -420 880 -420 {lab=VDDA}
N 510 -420 590 -420 {lab=VDDA}
N 510 -320 590 -320 {lab=VSSA}
N 790 -320 870 -320 {lab=VSSA}
N 630 -320 750 -320 {lab=Vb4}
N 120 -530 180 -530 {lab=Vb1}
N 590 -370 640 -370 {lab=Voutn}
N 750 -370 790 -370 {lab=Voutp}
C {symbols/pfet_05v0.sym} 200 -530 0 0 {name=M1
L=2u
W=75u
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
C {symbols/pfet_05v0.sym} 100 -400 0 0 {name=M2
L=0.5u
W=30u
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
C {symbols/pfet_05v0.sym} 380 -400 0 1 {name=M3
L=0.5u
W=30u
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
C {symbols/nfet_05v0.sym} 770 -170 0 0 {name=M4
L=2u
W=40u
nf=1
m=10
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/nfet_05v0.sym} 610 -170 0 1 {name=M5
L=2u
W=40u
nf=1
m=10
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/nfet_05v0.sym} 610 -320 0 1 {name=M6
L=2u
W=32u
nf=1
m=10
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/nfet_05v0.sym} 770 -320 0 0 {name=M7
L=2u
W=32u
nf=1
m=10
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_05v0
spiceprefix=X
}
C {symbols/pfet_05v0.sym} 610 -420 0 1 {name=M8
L=2u
W=60u
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
C {symbols/pfet_05v0.sym} 610 -530 0 1 {name=M9
L=2u
W=75u
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
C {symbols/pfet_05v0.sym} 770 -420 0 0 {name=M10
L=2u
W=60u
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
C {symbols/pfet_05v0.sym} 770 -530 0 0 {name=M11
L=2u
W=75u
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
C {lab_wire.sym} 220 -610 0 0 {name=p1 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 690 -610 0 0 {name=p2 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 290 -530 0 1 {name=p3 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 190 -400 0 1 {name=p4 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 290 -400 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 510 -530 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 880 -530 0 1 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 880 -420 0 1 {name=p8 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 510 -420 0 0 {name=p9 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 510 -320 0 0 {name=p10 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 500 -170 0 0 {name=p11 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 870 -170 0 1 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 870 -320 0 1 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 40 -400 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 430 -400 0 1 {name=p15 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 680 -110 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 120 -530 0 0 {name=p17 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 690 -530 0 0 {name=p18 sig_type=std_logic lab=Vb2}
C {lab_wire.sym} 690 -420 0 0 {name=p19 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 690 -320 0 0 {name=p20 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 680 -170 0 0 {name=p21 sig_type=std_logic lab=Vb5}
C {ipin.sym} -380 -460 0 0 {name=p22 lab=Vinp}
C {ipin.sym} -380 -420 0 0 {name=p23 lab=Vinn}
C {iopin.sym} -430 -620 0 0 {name=p24 lab=VDDA}
C {iopin.sym} -430 -590 0 0 {name=p25 lab=VSSA}
C {ipin.sym} -380 -380 0 0 {name=p26 lab=Vb1}
C {ipin.sym} -380 -340 0 0 {name=p27 lab=Vb2}
C {ipin.sym} -380 -300 0 0 {name=p28 lab=Vb3}
C {ipin.sym} -380 -270 0 0 {name=p29 lab=Vb4}
C {ipin.sym} -380 -240 0 0 {name=p30 lab=Vb5}
C {lab_wire.sym} 640 -370 0 1 {name=p31 sig_type=std_logic lab=Voutn}
C {lab_wire.sym} 750 -370 0 0 {name=p32 sig_type=std_logic lab=Voutp}
C {iopin.sym} 970 -390 0 0 {name=p33 lab=Voutp}
C {iopin.sym} 970 -360 0 0 {name=p34 lab=Voutn}
C {ngspice_probe.sym} 290 -470 0 0 {name=r1}
C {lab_wire.sym} 180 -470 0 0 {name=p35 sig_type=std_logic lab=d_XM1}
C {lab_wire.sym} 400 -220 0 0 {name=p36 sig_type=std_logic lab=d_XM5}
C {lab_wire.sym} 450 -250 0 0 {name=p37 sig_type=std_logic lab=d_XM4}
C {lab_wire.sym} 590 -470 0 0 {name=p38 sig_type=std_logic lab=d_XM9}
C {lab_wire.sym} 790 -470 0 0 {name=p39 sig_type=std_logic lab=d_XM11}
C {ngspice_get_value.sym} 280 -770 0 0 {name=r2 node=i(@m.x1.x1.xm1.m0[id])
descr="Id_M1="}
C {ngspice_get_value.sym} 280 -730 0 0 {name=r3 node=@m.x1.x1.xm1.m0[gm]
descr="gm_M1="}
C {ngspice_get_value.sym} 280 -680 0 0 {name=r5 node=v(@m.x1.x1.xm1.m0[vds])
descr="Vds_M1="}
C {ngspice_get_value.sym} 350 -770 0 0 {name=r6 node=v(@m.x1.x1.xm1.m0[vgs])
descr="Vgs_M1="}
C {ngspice_get_value.sym} 350 -730 0 0 {name=r7 node=v(@m.x1.x1.xm1.m0[vth])
descr="Vth_M1="}
C {ngspice_get_expr.sym} 420 -770 0 0 {name=r70 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x1.xm1.m0[gds]\}]]"
descr="ro_M1="}
C {ngspice_get_expr.sym} 420 -730 0 0 {name=r10
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x1.xm1.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x1.xm1.m0[id])\\\}]]]"
descr="gm/Id_M1="}
C {ngspice_get_expr.sym} 350 -680 0 0 {name=r11
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x1.xm1.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x1.xm1.m0[vth])\\\}]]]"
descr="Vov_M1="}
C {ngspice_get_value.sym} -290 -430 0 0 {name=r4 node=i(@m.x1.x1.xm2.m0[id])
descr="Id_M2="}
C {ngspice_get_value.sym} -290 -390 0 0 {name=r8 node=@m.x1.x1.xm2.m0[gm]
descr="gm_M2="}
C {ngspice_get_value.sym} -290 -340 0 0 {name=r12 node=v(@m.x1.x1.xm2.m0[vds])
descr="Vds_M2="}
C {ngspice_get_value.sym} -220 -430 0 0 {name=r13 node=v(@m.x1.x1.xm2.m0[vgs])
descr="Vgs_M2="}
C {ngspice_get_value.sym} -220 -390 0 0 {name=r14 node=v(@m.x1.x1.xm2.m0[vth])
descr="Vth_M2="}
C {ngspice_get_expr.sym} -150 -430 0 0 {name=r15 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x1.xm2.m0[gds]\}]]"
descr="ro_M2="}
C {ngspice_get_expr.sym} -150 -390 0 0 {name=r16
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x1.xm2.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x1.xm2.m0[id])\\\}]]]"
descr="gm/Id_M2="}
C {ngspice_get_expr.sym} -220 -340 0 0 {name=r17
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x1.xm2.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x1.xm2.m0[vth])\\\}]]]"
descr="Vov_M2="}
C {ngspice_get_value.sym} 1130 -460 0 0 {name=r18 node=i(@m.x1.x1.xm8.m0[id])
descr="Id_M8="}
C {ngspice_get_value.sym} 1130 -420 0 0 {name=r19 node=@m.x1.x1.xm8.m0[gm]
descr="gm_M8="}
C {ngspice_get_value.sym} 1130 -370 0 0 {name=r20 node=v(@m.x1.x1.xm8.m0[vds])
descr="Vds_M8="}
C {ngspice_get_value.sym} 1200 -460 0 0 {name=r21 node=v(@m.x1.x1.xm8.m0[vgs])
descr="Vgs_M8="}
C {ngspice_get_value.sym} 1200 -420 0 0 {name=r22 node=v(@m.x1.x1.xm8.m0[vth])
descr="Vth_M8="}
C {ngspice_get_expr.sym} 1270 -460 0 0 {name=r23 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x1.xm8.m0[gds]\}]]"
descr="ro_M8="}
C {ngspice_get_expr.sym} 1270 -420 0 0 {name=r24
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x1.xm8.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x1.xm8.m0[id])\\\}]]]"
descr="gm/Id_M8="}
C {ngspice_get_expr.sym} 1200 -370 0 0 {name=r25
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x1.xm8.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x1.xm8.m0[vth])\\\}]]]"
descr="Vov_M8="}
C {ngspice_get_value.sym} 1130 -630 0 0 {name=r26 node=i(@m.x1.x1.xm9.m0[id])
descr="Id_M9="}
C {ngspice_get_value.sym} 1130 -590 0 0 {name=r27 node=@m.x1.x1.xm9.m0[gm]
descr="gm_M9="}
C {ngspice_get_value.sym} 1130 -540 0 0 {name=r28 node=v(@m.x1.x1.xm9.m0[vds])
descr="Vds_M9="}
C {ngspice_get_value.sym} 1200 -630 0 0 {name=r29 node=v(@m.x1.x1.xm9.m0[vgs])
descr="Vgs_M9="}
C {ngspice_get_value.sym} 1200 -590 0 0 {name=r30 node=v(@m.x1.x1.xm9.m0[vth])
descr="Vth_M9="}
C {ngspice_get_expr.sym} 1270 -630 0 0 {name=r31 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x1.xm9.m0[gds]\}]]"
descr="ro_M9="}
C {ngspice_get_expr.sym} 1270 -590 0 0 {name=r32
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x1.xm9.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x1.xm9.m0[id])\\\}]]]"
descr="gm/Id_M9="}
C {ngspice_get_expr.sym} 1200 -540 0 0 {name=r33
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x1.xm9.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x1.xm9.m0[vth])\\\}]]]"
descr="Vov_M9="}
C {ngspice_get_value.sym} 1130 -300 0 0 {name=r34 node=i(@m.x1.x1.xm6.m0[id])
descr="Id_M6="}
C {ngspice_get_value.sym} 1130 -260 0 0 {name=r35 node=@m.x1.x1.xm6.m0[gm]
descr="gm_M6="}
C {ngspice_get_value.sym} 1130 -210 0 0 {name=r36 node=v(@m.x1.x1.xm6.m0[vds])
descr="Vds_M6="}
C {ngspice_get_value.sym} 1200 -300 0 0 {name=r37 node=v(@m.x1.x1.xm6.m0[vgs])
descr="Vgs_M6="}
C {ngspice_get_value.sym} 1200 -260 0 0 {name=r38 node=v(@m.x1.x1.xm6.m0[vth])
descr="Vth_M6="}
C {ngspice_get_expr.sym} 1270 -300 0 0 {name=r39 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x1.xm6.m0[gds]\}]]"
descr="ro_M6="}
C {ngspice_get_expr.sym} 1270 -260 0 0 {name=r40
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x1.xm6.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x1.xm6.m0[id])\\\}]]]"
descr="gm/Id_M6="}
C {ngspice_get_expr.sym} 1200 -210 0 0 {name=r41
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x1.xm6.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x1.xm6.m0[vth])\\\}]]]"
descr="Vov_M6="}
C {ngspice_get_value.sym} 1130 -130 0 0 {name=r42 node=i(@m.x1.x1.xm5.m0[id])
descr="Id_M5="}
C {ngspice_get_value.sym} 1130 -90 0 0 {name=r43 node=@m.x1.x1.xm5.m0[gm]
descr="gm_M5="}
C {ngspice_get_value.sym} 1130 -40 0 0 {name=r44 node=v(@m.x1.x1.xm5.m0[vds])
descr="Vds_M5="}
C {ngspice_get_value.sym} 1200 -130 0 0 {name=r45 node=v(@m.x1.x1.xm5.m0[vgs])
descr="Vgs_M5="}
C {ngspice_get_value.sym} 1200 -90 0 0 {name=r46 node=v(@m.x1.x1.xm5.m0[vth])
descr="Vth_M5="}
C {ngspice_get_expr.sym} 1270 -130 0 0 {name=r47 node="[expr 1.0 / [ngspice::get_node \{@m.x1.x1.xm5.m0[gds]\}]]"
descr="ro_M5="}
C {ngspice_get_expr.sym} 1270 -90 0 0 {name=r48
node="[format %.4g [expr [ngspice::get_node \\\{@m.x1.x1.xm5.m0[gm]\\\}] / [ngspice::get_node \\\{i(@m.x1.x1.xm5.m0[id])\\\}]]]"
descr="gm/Id_M5="}
C {ngspice_get_expr.sym} 1200 -40 0 0 {name=r49
node="[format %.4g [expr [ngspice::get_node \\\{v(@m.x1.x1.xm5.m0[vgs])\\\}] - [ngspice::get_node \\\{v(@m.x1.x1.xm5.m0[vth])\\\}]]]"
descr="Vov_M5="}
C {ngspice_get_expr.sym} -150 -340 0 0 {name=r9
node=v(@m.x1.x1.xm2.m0[vdsat])
descr="Vdsat_M2="}
C {ngspice_get_expr.sym} 420 -680 0 0 {name=r50
node=v(@m.x1.x1.xm1.m0[vdsat])
descr="Vdsat_M1="}
C {ngspice_get_expr.sym} 1270 -540 0 0 {name=r51
node=v(@m.x1.x1.xm9.m0[vdsat])
descr="Vdsat_M9="}
C {ngspice_get_expr.sym} 1270 -370 0 0 {name=r52
node=v(@m.x1.x1.xm8.m0[vdsat])
descr="Vdsat_M9="}
C {ngspice_get_expr.sym} 1270 -210 0 0 {name=r53
node=v(@m.x1.x1.xm6.m0[vdsat])
descr="Vdsat_M9="}
C {ngspice_get_expr.sym} 1270 -40 0 0 {name=r54
node=v(@m.x1.x1.xm5.m0[vdsat])
descr="Vdsat_M9="}
