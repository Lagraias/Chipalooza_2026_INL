v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 170 -400 170 -360 {lab=Vin}
N 170 -300 170 -250 {lab=VSSA}
N 1020 -420 1020 -370 {lab=VSSA}
N 500 -460 560 -460 {lab=VSSA}
N 600 -530 700 -530 {lab=voutn}
N 600 -510 700 -510 {lab=voutp}
N 630 -530 630 -440 {lab=voutn}
N 700 -510 710 -510 {lab=voutp}
N 710 -510 710 -440 {lab=voutp}
N 630 -380 630 -330 {lab=VSSA}
N 710 -380 710 -330 {lab=VSSA}
N 890 -530 920 -530 {lab=voutp}
N 890 -510 920 -510 {lab=voutn}
N 500 -620 500 -580 {lab=VDDA}
N 1020 -600 1020 -560 {lab=VDDA}
N 280 -190 280 -150 {lab=VDDA}
N 280 -90 280 -40 {lab=VSSA}
N 400 -190 400 -150 {lab=VSSA}
N 400 -90 400 -40 {lab=0}
N 510 -180 510 -140 {lab=Vb1}
N 510 -90 510 -40 {lab=VSSA}
N 610 -180 610 -140 {lab=Vb3}
N 610 -90 610 -40 {lab=VSSA}
N 410 -420 450 -420 {lab=Vb1}
N 410 -400 450 -400 {lab=Vb1}
N 410 -380 450 -380 {lab=Vb3}
N 410 -360 450 -360 {lab=Vb4}
N 410 -340 450 -340 {lab=Vb5}
N 410 -420 410 -400 {lab=Vb1}
N 1120 -490 1160 -490 {lab=Vb4}
N 890 -470 920 -470 {lab=Vb1}
N 890 -450 920 -450 {lab=Vb5}
N 890 -490 920 -490 {lab=Balance_Level}
N 970 -190 970 -150 {lab=Balance_Level}
N 970 -90 970 -40 {lab=VSSA}
N 700 -620 700 -530 {lab=voutn}
N 700 -620 740 -620 {lab=voutn}
N 710 -510 720 -510 {lab=voutp}
N 720 -660 720 -510 {lab=voutp}
N 720 -660 740 -660 {lab=voutp}
N 780 -610 780 -560 {lab=VSSA}
N 780 -690 780 -670 {lab=Vout}
N 780 -690 840 -690 {lab=Vout}
N 170 -400 260 -400 {lab=Vin}
N 260 -490 260 -470 {lab=Vin}
N 260 -490 420 -490 {lab=Vin}
N 170 -550 420 -550 {lab=Vin}
N 170 -550 170 -400 {lab=Vin}
N 260 -470 260 -460 {lab=Vin}
N 260 -460 260 -400 {lab=Vin}
N 800 -180 800 -140 {lab=Vb5}
N 800 -90 800 -40 {lab=VSSA}
N 710 -180 710 -140 {lab=Vb6}
N 710 -90 710 -40 {lab=VSSA}
C {/home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/folded_cascode.sym} 520 -360 0 0 {name=x1}
C {/home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/cmfb.sym} 810 -410 0 0 {name=x2}
C {vsource.sym} 170 -330 0 0 {name=V2 value=2.5 savecurrent=false}
C {lab_wire.sym} 170 -250 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1020 -370 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 560 -460 0 1 {name=p2 sig_type=std_logic lab=VSSA}
C {capa-2.sym} 630 -410 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 710 -410 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 630 -330 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 710 -330 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 650 -530 0 1 {name=p17 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 650 -510 0 1 {name=p18 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 890 -510 0 0 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 890 -530 0 0 {name=p4 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 500 -610 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 1020 -590 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {vsource.sym} 280 -120 0 0 {name=V1 value="dc VDDA ac 1" savecurrent=false}
C {lab_wire.sym} 280 -180 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 280 -40 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 400 -120 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 400 -180 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 400 -40 0 0 {name=l1 lab=0}
C {vsource.sym} 510 -120 0 0 {name=V5 value=Vb1 savecurrent=false}
C {lab_wire.sym} 510 -180 0 0 {name=p22 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 510 -40 0 0 {name=p23 sig_type=std_logic lab=VSSA}
C {vsource.sym} 610 -120 0 0 {name=V6 value=Vb3 savecurrent=false}
C {lab_wire.sym} 610 -180 0 0 {name=p24 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 610 -40 0 0 {name=p25 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 410 -400 0 0 {name=p9 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 410 -380 0 0 {name=p10 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 410 -360 0 0 {name=p11 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 410 -340 0 0 {name=p19 sig_type=std_logic lab=Vb5}
C {devices/code_shown.sym} 230 -770 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"}
C {lab_wire.sym} 890 -470 0 0 {name=p21 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 890 -450 0 0 {name=p26 sig_type=std_logic lab=Vb6}
C {lab_wire.sym} 890 -490 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {vsource.sym} 970 -120 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 970 -180 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 970 -40 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {launcher.sym} 470 -830 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/fc_cmfb_op_tb.raw"}
C {lab_wire.sym} 1140 -490 0 1 {name=p20 sig_type=std_logic lab=Vb4}
C {noconn.sym} 1160 -490 2 0 {name=l3}
C {vcvs.sym} 780 -640 0 0 {name=E1 value=1}
C {lab_wire.sym} 780 -560 0 0 {name=p33 sig_type=std_logic lab=VSSA}
C {noconn.sym} 840 -690 2 0 {name=l4}
C {lab_wire.sym} 790 -690 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {lab_wire.sym} 330 -550 0 1 {name=p35 sig_type=std_logic lab=Vin}
C {code.sym} 20 -800 0 0 {name=SPICE only_toplevel=false value=
"
.temp 27
.param VDDA = 5
.param Balance_Level = 1.3
.param Vb1 = 3.96
.param Vb3 = 3.6
.param Vb5 = 0.72
.param Vb6 = 0.83
.param VD = 0

.param sw_stat_global=0
.param sw_stat_mismatch=1

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

write fc_cmfb_psrrp_op_tb.raw

set appendwrite

ac dec 100 1 1G

* ------------------------------------------------------------
* Output components
* ------------------------------------------------------------

let vod  = v(voutp)-v(voutn)
let vocm = (v(voutp)+v(voutn))/2

* ------------------------------------------------------------
* Supply-to-output transfer functions
* ------------------------------------------------------------

let aps_p    = v(voutp)/v(VDDA)
let aps_n    = v(voutn)/v(VDDA)
let aps_diff = vod/v(VDDA)
let aps_cm   = vocm/v(VDDA)

* ------------------------------------------------------------
* Magnitude in dB
* ------------------------------------------------------------

let aps_p_db    = db(aps_p)
let aps_n_db    = db(aps_n)
let aps_diff_db = db(aps_diff)
let aps_cm_db   = db(aps_cm)

* ------------------------------------------------------------
* Output-referred supply rejection
* ------------------------------------------------------------

let psrr_diff = -aps_diff_db
let supply_rejection_cm = -aps_cm_db

* ============================================================
* Measurements: differential supply coupling
* ============================================================

meas ac aps_diff_1Hz   FIND aps_diff_db AT=1
meas ac aps_diff_1k    FIND aps_diff_db AT=1k
meas ac aps_diff_10k   FIND aps_diff_db AT=10k
meas ac aps_diff_100k  FIND aps_diff_db AT=100k
meas ac aps_diff_1Meg  FIND aps_diff_db AT=1Meg
meas ac aps_diff_10Meg FIND aps_diff_db AT=10Meg

* ============================================================
* Measurements: common-mode supply coupling
* ============================================================

meas ac aps_cm_1Hz   FIND aps_cm_db AT=1
meas ac aps_cm_1k    FIND aps_cm_db AT=1k
meas ac aps_cm_10k   FIND aps_cm_db AT=10k
meas ac aps_cm_100k  FIND aps_cm_db AT=100k
meas ac aps_cm_1Meg  FIND aps_cm_db AT=1Meg
meas ac aps_cm_10Meg FIND aps_cm_db AT=10Meg

* ============================================================
* Measurements: nominal differential supply rejection
* ============================================================

meas ac psrr_diff_1Hz   FIND psrr_diff AT=1
meas ac psrr_diff_1k    FIND psrr_diff AT=1k
meas ac psrr_diff_10k   FIND psrr_diff AT=10k
meas ac psrr_diff_100k  FIND psrr_diff AT=100k
meas ac psrr_diff_1Meg  FIND psrr_diff AT=1Meg
meas ac psrr_diff_10Meg FIND psrr_diff AT=10Meg

* ============================================================
* Measurements: common-mode supply rejection
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
* Save results
* ============================================================

write fc_cmfb_psrrp_tb.raw

* ============================================================
* Plots
* ============================================================

* Positive and negative output responses to VDDA disturbance
plot aps_p_db aps_n_db

* Differential supply coupling
plot aps_diff_db

* Common-mode supply coupling
plot aps_cm_db

* Nominal differential supply rejection
plot psrr_diff

* Common-mode supply rejection
plot supply_rejection_cm

.endc
"}
C {vsource.sym} 800 -120 0 0 {name=V8 value="dc Vb5 ac 0" savecurrent=false}
C {lab_wire.sym} 800 -180 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 800 -40 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {vsource.sym} 710 -120 0 0 {name=V7 value="dc Vb6 ac 0" savecurrent=false}
C {lab_wire.sym} 710 -40 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 710 -180 0 0 {name=p39 sig_type=std_logic lab=Vb6}
