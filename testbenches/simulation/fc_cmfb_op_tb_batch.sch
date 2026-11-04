v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 50 -300 50 -260 {lab=Vin}
N 50 -200 50 -150 {lab=VSSA}
N 50 -300 120 -300 {lab=Vin}
N 120 -300 120 -270 {lab=Vin}
N 120 -270 210 -270 {lab=Vin}
N 120 -330 210 -330 {lab=Vin}
N 120 -330 120 -300 {lab=Vin}
N 810 -200 810 -150 {lab=VSSA}
N 290 -240 350 -240 {lab=VSSA}
N 390 -310 490 -310 {lab=voutn}
N 390 -290 490 -290 {lab=voutp}
N 420 -310 420 -220 {lab=voutn}
N 490 -290 500 -290 {lab=voutp}
N 500 -290 500 -220 {lab=voutp}
N 420 -160 420 -110 {lab=VSSA}
N 500 -160 500 -110 {lab=VSSA}
N 680 -310 710 -310 {lab=voutp}
N 680 -290 710 -290 {lab=voutn}
N 290 -400 290 -360 {lab=VDDA}
N 810 -380 810 -340 {lab=VDDA}
N 100 30 100 70 {lab=VDDA}
N 100 130 100 180 {lab=VSSA}
N 190 30 190 70 {lab=VSSA}
N 190 130 190 180 {lab=0}
N 300 40 300 80 {lab=Vb1}
N 300 130 300 180 {lab=VSSA}
N 400 40 400 80 {lab=Vb3}
N 400 130 400 180 {lab=VSSA}
N 600 40 600 80 {lab=Vb5}
N 600 130 600 180 {lab=VSSA}
N 200 -200 240 -200 {lab=Vb1}
N 200 -180 240 -180 {lab=Vb1}
N 200 -160 240 -160 {lab=Vb3}
N 200 -140 240 -140 {lab=Vb4}
N 200 -120 240 -120 {lab=Vb5}
N 200 -200 200 -180 {lab=Vb1}
N 910 -270 950 -270 {lab=Vb4}
N 680 -250 710 -250 {lab=Vb1}
N 680 -230 710 -230 {lab=Vb6}
N 680 -270 710 -270 {lab=Balance_Level}
N 760 30 760 70 {lab=Balance_Level}
N 760 130 760 180 {lab=VSSA}
N 510 40 510 80 {lab=Vb6}
N 510 130 510 180 {lab=VSSA}
C {/home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/folded_cascode.sym} 310 -140 0 0 {name=x1}
C {/home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/cmfb.sym} 600 -190 0 0 {name=x2}
C {vsource.sym} 50 -230 0 0 {name=V2 value=2.5 savecurrent=false}
C {lab_wire.sym} 50 -150 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 100 -300 0 0 {name=p14 sig_type=std_logic lab=Vin}
C {lab_wire.sym} 810 -150 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 350 -240 0 1 {name=p2 sig_type=std_logic lab=VSSA}
C {capa-2.sym} 420 -190 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 500 -190 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 420 -110 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 500 -110 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 440 -310 0 1 {name=p17 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 440 -290 0 1 {name=p18 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 680 -290 0 0 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 680 -310 0 0 {name=p4 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 290 -390 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 810 -370 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {vsource.sym} 100 100 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 100 40 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 100 180 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 190 100 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 190 40 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 190 180 0 0 {name=l1 lab=0}
C {vsource.sym} 300 100 0 0 {name=V5 value=Vb1 savecurrent=false}
C {lab_wire.sym} 300 40 0 0 {name=p22 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 300 180 0 0 {name=p23 sig_type=std_logic lab=VSSA}
C {vsource.sym} 400 100 0 0 {name=V6 value=Vb3 savecurrent=false}
C {lab_wire.sym} 400 40 0 0 {name=p24 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 400 180 0 0 {name=p25 sig_type=std_logic lab=VSSA}
C {vsource.sym} 600 100 0 0 {name=V8 value=Vb5 savecurrent=false}
C {lab_wire.sym} 600 40 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 600 180 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 200 -180 0 0 {name=p9 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 200 -160 0 0 {name=p10 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 200 -140 0 0 {name=p11 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 200 -120 0 0 {name=p19 sig_type=std_logic lab=Vb5}
C {devices/code_shown.sym} 20 -550 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"}
C {lab_wire.sym} 680 -250 0 0 {name=p21 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 680 -230 0 0 {name=p26 sig_type=std_logic lab=Vb6}
C {lab_wire.sym} 680 -270 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {vsource.sym} 760 100 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 760 40 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 760 180 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {code_shown.sym} -1570 -1420 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp 27
.param VDDA = 5
.param Balance_Level = 1.3
.param Vb1 = 3.96
.param Vb3 = 3.6
.param Vb5 = 0.72
.param Vb6 = 0.83

.param VD = 0

.control
option sparse
set filetype=ascii
set wr_singlescale
set wr_vecnames
save all
save @m.x1.xm1.m0[id]
save @m.x1.xm1.m0[gm]
save @m.x1.xm1.m0[vgs]
save @m.x1.xm1.m0[vds]
save @m.x1.xm1.m0[vth]
save @m.x1.xm1.m0[gds]

save @m.x1.xm2.m0[id]
save @m.x1.xm2.m0[gm]
save @m.x1.xm2.m0[vgs]
save @m.x1.xm2.m0[vds]
save @m.x1.xm2.m0[vth]
save @m.x1.xm2.m0[gds]

save @m.x1.xm9.m0[id]
save @m.x1.xm9.m0[gm]
save @m.x1.xm9.m0[vgs]
save @m.x1.xm9.m0[vds]
save @m.x1.xm9.m0[vth]
save @m.x1.xm9.m0[gds]

save @m.x1.xm8.m0[id]
save @m.x1.xm8.m0[gm]
save @m.x1.xm8.m0[vgs]
save @m.x1.xm8.m0[vds]
save @m.x1.xm8.m0[vth]
save @m.x1.xm8.m0[gds]

save @m.x1.xm6.m0[id]
save @m.x1.xm6.m0[gm]
save @m.x1.xm6.m0[vgs]
save @m.x1.xm6.m0[vds]
save @m.x1.xm6.m0[vth]
save @m.x1.xm6.m0[gds]

save @m.x1.xm5.m0[id]
save @m.x1.xm5.m0[gm]
save @m.x1.xm5.m0[vgs]
save @m.x1.xm5.m0[vds]
save @m.x1.xm5.m0[vth]
save @m.x1.xm5.m0[gds]
save @m.x1.xm5.m0[vdsat]
save @m.x1.xm4.m0[vdsat]

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
*dc V7 0.80 1.50 0.002

*let vcm_out = (v(Voutp)+v(Voutn))/2
*let gmid_m5 = @m.x1.xm5.m0[gm]/@m.x1.xm5.m0[id]
*let satmargin_m5 = @m.x1.xm5.m0[vds]-@m.x1.xm5.m0[vdsat]

*print v(Voutp) v(Voutn) vcm_out
*print @m.x1.xm5.m0[id]
*print @m.x1.xm5.m0[gm]
*print gmid_m5
*print @m.x1.xm5.m0[vgs]
*print @m.x1.xm5.m0[vds]
*print @m.x1.xm5.m0[vdsat]
*print satmargin_m5

*wrdata fc_vb4_results.txt v(Voutp) v(Voutn) vcm_out @m.x1.xm5.m0[id] @m.x1.xm5.m0[gm] gmid_m5 @m.x1.xm5.m0[vds] @m.x1.xm5.m0[vdsat] satmargin_m5

write fc_cmfb_op_tb.raw

.endc
"}
C {launcher.sym} 260 -610 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/fc_cmfb_op_tb.raw"}
C {vsource.sym} 510 100 0 0 {name=V7 value=Vb6 savecurrent=false}
C {lab_wire.sym} 510 180 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 930 -270 0 1 {name=p20 sig_type=std_logic lab=Vb4}
C {noconn.sym} 950 -270 2 0 {name=l3}
C {lab_wire.sym} 510 40 0 0 {name=p33 sig_type=std_logic lab=Vb6}
