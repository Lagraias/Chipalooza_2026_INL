v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 370 -370 370 -330 {lab=Vin}
N 370 -270 370 -220 {lab=VSSA}
N 370 -400 440 -400 {lab=Vin}
N 440 -380 530 -380 {lab=Vin}
N 440 -400 530 -400 {lab=Vin}
N 370 -400 370 -370 {lab=Vin}
N 640 -480 640 -440 {lab=VDDA}
N 760 -390 790 -390 {lab=voutp}
N 760 -350 790 -350 {lab=voutn}
N 840 -280 840 -230 {lab=VSSA}
N 920 -280 920 -230 {lab=VSSA}
N 790 -350 840 -350 {lab=voutn}
N 840 -350 840 -340 {lab=voutn}
N 790 -390 920 -390 {lab=voutp}
N 920 -390 920 -340 {lab=voutp}
N 500 -360 530 -360 {lab=Balance_Level}
N 440 -400 440 -380 {lab=Vin}
N 500 -340 530 -340 {lab=Iref}
N 640 -300 640 -250 {lab=VSSA}
N 80 -400 80 -360 {lab=VDDA}
N 80 -300 80 -250 {lab=VSSA}
N 240 -400 240 -360 {lab=VSSA}
N 240 -300 240 -250 {lab=0}
N 150 -160 150 -120 {lab=Balance_Level}
N 150 -60 150 -10 {lab=VSSA}
N 300 -160 300 -120 {lab=Iref}
N 300 -60 300 -10 {lab=VSSA}
N 600 -300 600 -250 {lab=CMFB_out}
N 600 -480 600 -440 {lab=Vb4}
N 530 -70 570 -70 {lab=CMFB_out}
N 690 -70 730 -70 {lab=Vb4}
N 570 -70 620 -70 {lab=CMFB_out}
N 620 -70 630 -70 {lab=CMFB_out}
C {devices/code_shown.sym} 450 -650 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {launcher.sym} 690 -710 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/top_fc_op_tb.raw"}
C {vsource.sym} 370 -300 0 0 {name=V2 value=2.5 savecurrent=false}
C {lab_wire.sym} 370 -220 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 400 -400 0 0 {name=p14 sig_type=std_logic lab=Vin}
C {lab_wire.sym} 640 -470 0 1 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 790 -350 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 790 -390 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 840 -310 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 920 -310 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 840 -230 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 920 -230 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 640 -250 0 1 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} 80 -330 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 80 -390 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 80 -250 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 240 -330 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 240 -390 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 240 -250 0 0 {name=l1 lab=0}
C {vsource.sym} 150 -90 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 150 -150 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 150 -10 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 500 -360 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 300 -150 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 300 -10 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} 300 -90 0 0 {name=I0 value=1u}
C {lab_wire.sym} 500 -340 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 140 -730 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp 27
.param VDDA = 5
.param Balance_Level = 1.5

.control
option sparse
set filetype=ascii
set wr_singlescale
set wr_vecnames
save all
save @m.x1.x1.xm1.m0[id]
save @m.x1.x1.xm1.m0[gm]
save @m.x1.x1.xm1.m0[vgs]
save @m.x1.x1.xm1.m0[vds]
save @m.x1.x1.xm1.m0[vth]
save @m.x1.x1.xm1.m0[gds]
save @m.x1.x1.xm1.m0[vdsat]

save @m.x1.x1.xm2.m0[id]
save @m.x1.x1.xm2.m0[gm]
save @m.x1.x1.xm2.m0[vgs]
save @m.x1.x1.xm2.m0[vds]
save @m.x1.x1.xm2.m0[vth]
save @m.x1.x1.xm2.m0[gds]
save @m.x1.x1.xm2.m0[vdsat]

save @m.x1.x1.xm9.m0[id]
save @m.x1.x1.xm9.m0[gm]
save @m.x1.x1.xm9.m0[vgs]
save @m.x1.x1.xm9.m0[vds]
save @m.x1.x1.xm9.m0[vth]
save @m.x1.x1.xm9.m0[gds]
save @m.x1.x1.xm9.m0[vdsat]

