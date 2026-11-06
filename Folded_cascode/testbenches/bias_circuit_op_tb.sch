v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 420 -380 420 -350 {lab=VDDA}
N 420 -210 420 -180 {lab=VSSA}
N 510 -310 570 -310 {lab=Vb1}
N 510 -280 570 -280 {lab=Vb3}
N 510 -250 570 -250 {lab=Vb5}
N 70 -180 70 -140 {lab=VDDA}
N 70 -80 70 -30 {lab=VSSA}
N 160 -180 160 -140 {lab=VSSA}
N 160 -80 160 -30 {lab=0}
N 260 -180 260 -140 {lab=Iref}
N 260 -80 260 -30 {lab=VSSA}
N 300 -310 330 -310 {lab=Iref}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/bias_circuit.sym} 200 -130 0 0 {name=x3}
C {noconn.sym} 570 -310 0 1 {name=l1}
C {noconn.sym} 570 -280 0 1 {name=l2}
C {noconn.sym} 570 -250 0 1 {name=l3}
C {lab_wire.sym} 550 -310 0 0 {name=p1 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 550 -280 0 0 {name=p2 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 550 -250 0 0 {name=p3 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 420 -370 0 0 {name=p4 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 420 -180 0 0 {name=p5 sig_type=std_logic lab=VSSA}
C {vsource.sym} 70 -110 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 70 -170 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 70 -30 0 0 {name=p7 sig_type=std_logic lab=VSSA}
C {vsource.sym} 160 -110 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 160 -170 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 160 -30 0 0 {name=l4 lab=0}
C {lab_wire.sym} 260 -170 0 0 {name=p8 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 260 -30 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} 260 -110 0 0 {name=I0 value=100n}
C {devices/code_shown.sym} 400 -110 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {launcher.sym} 140 -320 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op simulation/bias_circuit_op_tb.raw"}
C {code.sym} 90 -520 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp 27
.param VDDA = 5
.param Balance_Level = 1.3

.control
option sparse
set filetype=ascii
save all
save @m.x3.xm1.m0[id]
save @m.x3.xm1.m0[gm]
save @m.x3.xm1.m0[vgs]
save @m.x3.xm1.m0[vds]
save @m.x3.xm1.m0[vth]
save @m.x3.xm1.m0[gds]

save @m.x3.xm2.m0[id]
save @m.x3.xm2.m0[gm]
save @m.x3.xm2.m0[vgs]
save @m.x3.xm2.m0[vds]
save @m.x3.xm2.m0[vth]
save @m.x3.xm2.m0[gds]

save @m.x3.xm3.m0[id]
save @m.x3.xm3.m0[gm]
save @m.x3.xm3.m0[vgs]
save @m.x3.xm3.m0[vds]
save @m.x3.xm3.m0[vth]
save @m.x3.xm3.m0[gds]

save @m.x3.xm4.m0[id]
save @m.x3.xm4.m0[gm]
save @m.x3.xm4.m0[vgs]
save @m.x3.xm4.m0[vds]
save @m.x3.xm4.m0[vth]
save @m.x3.xm4.m0[gds]

save @m.x3.xm5.m0[id]
save @m.x3.xm5.m0[gm]
save @m.x3.xm5.m0[vgs]
save @m.x3.xm5.m0[vds]
save @m.x3.xm5.m0[vth]
save @m.x3.xm5.m0[gds]

save @m.x3.xm6.m0[id]
save @m.x3.xm6.m0[gm]
save @m.x3.xm6.m0[vgs]
save @m.x3.xm6.m0[vds]
save @m.x3.xm6.m0[vth]
save @m.x3.xm6.m0[gds]

save @m.x3.xm7.m0[id]
save @m.x3.xm7.m0[gm]
save @m.x3.xm7.m0[vgs]
save @m.x3.xm7.m0[vds]
save @m.x3.xm7.m0[vth]
save @m.x3.xm7.m0[gds]

save @m.x3.xm8.m0[id]
save @m.x3.xm8.m0[gm]
save @m.x3.xm8.m0[vgs]
save @m.x3.xm8.m0[vds]
save @m.x3.xm8.m0[vth]
save @m.x3.xm8.m0[gds]

save @m.x3.xm9.m0[id]
save @m.x3.xm9.m0[gm]
save @m.x3.xm9.m0[vgs]
save @m.x3.xm9.m0[vds]
save @m.x3.xm9.m0[vth]
save @m.x3.xm9.m0[gds]

save @m.x3.xm10.m0[id]
save @m.x3.xm10.m0[gm]
save @m.x3.xm10.m0[vgs]
save @m.x3.xm10.m0[vds]
save @m.x3.xm10.m0[vth]
save @m.x3.xm10.m0[gds]

save @m.x3.xm11.m0[id]
save @m.x3.xm11.m0[gm]
save @m.x3.xm11.m0[vgs]
save @m.x3.xm11.m0[vds]
save @m.x3.xm11.m0[vth]
save @m.x3.xm11.m0[gds]

save @m.x3.xm12.m0[id]
save @m.x3.xm12.m0[gm]
save @m.x3.xm12.m0[vgs]
save @m.x3.xm12.m0[vds]
save @m.x3.xm12.m0[vth]
save @m.x3.xm12.m0[gds]

save @m.x3.xm13.m0[id]
save @m.x3.xm13.m0[gm]
save @m.x3.xm13.m0[vgs]
save @m.x3.xm13.m0[vds]
save @m.x3.xm13.m0[vth]
save @m.x3.xm13.m0[gds]

save @m.x3.xm14.m0[id]
save @m.x3.xm14.m0[gm]
save @m.x3.xm14.m0[vgs]
save @m.x3.xm14.m0[vds]
save @m.x3.xm14.m0[vth]
save @m.x3.xm14.m0[gds]

op

write bias_circuit_op_tb.raw

.endc
"}
C {lab_wire.sym} 300 -310 0 0 {name=p10 sig_type=std_logic lab=Iref}
