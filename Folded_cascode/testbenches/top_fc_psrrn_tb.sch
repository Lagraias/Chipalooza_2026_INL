v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 350 -370 350 -330 {lab=Vin}
N 350 -270 350 -220 {lab=VSSA}
N 350 -400 420 -400 {lab=Vin}
N 420 -380 510 -380 {lab=Vin}
N 420 -400 510 -400 {lab=Vin}
N 350 -400 350 -370 {lab=Vin}
N 620 -480 620 -440 {lab=VDDA}
N 740 -390 770 -390 {lab=voutp}
N 740 -350 770 -350 {lab=voutn}
N 820 -280 820 -230 {lab=VSSA}
N 900 -280 900 -230 {lab=VSSA}
N 770 -350 820 -350 {lab=voutn}
N 820 -350 820 -340 {lab=voutn}
N 770 -390 900 -390 {lab=voutp}
N 900 -390 900 -340 {lab=voutp}
N 480 -360 510 -360 {lab=Balance_Level}
N 420 -400 420 -380 {lab=Vin}
N 480 -340 510 -340 {lab=Iref}
N 620 -300 620 -250 {lab=VSSA}
N 60 -400 60 -360 {lab=VDDA}
N 60 -300 60 -250 {lab=VSSA}
N 220 -400 220 -360 {lab=VSSA}
N 220 -300 220 -250 {lab=0}
N 130 -160 130 -120 {lab=Balance_Level}
N 130 -60 130 -10 {lab=VSSA}
N 310 -160 310 -120 {lab=Iref}
N 310 -60 310 -10 {lab=VSSA}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/top_fc.sym} 660 -370 0 0 {name=x1}
C {devices/code_shown.sym} 430 -650 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {launcher.sym} 670 -710 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op simulation/top_fc_op_tb.raw"}
C {vsource.sym} 350 -300 0 0 {name=V2 value=2.5 savecurrent=false}
C {lab_wire.sym} 350 -220 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 380 -400 0 0 {name=p14 sig_type=std_logic lab=Vin}
C {lab_wire.sym} 620 -470 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 770 -350 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 770 -390 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 820 -310 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 900 -310 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 820 -230 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 900 -230 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 620 -250 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} 60 -330 0 0 {name=V1 value="DC VDDA AC 0" savecurrent=false}
C {lab_wire.sym} 60 -390 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 60 -250 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 220 -330 0 0 {name=V3 value="DC 0 AC 1" savecurrent=false}
C {lab_wire.sym} 220 -390 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 220 -250 0 0 {name=l1 lab=0}
C {vsource.sym} 130 -90 0 0 {name=V4 value="DC Balance_Level AC 0" savecurrent=false}
C {lab_wire.sym} 130 -150 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 130 -10 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 480 -360 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 310 -150 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 310 -10 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} 310 -90 0 0 {name=I0 value="DC 1u AC 0"}
C {lab_wire.sym} 480 -340 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 120 -730 0 0 {name=NGSPICE only_toplevel=false value=
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

* ------------------------------------------------------------
* Output quantities referred to global ground
* ------------------------------------------------------------

let vod  = v(voutp)-v(voutn)
let vocm = (v(voutp)+v(voutn))/2

* ------------------------------------------------------------
* Supply-to-output transfer functions
*
* VSSA has AC amplitude = 1 V
* ------------------------------------------------------------

let aps_p    = v(voutp)/v(VSSA)
let aps_n    = v(voutn)/v(VSSA)
let aps_diff = vod/v(VSSA)
let aps_cm   = vocm/v(VSSA)

* ------------------------------------------------------------
* Magnitude in dB
* ------------------------------------------------------------

let aps_p_db    = db(aps_p)
let aps_n_db    = db(aps_n)
let aps_diff_db = db(aps_diff)
let aps_cm_db   = db(aps_cm)

* ------------------------------------------------------------
* Nominal supply rejection
* ------------------------------------------------------------

let psrr_diff = -aps_diff_db
let supply_rejection_cm = -aps_cm_db

* ============================================================
* Differential supply coupling
* ============================================================

meas ac aps_diff_1Hz   FIND aps_diff_db AT=1
meas ac aps_diff_1k    FIND aps_diff_db AT=1k
meas ac aps_diff_10k   FIND aps_diff_db AT=10k
meas ac aps_diff_100k  FIND aps_diff_db AT=100k
meas ac aps_diff_1Meg  FIND aps_diff_db AT=1Meg
meas ac aps_diff_10Meg FIND aps_diff_db AT=10Meg

* ============================================================
* Common-mode supply coupling
* ============================================================

meas ac aps_cm_1Hz   FIND aps_cm_db AT=1
meas ac aps_cm_1k    FIND aps_cm_db AT=1k
meas ac aps_cm_10k   FIND aps_cm_db AT=10k
meas ac aps_cm_100k  FIND aps_cm_db AT=100k
meas ac aps_cm_1Meg  FIND aps_cm_db AT=1Meg
meas ac aps_cm_10Meg FIND aps_cm_db AT=10Meg

* ============================================================
* Nominal differential PSRR-
* ============================================================

meas ac psrr_diff_1Hz   FIND psrr_diff AT=1
meas ac psrr_diff_1k    FIND psrr_diff AT=1k
meas ac psrr_diff_10k   FIND psrr_diff AT=10k
meas ac psrr_diff_100k  FIND psrr_diff AT=100k
meas ac psrr_diff_1Meg  FIND psrr_diff AT=1Meg
meas ac psrr_diff_10Meg FIND psrr_diff AT=10Meg

* ============================================================
* Common-mode supply rejection
* ============================================================

meas ac sr_cm_1Hz   FIND supply_rejection_cm AT=1
meas ac sr_cm_1k    FIND supply_rejection_cm AT=1k
meas ac sr_cm_10k   FIND supply_rejection_cm AT=10k
meas ac sr_cm_100k  FIND supply_rejection_cm AT=100k
meas ac sr_cm_1Meg  FIND supply_rejection_cm AT=1Meg
meas ac sr_cm_10Meg FIND supply_rejection_cm AT=10Meg

* ============================================================
* Print results
* ============================================================

print aps_diff_1Hz
print aps_diff_1k
print aps_diff_10k
print aps_diff_100k
print aps_diff_1Meg
print aps_diff_10Meg

print aps_cm_1Hz
print aps_cm_1k
print aps_cm_10k
print aps_cm_100k
print aps_cm_1Meg
print aps_cm_10Meg

print psrr_diff_1Hz
print psrr_diff_1k
print psrr_diff_10k
print psrr_diff_100k
print psrr_diff_1Meg
print psrr_diff_10Meg

print sr_cm_1Hz
print sr_cm_1k
print sr_cm_10k
print sr_cm_100k
print sr_cm_1Meg
print sr_cm_10Meg

* ============================================================
* Save AC results
* ============================================================

write top_fc_psrrn_tb.raw

* ============================================================
* Plots
* ============================================================

* Individual output response to VSSA disturbance
plot aps_p_db aps_n_db

* Differential supply coupling
plot aps_diff_db

* Common-mode supply coupling
plot aps_cm_db

* Nominal differential PSRR-
plot psrr_diff

* Common-mode supply rejection
plot supply_rejection_cm



.endc
"}