save @m.x1.x1.xm8.m0[id]
save @m.x1.x1.xm8.m0[gm]
save @m.x1.x1.xm8.m0[vgs]
save @m.x1.x1.xm8.m0[vds]
save @m.x1.x1.xm8.m0[vth]
save @m.x1.x1.xm8.m0[gds]
save @m.x1.x1.xm8.m0[vdsat]

save @m.x1.x1.xm6.m0[id]
save @m.x1.x1.xm6.m0[gm]
save @m.x1.x1.xm6.m0[vgs]
save @m.x1.x1.xm6.m0[vds]
save @m.x1.x1.xm6.m0[vth]
save @m.x1.x1.xm6.m0[gds]
save @m.x1.x1.xm6.m0[vdsat]

save @m.x1.x1.xm5.m0[id]
save @m.x1.x1.xm5.m0[gm]
save @m.x1.x1.xm5.m0[vgs]
save @m.x1.x1.xm5.m0[vds]
save @m.x1.x1.xm5.m0[vth]
save @m.x1.x1.xm5.m0[gds]
save @m.x1.x1.xm5.m0[vdsat]

save @m.x1.x2.xm1.m0[id]
save @m.x1.x2.xm1.m0[gm]
save @m.x1.x2.xm1.m0[vgs]
save @m.x1.x2.xm1.m0[vds]
save @m.x1.x2.xm1.m0[vth]
save @m.x1.x2.xm1.m0[gds]

save @m.x1.x2.xm2.m0[id]
save @m.x1.x2.xm2.m0[gm]
save @m.x1.x2.xm2.m0[vgs]
save @m.x1.x2.xm2.m0[vds]
save @m.x1.x2.xm2.m0[vth]
save @m.x1.x2.xm2.m0[gds]

save @m.x1.x2.xm3.m0[id]
save @m.x1.x2.xm3.m0[gm]
save @m.x1.x2.xm3.m0[vgs]
save @m.x1.x2.xm3.m0[vds]
save @m.x1.x2.xm3.m0[vth]
save @m.x1.x2.xm3.m0[gds]

save @m.x1.x2.xm4.m0[id]
save @m.x1.x2.xm4.m0[gm]
save @m.x1.x2.xm4.m0[vgs]
save @m.x1.x2.xm4.m0[vds]
save @m.x1.x2.xm4.m0[vth]
save @m.x1.x2.xm4.m0[gds]

save @m.x1.x2.xm5.m0[id]
save @m.x1.x2.xm5.m0[gm]
save @m.x1.x2.xm5.m0[vgs]
save @m.x1.x2.xm5.m0[vds]
save @m.x1.x2.xm5.m0[vth]
save @m.x1.x2.xm5.m0[gds]

save @m.x1.x2.xm6.m0[id]
save @m.x1.x2.xm6.m0[gm]
save @m.x1.x2.xm6.m0[vgs]
save @m.x1.x2.xm6.m0[vds]
save @m.x1.x2.xm6.m0[vth]
save @m.x1.x2.xm6.m0[gds]

save @m.x1.x2.xm7.m0[id]
save @m.x1.x2.xm7.m0[gm]
save @m.x1.x2.xm7.m0[vgs]
save @m.x1.x2.xm7.m0[vds]
save @m.x1.x2.xm7.m0[vth]
save @m.x1.x2.xm7.m0[gds]

save @m.x1.x2.xm8.m0[id]
save @m.x1.x2.xm8.m0[gm]
save @m.x1.x2.xm8.m0[vgs]
save @m.x1.x2.xm8.m0[vds]
save @m.x1.x2.xm8.m0[vth]
save @m.x1.x2.xm8.m0[gds]

save @m.x1.x2.xm9.m0[id]
save @m.x1.x2.xm9.m0[gm]
save @m.x1.x2.xm9.m0[vgs]
save @m.x1.x2.xm9.m0[vds]
save @m.x1.x2.xm9.m0[vth]
save @m.x1.x2.xm9.m0[gds]

