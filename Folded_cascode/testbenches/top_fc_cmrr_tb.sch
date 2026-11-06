v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1110 -490 1110 -450 {lab=VDDA}
N 1230 -400 1260 -400 {lab=voutp}
N 1230 -360 1260 -360 {lab=voutn}
N 1310 -290 1310 -240 {lab=VSSA}
N 1390 -290 1390 -240 {lab=VSSA}
N 1260 -360 1310 -360 {lab=voutn}
N 1310 -360 1310 -350 {lab=voutn}
N 1260 -400 1390 -400 {lab=voutp}
N 1390 -400 1390 -350 {lab=voutp}
N 970 -370 1000 -370 {lab=Balance_Level}
N 970 -350 1000 -350 {lab=Iref}
N 1110 -310 1110 -260 {lab=VSSA}
N 640 -170 640 -130 {lab=VDDA}
N 640 -70 640 -20 {lab=VSSA}
N 800 -170 800 -130 {lab=VSSA}
N 800 -70 800 -20 {lab=0}
N 650 -360 650 -320 {lab=Balance_Level}
N 650 -260 650 -210 {lab=VSSA}
N 800 -360 800 -320 {lab=Iref}
N 800 -260 800 -210 {lab=VSSA}
N 940 -410 1000 -410 {lab=Vinp}
N 940 -390 1000 -390 {lab=Vinn}
N 1370 -360 1410 -360 {lab=voutn}
N 1390 -400 1410 -400 {lab=voutp}
N 1450 -350 1450 -300 {lab=VSSA}
N 1450 -430 1450 -410 {lab=Vout}
N 1450 -430 1510 -430 {lab=Vout}
N 1310 -360 1370 -360 {lab=voutn}
N 110 -170 110 -120 {lab=Vinp}
N 110 -60 110 -20 {lab=VSSA}
N 360 -170 360 -120 {lab=Vinn}
N 360 -60 360 -20 {lab=VSSA}
N 110 -400 110 -360 {lab=Vdiff}
N 110 -300 110 -250 {lab=VSSA}
N 360 -400 360 -360 {lab=Vcmac}
N 360 -300 360 -250 {lab=VSSA}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/top_fc.sym} 1150 -380 0 0 {name=x1}
C {devices/code_shown.sym} 920 -660 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {launcher.sym} 1160 -720 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op simulation/top_fc_op_tb.raw"}
C {lab_wire.sym} 1110 -480 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 1260 -360 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 1260 -400 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 1310 -320 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 1390 -320 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 1310 -240 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1390 -240 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1110 -260 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} 640 -100 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 640 -160 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 640 -20 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 800 -100 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 800 -160 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 800 -20 0 0 {name=l1 lab=0}
C {vsource.sym} 650 -290 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 650 -350 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 650 -210 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 970 -370 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 800 -350 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 800 -210 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} 800 -290 0 0 {name=I0 value=1u}
C {lab_wire.sym} 970 -350 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 610 -740 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp 27
.param VDDA = 5
.param Balance_Level = 1.5
.param VCM = 2.5

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

* ============================================================
* 1. DIFFERENTIAL-MODE GAIN
*
* Vdiff = AC 1
* Vcmac = AC 0
*
* Vinp = VCM + Vdiff/2
* Vinn = VCM - Vdiff/2
*
* Therefore:
*
* Vinp - Vinn = Vdiff = 1 V AC
* ============================================================

alter @Vdiff[acmag] = 1
alter @Vcmac[acmag] = 0

ac dec 100 1 1G

* Differential output
let vod = v(voutp)-v(voutn)

* Differential voltage gain
let ad = vod/v(Vdiff)
let ad_db = db(ad)

* ------------------------------------------------------------
* Differential gain measurements
* ------------------------------------------------------------

meas ac ad_1Hz   FIND ad_db AT=1
meas ac ad_1k    FIND ad_db AT=1k
meas ac ad_10k   FIND ad_db AT=10k
meas ac ad_100k  FIND ad_db AT=100k
meas ac ad_1Meg  FIND ad_db AT=1Meg
meas ac ad_10Meg FIND ad_db AT=10Meg

