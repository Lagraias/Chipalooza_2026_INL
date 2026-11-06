v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 400 -240 400 -200 {lab=VDDA}
N 200 70 200 110 {lab=VDDA}
N 200 170 200 220 {lab=VSSA}
N 290 70 290 110 {lab=VSSA}
N 290 170 290 220 {lab=0}
N 400 -60 400 -10 {lab=VSSA}
N 260 -170 300 -170 {lab=Voutp}
N 260 -150 300 -150 {lab=Voutp}
N 260 -130 300 -130 {lab=Balance_Level}
N 260 -110 300 -110 {lab=Vb1}
N 260 -90 300 -90 {lab=Vb5}
N 500 -130 540 -130 {lab=Vb4}
N 470 140 470 180 {lab=Voutp}
N 470 290 470 340 {lab=VSSA}
N 650 140 650 180 {lab=Voutn}
N 650 290 650 340 {lab=VSSA}
N -270 70 -270 110 {lab=Balance_Level}
N -270 170 -270 220 {lab=VSSA}
N -60 70 -60 110 {lab=Vb1}
N -60 170 -60 220 {lab=VSSA}
N 40 70 40 110 {lab=Vb5}
N 40 170 40 220 {lab=VSSA}
N 540 -130 560 -130 {lab=Vb4}
N 650 180 650 230 {lab=Voutn}
N 470 180 470 230 {lab=Voutp}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/cmfb.sym} 190 -50 0 0 {name=x2}
C {devices/code_shown.sym} 40 -440 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {lab_wire.sym} 400 -230 0 0 {name=p2 sig_type=std_logic lab=VDDA}
C {vsource.sym} 200 140 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 200 80 0 0 {name=p1 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 200 220 0 0 {name=p3 sig_type=std_logic lab=VSSA}
C {vsource.sym} 290 140 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 290 80 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 290 220 0 0 {name=l1 lab=0}
C {lab_wire.sym} 400 -10 0 0 {name=p4 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 260 -170 0 0 {name=p5 sig_type=std_logic lab=Voutp}
C {lab_wire.sym} 260 -130 0 0 {name=p7 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 260 -110 0 0 {name=p8 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 260 -90 0 0 {name=p9 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 510 -130 0 1 {name=p10 sig_type=std_logic lab=Vb4}
C {vsource.sym} 470 260 0 0 {name=V2 value=Voutp savecurrent=false}
C {lab_wire.sym} 470 150 0 0 {name=p11 sig_type=std_logic lab=Voutp}
C {lab_wire.sym} 470 340 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {vsource.sym} 650 260 0 0 {name=V4 value=Voutn savecurrent=false}
C {lab_wire.sym} 650 150 0 0 {name=p13 sig_type=std_logic lab=Voutn}
C {lab_wire.sym} 650 340 0 0 {name=p14 sig_type=std_logic lab=VSSA}
C {vsource.sym} -270 140 0 0 {name=V5 value=Balance_Level savecurrent=false}
C {lab_wire.sym} -270 80 0 0 {name=p15 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -270 220 0 0 {name=p17 sig_type=std_logic lab=VSSA}
C {vsource.sym} -60 140 0 0 {name=V6 value=Vb1 savecurrent=false}
C {lab_wire.sym} -60 80 0 0 {name=p18 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} -60 220 0 0 {name=p19 sig_type=std_logic lab=VSSA}
C {vsource.sym} 40 140 0 0 {name=V7 value=Vb5 savecurrent=false}
C {lab_wire.sym} 40 80 0 0 {name=p20 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 40 220 0 0 {name=p21 sig_type=std_logic lab=VSSA}
C {code_shown.sym} -960 -910 0 0 {name=NGSPICE1 only_toplevel=false value=
"
.temp 27
.param VDDA = 5
.param Balance_Level = 1.3
.param Vb1 = 4.02
.param Vb5 = 0.78
.param Voutp = 2.5
.param Voutn = 2.5
.param VD = 0
.control
option sparse
set filetype=ascii
save all
save @m.x2.xm1.m0[id]
save @m.x2.xm1.m0[gm]
save @m.x2.xm1.m0[vgs]
save @m.x2.xm1.m0[vds]
save @m.x2.xm1.m0[vth]
save @m.x2.xm1.m0[gds]

save @m.x2.xm2.m0[id]
save @m.x2.xm2.m0[gm]
save @m.x2.xm2.m0[vgs]
save @m.x2.xm2.m0[vds]
save @m.x2.xm2.m0[vth]
save @m.x2.xm2.m0[gds]

save @m.x2.xm3.m0[id]
save @m.x2.xm3.m0[gm]
save @m.x2.xm3.m0[vgs]
save @m.x2.xm3.m0[vds]
save @m.x2.xm3.m0[vth]
save @m.x2.xm3.m0[gds]

save @m.x2.xm4.m0[id]
save @m.x2.xm4.m0[gm]
save @m.x2.xm4.m0[vgs]
save @m.x2.xm4.m0[vds]
save @m.x2.xm4.m0[vth]
save @m.x2.xm4.m0[gds]

save @m.x2.xm5.m0[id]
save @m.x2.xm5.m0[gm]
save @m.x2.xm5.m0[vgs]
save @m.x2.xm5.m0[vds]
save @m.x2.xm5.m0[vth]
save @m.x2.xm5.m0[gds]

save @m.x2.xm6.m0[id]
save @m.x2.xm6.m0[gm]
save @m.x2.xm6.m0[vgs]
save @m.x2.xm6.m0[vds]
save @m.x2.xm6.m0[vth]
save @m.x2.xm6.m0[gds]

save @m.x2.xm7.m0[id]
save @m.x2.xm7.m0[gm]
save @m.x2.xm7.m0[vgs]
save @m.x2.xm7.m0[vds]
save @m.x2.xm7.m0[vth]
save @m.x2.xm7.m0[gds]

save @m.x2.xm8.m0[id]
save @m.x2.xm8.m0[gm]
save @m.x2.xm8.m0[vgs]
save @m.x2.xm8.m0[vds]
save @m.x2.xm8.m0[vth]
save @m.x2.xm8.m0[gds]

save @m.x2.xm9.m0[id]
save @m.x2.xm9.m0[gm]
save @m.x2.xm9.m0[vgs]
save @m.x2.xm9.m0[vds]
save @m.x2.xm9.m0[vth]
save @m.x2.xm9.m0[gds]

op

*print v(Vb4)
*print v(x2.Vfbk) v(x2.Vdrain_M4)

write cmfb_op_tb.raw

*dc V5 0.8 1.8 0.005

*wrdata cmfb_balance_sweep.txt v(Vb4) v(x2.Vfbk) v(x2.Vdrain_M4)

.endc
"}
C {launcher.sym} -190 -310 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op simulation/cmfb_op_tb.raw"}
C {noconn.sym} 560 -130 2 0 {name=l2}
C {lab_wire.sym} 260 -150 0 0 {name=p6 sig_type=std_logic lab=Voutp}