save @m.x1.x3.xm1.m0[id]
save @m.x1.x3.xm1.m0[gm]
save @m.x1.x3.xm1.m0[vgs]
save @m.x1.x3.xm1.m0[vds]
save @m.x1.x3.xm1.m0[vth]
save @m.x1.x3.xm1.m0[gds]

save @m.x1.x3.xm2.m0[id]
save @m.x1.x3.xm2.m0[gm]
save @m.x1.x3.xm2.m0[vgs]
save @m.x1.x3.xm2.m0[vds]
save @m.x1.x3.xm2.m0[vth]
save @m.x1.x3.xm2.m0[gds]

save @m.x1.x3.xm3.m0[id]
save @m.x1.x3.xm3.m0[gm]
save @m.x1.x3.xm3.m0[vgs]
save @m.x1.x3.xm3.m0[vds]
save @m.x1.x3.xm3.m0[vth]
save @m.x1.x3.xm3.m0[gds]

save @m.x1.x3.xm4.m0[id]
save @m.x1.x3.xm4.m0[gm]
save @m.x1.x3.xm4.m0[vgs]
save @m.x1.x3.xm4.m0[vds]
save @m.x1.x3.xm4.m0[vth]
save @m.x1.x3.xm4.m0[gds]

save @m.x1.x3.xm5.m0[id]
save @m.x1.x3.xm5.m0[gm]
save @m.x1.x3.xm5.m0[vgs]
save @m.x1.x3.xm5.m0[vds]
save @m.x1.x3.xm5.m0[vth]
save @m.x1.x3.xm5.m0[gds]

save @m.x1.x3.xm6.m0[id]
save @m.x1.x3.xm6.m0[gm]
save @m.x1.x3.xm6.m0[vgs]
save @m.x1.x3.xm6.m0[vds]
save @m.x1.x3.xm6.m0[vth]
save @m.x1.x3.xm6.m0[gds]

save @m.x1.x3.xm7.m0[id]
save @m.x1.x3.xm7.m0[gm]
save @m.x1.x3.xm7.m0[vgs]
save @m.x1.x3.xm7.m0[vds]
save @m.x1.x3.xm7.m0[vth]
save @m.x1.x3.xm7.m0[gds]

save @m.x1.x3.xm8.m0[id]
save @m.x1.x3.xm8.m0[gm]
save @m.x1.x3.xm8.m0[vgs]
save @m.x1.x3.xm8.m0[vds]
save @m.x1.x3.xm8.m0[vth]
save @m.x1.x3.xm8.m0[gds]

save @m.x1.x3.xm9.m0[id]
save @m.x1.x3.xm9.m0[gm]
save @m.x1.x3.xm9.m0[vgs]
save @m.x1.x3.xm9.m0[vds]
save @m.x1.x3.xm9.m0[vth]
save @m.x1.x3.xm9.m0[gds]

save @m.x1.x3.xm10.m0[id]
save @m.x1.x3.xm10.m0[gm]
save @m.x1.x3.xm10.m0[vgs]
save @m.x1.x3.xm10.m0[vds]
save @m.x1.x3.xm10.m0[vth]
save @m.x1.x3.xm10.m0[gds]

save @m.x1.x3.xm11.m0[id]
save @m.x1.x3.xm11.m0[gm]
save @m.x1.x3.xm11.m0[vgs]
save @m.x1.x3.xm11.m0[vds]
save @m.x1.x3.xm11.m0[vth]
save @m.x1.x3.xm11.m0[gds]

save @m.x1.x3.xm12.m0[id]
save @m.x1.x3.xm12.m0[gm]
save @m.x1.x3.xm12.m0[vgs]
save @m.x1.x3.xm12.m0[vds]
save @m.x1.x3.xm12.m0[vth]
save @m.x1.x3.xm12.m0[gds]

save @m.x1.x3.xm13.m0[id]
save @m.x1.x3.xm13.m0[gm]
save @m.x1.x3.xm13.m0[vgs]
save @m.x1.x3.xm13.m0[vds]
save @m.x1.x3.xm13.m0[vth]
save @m.x1.x3.xm13.m0[gds]