print ad_1Hz
print ad_1k
print ad_10k
print ad_100k
print ad_1Meg
print ad_10Meg

write fc_cmfb_cmrr_diff_tb.raw

* ============================================================
* 2. COMMON-MODE GAIN
*
* Vdiff = AC 0
* Vcmac = AC 1
*
* Vinp = VCM + Vcmac
* Vinn = VCM + Vcmac
*
* Therefore:
*
* Vinp = Vinn
* Vicm = 1 V AC
* ============================================================

alter @Vdiff[acmag] = 0
alter @Vcmac[acmag] = 1

ac dec 100 1 1G

* Differential output caused by common-mode excitation
let vod_cm = v(voutp)-v(voutn)

* Common-mode to differential gain
let acm = vod_cm/v(Vcmac)
let acm_db = db(acm)

* ------------------------------------------------------------
* Common-mode gain measurements
* ------------------------------------------------------------

meas ac acm_1Hz   FIND acm_db AT=1
meas ac acm_1k    FIND acm_db AT=1k
meas ac acm_10k   FIND acm_db AT=10k
meas ac acm_100k  FIND acm_db AT=100k
meas ac acm_1Meg  FIND acm_db AT=1Meg
meas ac acm_10Meg FIND acm_db AT=10Meg

print acm_1Hz
print acm_1k
print acm_10k
print acm_100k
print acm_1Meg
print acm_10Meg

* ============================================================
* 3. CMRR
*
* First AC analysis  -> plot ac1
* Second AC analysis -> plot ac2 (current plot)
*
* CMRR[dB] = Ad[dB] - Acm[dB]
* ============================================================

let cmrr_db = ac1.ad_db - acm_db

* ------------------------------------------------------------
* CMRR measurements
* ------------------------------------------------------------

meas ac cmrr_1Hz   FIND cmrr_db AT=1
meas ac cmrr_1k    FIND cmrr_db AT=1k
meas ac cmrr_10k   FIND cmrr_db AT=10k
meas ac cmrr_100k  FIND cmrr_db AT=100k
meas ac cmrr_1Meg  FIND cmrr_db AT=1Meg
meas ac cmrr_10Meg FIND cmrr_db AT=10Meg

print cmrr_1Hz
print cmrr_1k
print cmrr_10k
print cmrr_100k
print cmrr_1Meg
print cmrr_10Meg

* ============================================================
* Save common-mode / CMRR results
* ============================================================

write top_fc_cmrr_tb.raw

* ============================================================
* Plots
* ============================================================

* Common-mode gain
plot acm_db

* CMRR
plot cmrr_db

* Differential gain from first AC run
plot ac1.ad_db

.endc
"}
C {lab_wire.sym} 940 -410 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 940 -390 0 0 {name=p15 sig_type=std_logic lab=Vinn}
C {vcvs.sym} 1450 -380 0 0 {name=E1 value=1}
C {noconn.sym} 1510 -430 2 0 {name=l4}
C {lab_wire.sym} 1460 -430 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {lab_wire.sym} 1450 -300 0 1 {name=p33 sig_type=std_logic lab=VSSA}
C {bsource.sym} 110 -90 0 0 {name=Bvinp VAR=V FUNC="\{VCM+V(Vdiff)/2 + V(Vcmac)\}" m=1}
C {bsource.sym} 360 -90 0 0 {name=Bvinn VAR=V FUNC="\{VCM-V(Vdiff)/2 + V(Vcmac)\}" m=1}
C {lab_wire.sym} 110 -170 0 0 {name=p18 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 360 -170 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 360 -20 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 110 -20 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {vsource.sym} 110 -330 0 0 {name=vdiff value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} 110 -250 0 0 {name=p39 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 110 -400 0 0 {name=p40 sig_type=std_logic lab=Vdiff}
C {vsource.sym} 360 -330 0 0 {name=vcmac value="dc 0 ac 0" savecurrent=false}
C {lab_wire.sym} 360 -250 0 0 {name=p41 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 360 -400 0 0 {name=p42 sig_type=std_logic lab=Vcmac}
