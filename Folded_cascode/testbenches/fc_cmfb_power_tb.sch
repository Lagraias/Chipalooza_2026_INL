v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1360 -400 1360 -350 {lab=VSSA}
N 840 -440 900 -440 {lab=VSSA}
N 940 -510 1040 -510 {lab=voutn}
N 940 -490 1040 -490 {lab=voutp}
N 970 -510 970 -420 {lab=voutn}
N 1040 -490 1050 -490 {lab=voutp}
N 1050 -490 1050 -420 {lab=voutp}
N 970 -360 970 -310 {lab=VSSA}
N 1050 -360 1050 -310 {lab=VSSA}
N 1230 -510 1260 -510 {lab=voutp}
N 1230 -490 1260 -490 {lab=voutn}
N 840 -690 840 -650 {lab=VDDA}
N 1360 -670 1360 -630 {lab=VDDA}
N 620 -170 620 -130 {lab=VDDA}
N 620 -70 620 -20 {lab=VSSA}
N 740 -170 740 -130 {lab=VSSA}
N 740 -70 740 -20 {lab=0}
N 850 -160 850 -120 {lab=Vb1}
N 850 -70 850 -20 {lab=VSSA}
N 950 -160 950 -120 {lab=Vb3}
N 950 -70 950 -20 {lab=VSSA}
N 750 -400 790 -400 {lab=Vb1}
N 750 -380 790 -380 {lab=Vb1}
N 750 -360 790 -360 {lab=Vb3}
N 750 -340 790 -340 {lab=Vb4}
N 750 -320 790 -320 {lab=Vb5}
N 750 -400 750 -380 {lab=Vb1}
N 1460 -470 1500 -470 {lab=Vb4}
N 1230 -450 1260 -450 {lab=Vb1}
N 1230 -430 1260 -430 {lab=Vb5}
N 1230 -470 1260 -470 {lab=Balance_Level}
N 1310 -170 1310 -130 {lab=Balance_Level}
N 1310 -70 1310 -20 {lab=VSSA}
N 1040 -600 1040 -510 {lab=voutn}
N 1040 -600 1080 -600 {lab=voutn}
N 1050 -490 1060 -490 {lab=voutp}
N 1060 -640 1060 -490 {lab=voutp}
N 1060 -640 1080 -640 {lab=voutp}
N 1120 -590 1120 -540 {lab=VSSA}
N 1120 -670 1120 -650 {lab=Vout}
N 1120 -670 1180 -670 {lab=Vout}
N 10 -190 10 -140 {lab=Vinp}
N 10 -80 10 -40 {lab=VSSA}
N 310 -190 310 -140 {lab=Vinn}
N 310 -80 310 -40 {lab=VSSA}
N 670 -530 760 -530 {lab=Vinp}
N 670 -470 760 -470 {lab=Vinn}
N 10 -410 10 -370 {lab=Vdiff}
N 10 -310 10 -260 {lab=VSSA}
N 1360 -570 1360 -540 {lab=VDDA_CMFB}
N 840 -570 840 -560 {lab=VDDA_OTA}
N 840 -590 840 -570 {lab=VDDA_OTA}
N 1150 -160 1150 -120 {lab=Vb5}
N 1150 -70 1150 -20 {lab=VSSA}
N 1060 -160 1060 -120 {lab=Vb6}
N 1060 -70 1060 -20 {lab=VSSA}
C {realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/folded_cascode.sym} 860 -340 0 0 {name=x1}
C {realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/cmfb.sym} 1150 -390 0 0 {name=x2}
C {lab_wire.sym} 1360 -350 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 900 -440 0 1 {name=p2 sig_type=std_logic lab=VSSA}
C {capa-2.sym} 970 -390 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 1050 -390 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 970 -310 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1050 -310 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 990 -510 0 1 {name=p17 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 990 -490 0 1 {name=p18 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 1230 -490 0 0 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 1230 -510 0 0 {name=p4 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 840 -680 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 1360 -660 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {vsource.sym} 620 -100 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 620 -160 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 620 -20 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 740 -100 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 740 -160 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 740 -20 0 0 {name=l1 lab=0}
C {vsource.sym} 850 -100 0 0 {name=V5 value=Vb1 savecurrent=false}
C {lab_wire.sym} 850 -160 0 0 {name=p22 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 850 -20 0 0 {name=p23 sig_type=std_logic lab=VSSA}
C {vsource.sym} 950 -100 0 0 {name=V6 value=Vb3 savecurrent=false}
C {lab_wire.sym} 950 -160 0 0 {name=p24 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 950 -20 0 0 {name=p25 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 750 -380 0 0 {name=p9 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 750 -360 0 0 {name=p10 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 750 -340 0 0 {name=p11 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 750 -320 0 0 {name=p19 sig_type=std_logic lab=Vb5}
C {devices/code_shown.sym} 570 -800 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {lab_wire.sym} 1230 -450 0 0 {name=p21 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 1230 -430 0 0 {name=p26 sig_type=std_logic lab=Vb6}
C {lab_wire.sym} 1230 -470 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {vsource.sym} 1310 -100 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 1310 -160 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 1310 -20 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {launcher.sym} 810 -860 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/fc_cmfb_op_tb.raw"}
C {lab_wire.sym} 1480 -470 0 1 {name=p20 sig_type=std_logic lab=Vb4}
C {noconn.sym} 1500 -470 2 0 {name=l3}
C {vcvs.sym} 1120 -620 0 0 {name=E1 value=1}
C {lab_wire.sym} 1120 -540 0 0 {name=p33 sig_type=std_logic lab=VSSA}
C {noconn.sym} 1180 -670 2 0 {name=l4}
C {lab_wire.sym} 1130 -670 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {lab_wire.sym} 670 -530 0 1 {name=p35 sig_type=std_logic lab=Vinp}
C {code.sym} 360 -780 0 0 {name=SPICE only_toplevel=false value=
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

.param sw_stat_global=0
.param sw_stat_mismatch=0

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

* ============================================================
* DC POWER CONSUMPTION
*
* Current sensing:
*
*   Vamm1 -> Folded-cascode OTA
*   Vamm2 -> CMFB
*
* Bias-generation power is not included.
* ============================================================


* ------------------------------------------------------------
* Nominal operating point
* ------------------------------------------------------------

op


* ============================================================
* SUPPLY CURRENTS
*
* Current through voltage sources follows the SPICE sign
* convention. abs() is used so that power consumption is
* reported as a positive value.
* ============================================================

let i_ota  = abs(i(Vamm1))
let i_cmfb = abs(i(Vamm2))

let i_total = i_ota + i_cmfb


* ============================================================
* DC POWER
*
* VDDA = 5 V nominal
* ============================================================

let p_ota  = VDDA * i_ota
let p_cmfb = VDDA * i_cmfb

let p_total = p_ota + p_cmfb


* ============================================================
* UNIT CONVERSION
* ============================================================

let i_ota_uA   = i_ota * 1e6
let i_cmfb_uA  = i_cmfb * 1e6
let i_total_uA = i_total * 1e6

let p_ota_mW   = p_ota * 1e3
let p_cmfb_mW  = p_cmfb * 1e3
let p_total_mW = p_total * 1e3


* ============================================================
* POWER DISTRIBUTION
* ============================================================

let ota_power_percent  = 100 * p_ota  / p_total
let cmfb_power_percent = 100 * p_cmfb / p_total


* ============================================================
* PRINT RESULTS
* ============================================================

echo
echo ==========================================
echo DC POWER CONSUMPTION
echo ==========================================

print i_ota_uA
print i_cmfb_uA
print i_total_uA

print p_ota_mW
print p_cmfb_mW
print p_total_mW

print ota_power_percent
print cmfb_power_percent


* ============================================================
* OPTIONAL SANITY CHECK
*
* Total current drawn from the main VDDA source should be
* approximately equal to:
*
*     I_OTA + I_CMFB
* ============================================================

let i_vdda = abs(i(V1))
let i_vdda_uA = i_vdda * 1e6

print i_vdda_uA


* ============================================================
* SAVE OPERATING POINT
* ============================================================

write fc_cmfb_power_tb.raw

.endc
"}
C {bsource.sym} 10 -110 0 0 {name=Bvinp VAR=V FUNC="\{VCM + V(Vdiff)/2\}" m=1}
C {lab_wire.sym} 10 -190 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 310 -190 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 310 -40 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 10 -40 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 670 -470 0 1 {name=p15 sig_type=std_logic lab=Vinn}
C {bsource.sym} 310 -110 0 0 {name=Bvinn VAR=V FUNC="\{VCM - V(Vdiff)/2\}" m=1}
C {vsource.sym} 10 -340 0 0 {name=Vdiff value=0 savecurrent=false}
C {lab_wire.sym} 10 -260 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 10 -410 0 0 {name=p39 sig_type=std_logic lab=Vdiff}
C {ammeter.sym} 1360 -600 0 0 {name=Vamm2 savecurrent=true spice_ignore=0}
C {ammeter.sym} 840 -620 0 0 {name=Vamm1 savecurrent=true spice_ignore=0}
C {lab_wire.sym} 840 -570 0 1 {name=p40 sig_type=std_logic lab=VDDA_OTA}
C {lab_wire.sym} 1360 -550 0 1 {name=p41 sig_type=std_logic lab=VDDA_CMFB}
C {vsource.sym} 1150 -100 0 0 {name=V8 value=Vb5 savecurrent=false}
C {lab_wire.sym} 1150 -160 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 1150 -20 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {vsource.sym} 1060 -100 0 0 {name=V7 value=Vb6 savecurrent=false}
C {lab_wire.sym} 1060 -20 0 0 {name=p42 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1060 -160 0 0 {name=p43 sig_type=std_logic lab=Vb6}