save @m.x1.x3.xm14.m0[id]
save @m.x1.x3.xm14.m0[gm]
save @m.x1.x3.xm14.m0[vgs]
save @m.x1.x3.xm14.m0[vds]
save @m.x1.x3.xm14.m0[vth]
save @m.x1.x3.xm14.m0[gds]

save @m.x1.x3.xm15.m0[id]
save @m.x1.x3.xm15.m0[gm]
save @m.x1.x3.xm15.m0[vgs]
save @m.x1.x3.xm15.m0[vds]
save @m.x1.x3.xm15.m0[vth]
save @m.x1.x3.xm15.m0[gds]

save @m.x1.x3.xm16.m0[id]
save @m.x1.x3.xm16.m0[gm]
save @m.x1.x3.xm16.m0[vgs]
save @m.x1.x3.xm16.m0[vds]
save @m.x1.x3.xm16.m0[vth]
save @m.x1.x3.xm16.m0[gds]

save @m.x1.x3.xm17.m0[id]
save @m.x1.x3.xm17.m0[gm]
save @m.x1.x3.xm17.m0[vgs]
save @m.x1.x3.xm17.m0[vds]
save @m.x1.x3.xm17.m0[vth]
save @m.x1.x3.xm17.m0[gds]

save @m.x1.x3.xm18.m0[id]
save @m.x1.x3.xm18.m0[gm]
save @m.x1.x3.xm18.m0[vgs]
save @m.x1.x3.xm18.m0[vds]
save @m.x1.x3.xm18.m0[vth]
save @m.x1.x3.xm18.m0[gds]

save @m.x1.x3.xm21.m0[id]
save @m.x1.x3.xm21.m0[gm]
save @m.x1.x3.xm21.m0[vgs]
save @m.x1.x3.xm21.m0[vds]
save @m.x1.x3.xm21.m0[vth]
save @m.x1.x3.xm21.m0[gds]

save @m.x1.x3.xm22.m0[id]
save @m.x1.x3.xm22.m0[gm]
save @m.x1.x3.xm22.m0[vgs]
save @m.x1.x3.xm22.m0[vds]
save @m.x1.x3.xm22.m0[vth]
save @m.x1.x3.xm22.m0[gds]

op
write top_fc_op_tb.raw all

set appendwrite
ac dec 100 1 1G

* Approximate CMFB loop gain
let loopgain = -v(CMFB_out)/v(Vb4)

* Magnitude and phase in degrees
let lg_db = db(loopgain)
let lg_phase_deg = phase(loopgain)*180/3.141592653589793

* -------------------------------------------------
* First 0-dB crossing
* -------------------------------------------------
meas ac f_ugf1 WHEN lg_db=0 CROSS=1
meas ac phase_ugf1 FIND lg_phase_deg AT=$&f_ugf1

let pm1 = 180 + phase_ugf1

* -------------------------------------------------
* Second 0-dB crossing
* -------------------------------------------------
meas ac f_ugf2 WHEN lg_db=0 CROSS=2
meas ac phase_ugf2 FIND lg_phase_deg AT=$&f_ugf2

* phase() wraps the phase between approximately -180 and +180 deg.
* At the second crossing, convert the positive wrapped phase
* to its continuous negative equivalent.
let phase_ugf2_unwrapped = phase_ugf2 - 360
let pm2 = 180 + phase_ugf2_unwrapped

* -------------------------------------------------
* Results
* -------------------------------------------------
print f_ugf1
print phase_ugf1
print pm1

print f_ugf2
print phase_ugf2
print phase_ugf2_unwrapped
print pm2

write top_fc_stb_tb.raw

plot lg_db
plot lg_phase_deg

.endc
"}
C {realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/top_fc_stb.sym} 640 -160 0 0 {name=x1}
C {lab_wire.sym} 540 -70 0 1 {name=p20 sig_type=std_logic lab=CMFB_out}
C {vsource.sym} 660 -70 1 0 {name=V9 value= "dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} 700 -70 0 1 {name=p36 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 600 -250 0 0 {name=p11 sig_type=std_logic lab=CMFB_out}
C {lab_wire.sym} 600 -470 0 0 {name=p17 sig_type=std_logic lab=Vb4}
