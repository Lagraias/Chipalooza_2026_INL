v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1010 -440 1010 -390 {lab=VSSA}
N 490 -480 550 -480 {lab=VSSA}
N 590 -550 690 -550 {lab=voutn}
N 590 -530 690 -530 {lab=voutp}
N 620 -550 620 -460 {lab=voutn}
N 690 -530 700 -530 {lab=voutp}
N 700 -530 700 -460 {lab=voutp}
N 620 -400 620 -350 {lab=VSSA}
N 700 -400 700 -350 {lab=VSSA}
N 880 -550 910 -550 {lab=voutp}
N 880 -530 910 -530 {lab=voutn}
N 490 -640 490 -600 {lab=VDDA}
N 1010 -620 1010 -580 {lab=VDDA}
N 300 -210 300 -170 {lab=VDDA}
N 300 -110 300 -60 {lab=VSSA}
N 390 -210 390 -170 {lab=VSSA}
N 390 -110 390 -60 {lab=0}
N 500 -200 500 -160 {lab=Vb1}
N 500 -110 500 -60 {lab=VSSA}
N 600 -200 600 -160 {lab=Vb3}
N 600 -110 600 -60 {lab=VSSA}
N 400 -440 440 -440 {lab=Vb1}
N 400 -420 440 -420 {lab=Vb1}
N 400 -400 440 -400 {lab=Vb3}
N 400 -380 440 -380 {lab=Vb4}
N 400 -360 440 -360 {lab=Vb5}
N 400 -440 400 -420 {lab=Vb1}
N 1110 -510 1150 -510 {lab=Vb4}
N 880 -490 910 -490 {lab=Vb1}
N 880 -470 910 -470 {lab=Vb5}
N 880 -510 910 -510 {lab=Balance_Level}
N 960 -210 960 -170 {lab=Balance_Level}
N 960 -110 960 -60 {lab=VSSA}
N 690 -640 690 -550 {lab=voutn}
N 690 -640 730 -640 {lab=voutn}
N 700 -530 710 -530 {lab=voutp}
N 710 -680 710 -530 {lab=voutp}
N 710 -680 730 -680 {lab=voutp}
N 770 -630 770 -580 {lab=VSSA}
N 770 -710 770 -690 {lab=Vout}
N 770 -710 830 -710 {lab=Vout}
N 360 -510 410 -510 {lab=Vinn}
N 360 -570 410 -570 {lab=Vinp}
N -250 -200 -250 -150 {lab=Vinp}
N -250 -90 -250 -50 {lab=VSSA}
N 0 -200 0 -150 {lab=Vinn}
N 0 -90 0 -50 {lab=VSSA}
N -250 -430 -250 -390 {lab=Vdiff}
N -250 -330 -250 -280 {lab=VSSA}
N 0 -430 0 -390 {lab=Vcmac}
N 0 -330 0 -280 {lab=VSSA}
N 790 -200 790 -160 {lab=Vb5}
N 790 -110 790 -60 {lab=VSSA}
N 700 -200 700 -160 {lab=Vb6}
N 700 -110 700 -60 {lab=VSSA}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/folded_cascode.sym} 510 -380 0 0 {name=x1}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/cmfb.sym} 800 -430 0 0 {name=x2}
C {lab_wire.sym} 1010 -390 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 550 -480 0 1 {name=p2 sig_type=std_logic lab=VSSA}
C {capa-2.sym} 620 -430 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 700 -430 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 620 -350 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 700 -350 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 640 -550 0 1 {name=p17 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 640 -530 0 1 {name=p18 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 880 -530 0 0 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 880 -550 0 0 {name=p4 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 490 -630 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 1010 -610 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {vsource.sym} 300 -140 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 300 -200 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 300 -60 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 390 -140 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 390 -200 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 390 -60 0 0 {name=l1 lab=0}
C {vsource.sym} 500 -140 0 0 {name=V5 value=Vb1 savecurrent=false}
C {lab_wire.sym} 500 -200 0 0 {name=p22 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 500 -60 0 0 {name=p23 sig_type=std_logic lab=VSSA}
C {vsource.sym} 600 -140 0 0 {name=V6 value=Vb3 savecurrent=false}
C {lab_wire.sym} 600 -200 0 0 {name=p24 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 600 -60 0 0 {name=p25 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 400 -420 0 0 {name=p9 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 400 -400 0 0 {name=p10 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 400 -380 0 0 {name=p11 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 400 -360 0 0 {name=p19 sig_type=std_logic lab=Vb5}
C {devices/code_shown.sym} 220 -790 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {lab_wire.sym} 880 -490 0 0 {name=p21 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 880 -470 0 0 {name=p26 sig_type=std_logic lab=Vb6}
C {lab_wire.sym} 880 -510 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {vsource.sym} 960 -140 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 960 -200 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 960 -60 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {launcher.sym} 460 -850 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op simulation/fc_cmfb_op_tb.raw"}
C {lab_wire.sym} 1130 -510 0 1 {name=p20 sig_type=std_logic lab=Vb4}
C {noconn.sym} 1150 -510 2 0 {name=l3}
C {vcvs.sym} 770 -660 0 0 {name=E1 value=1}
C {lab_wire.sym} 770 -580 0 0 {name=p33 sig_type=std_logic lab=VSSA}
C {noconn.sym} 830 -710 2 0 {name=l4}
C {lab_wire.sym} 780 -710 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {lab_wire.sym} 360 -510 0 0 {name=p14 sig_type=std_logic lab=Vinn}
C {code.sym} 10 -820 0 0 {name=SPICE only_toplevel=false value=
"
.temp 27
.param VDDA = 5
.param Balance_Level = 1.3
.param Vb1 = 3.96
.param Vb3 = 3.6
.param Vb5 = 0.72
.param Vb6 = 0.83
.param VD = 0
.param VCM = 2.5

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

write fc_cmfb_cmrr_op_tb.raw

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

write fc_cmfb_cmrr_tb.raw

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
C {lab_wire.sym} 360 -570 0 0 {name=p15 sig_type=std_logic lab=Vinp}
C {bsource.sym} -250 -120 0 0 {name=Bvinp VAR=V FUNC="\{VCM+V(Vdiff)/2 + V(Vcmac)\}" m=1}
C {bsource.sym} 0 -120 0 0 {name=Bvinn VAR=V FUNC="\{VCM-V(Vdiff)/2 + V(Vcmac)\}" m=1}
C {lab_wire.sym} -250 -200 0 0 {name=p35 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 0 -200 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 0 -50 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -250 -50 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {vsource.sym} -250 -360 0 0 {name=vdiff value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} -250 -280 0 0 {name=p39 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -250 -430 0 0 {name=p40 sig_type=std_logic lab=Vdiff}
C {vsource.sym} 0 -360 0 0 {name=vcmac value="dc 0 ac 0" savecurrent=false}
C {lab_wire.sym} 0 -280 0 0 {name=p41 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 0 -430 0 0 {name=p42 sig_type=std_logic lab=Vcmac}
C {vsource.sym} 790 -140 0 0 {name=V8 value=Vb5 savecurrent=false}
C {lab_wire.sym} 790 -200 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 790 -60 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {vsource.sym} 700 -140 0 0 {name=V7 value=Vb6 savecurrent=false}
C {lab_wire.sym} 700 -60 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 700 -200 0 0 {name=p43 sig_type=std_logic lab=Vb6}
