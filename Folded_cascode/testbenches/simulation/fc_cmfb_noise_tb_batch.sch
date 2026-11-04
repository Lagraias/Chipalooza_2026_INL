v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1370 -400 1370 -350 {lab=VSSA}
N 850 -440 910 -440 {lab=VSSA}
N 950 -510 1050 -510 {lab=voutn}
N 950 -490 1050 -490 {lab=voutp}
N 980 -510 980 -420 {lab=voutn}
N 1050 -490 1060 -490 {lab=voutp}
N 1060 -490 1060 -420 {lab=voutp}
N 980 -360 980 -310 {lab=VSSA}
N 1060 -360 1060 -310 {lab=VSSA}
N 1240 -510 1270 -510 {lab=voutp}
N 1240 -490 1270 -490 {lab=voutn}
N 850 -630 850 -590 {lab=VDDA}
N 1370 -610 1370 -570 {lab=VDDA}
N 630 -170 630 -130 {lab=VDDA}
N 630 -70 630 -20 {lab=VSSA}
N 750 -170 750 -130 {lab=VSSA}
N 750 -70 750 -20 {lab=0}
N 860 -160 860 -120 {lab=Vb1}
N 860 -70 860 -20 {lab=VSSA}
N 960 -160 960 -120 {lab=Vb3}
N 960 -70 960 -20 {lab=VSSA}
N 760 -400 800 -400 {lab=Vb1}
N 760 -380 800 -380 {lab=Vb1}
N 760 -360 800 -360 {lab=Vb3}
N 760 -340 800 -340 {lab=Vb4}
N 760 -320 800 -320 {lab=Vb5}
N 760 -400 760 -380 {lab=Vb1}
N 1470 -470 1510 -470 {lab=Vb4}
N 1240 -450 1270 -450 {lab=Vb1}
N 1240 -430 1270 -430 {lab=Vb5}
N 1240 -470 1270 -470 {lab=Balance_Level}
N 1320 -170 1320 -130 {lab=Balance_Level}
N 1320 -70 1320 -20 {lab=VSSA}
N 1050 -600 1050 -510 {lab=voutn}
N 1050 -600 1090 -600 {lab=voutn}
N 1060 -490 1070 -490 {lab=voutp}
N 1070 -640 1070 -490 {lab=voutp}
N 1070 -640 1090 -640 {lab=voutp}
N 1130 -590 1130 -540 {lab=VSSA}
N 1130 -670 1130 -650 {lab=Vout}
N 1130 -670 1190 -670 {lab=Vout}
N 20 -190 20 -140 {lab=Vinp}
N 20 -80 20 -40 {lab=VSSA}
N 320 -190 320 -140 {lab=Vinn}
N 320 -80 320 -40 {lab=VSSA}
N 680 -530 770 -530 {lab=Vinp}
N 680 -470 770 -470 {lab=Vinn}
N 20 -410 20 -370 {lab=Vdiff}
N 20 -310 20 -260 {lab=VSSA}
N 1370 -570 1370 -540 {lab=VDDA}
N 850 -570 850 -560 {lab=VDDA}
N 850 -590 850 -570 {lab=VDDA}
N 1150 -160 1150 -120 {lab=Vb5}
N 1150 -70 1150 -20 {lab=VSSA}
N 1060 -160 1060 -120 {lab=Vb6}
N 1060 -70 1060 -20 {lab=VSSA}
C {/home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/folded_cascode.sym} 870 -340 0 0 {name=x1}
C {/home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/cmfb.sym} 1160 -390 0 0 {name=x2}
C {lab_wire.sym} 1370 -350 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 910 -440 0 1 {name=p2 sig_type=std_logic lab=VSSA}
C {capa-2.sym} 980 -390 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 1060 -390 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 980 -310 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1060 -310 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1000 -510 0 1 {name=p17 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 1000 -490 0 1 {name=p18 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 1240 -490 0 0 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 1240 -510 0 0 {name=p4 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 850 -620 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 1370 -600 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {vsource.sym} 630 -100 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 630 -160 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 630 -20 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 750 -100 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 750 -160 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 750 -20 0 0 {name=l1 lab=0}
C {vsource.sym} 860 -100 0 0 {name=V5 value=Vb1 savecurrent=false}
C {lab_wire.sym} 860 -160 0 0 {name=p22 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 860 -20 0 0 {name=p23 sig_type=std_logic lab=VSSA}
C {vsource.sym} 960 -100 0 0 {name=V6 value=Vb3 savecurrent=false}
C {lab_wire.sym} 960 -160 0 0 {name=p24 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 960 -20 0 0 {name=p25 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 760 -380 0 0 {name=p9 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 760 -360 0 0 {name=p10 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 760 -340 0 0 {name=p11 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 760 -320 0 0 {name=p19 sig_type=std_logic lab=Vb5}
C {devices/code_shown.sym} 580 -800 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"}
C {lab_wire.sym} 1240 -450 0 0 {name=p21 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 1240 -430 0 0 {name=p26 sig_type=std_logic lab=Vb6}
C {lab_wire.sym} 1240 -470 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {vsource.sym} 1320 -100 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 1320 -160 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 1320 -20 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {launcher.sym} 820 -860 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/fc_cmfb_op_tb.raw"}
C {lab_wire.sym} 1490 -470 0 1 {name=p20 sig_type=std_logic lab=Vb4}
C {noconn.sym} 1510 -470 2 0 {name=l3}
C {vcvs.sym} 1130 -620 0 0 {name=E1 value=1}
C {lab_wire.sym} 1130 -540 0 0 {name=p33 sig_type=std_logic lab=VSSA}
C {noconn.sym} 1190 -670 2 0 {name=l4}
C {lab_wire.sym} 1140 -670 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {lab_wire.sym} 680 -530 0 1 {name=p35 sig_type=std_logic lab=Vinp}
C {code.sym} 370 -780 0 0 {name=SPICE only_toplevel=false value=
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
* NOISE ANALYSIS
*
* Differential output:
*     Vod = Voutp - Voutn
*
* Input reference:
*     Vdiff
*
* Sweep:
*     1 Hz to 100 MHz
* ============================================================


* ------------------------------------------------------------
* Operating point
* ------------------------------------------------------------

op

write fc_cmfb_noise_op_tb.raw


* ------------------------------------------------------------
* Noise analysis
* ------------------------------------------------------------

noise v(voutp,voutn) Vdiff dec 100 1 100Meg


* ============================================================
* NOISE SPECTRAL DENSITY
*
* noise1 contains:
*
*   frequency
*   onoise_spectrum
*   inoise_spectrum
*
* Units:
*
*   onoise_spectrum : V/sqrt(Hz)
*   inoise_spectrum : V/sqrt(Hz)
* ============================================================

setplot noise1

plot onoise_spectrum
plot inoise_spectrum


* ------------------------------------------------------------
* Export spectrum
*
* Columns:
*   frequency
*   onoise_spectrum
*   inoise_spectrum
* ------------------------------------------------------------

wrdata noise_spectrum.dat onoise_spectrum inoise_spectrum


* ------------------------------------------------------------
* Save spectral raw data
* ------------------------------------------------------------

write fc_cmfb_noise_spectrum_tb.raw


* ============================================================
* INTEGRATED NOISE
*
* noise2 contains the integrated noise over the entire
* simulated frequency range.
* ============================================================

setplot noise2

print onoise_total
print inoise_total


.endc
"}
C {bsource.sym} 20 -110 0 0 {name=Bvinp VAR=V FUNC="\{VCM + V(Vdiff)/2\}" m=1}
C {lab_wire.sym} 20 -190 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 320 -190 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 320 -40 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 20 -40 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 680 -470 0 1 {name=p15 sig_type=std_logic lab=Vinn}
C {bsource.sym} 320 -110 0 0 {name=Bvinn VAR=V FUNC="\{VCM - V(Vdiff)/2\}" m=1}
C {vsource.sym} 20 -340 0 0 {name=Vdiff value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} 20 -260 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 20 -410 0 0 {name=p39 sig_type=std_logic lab=Vdiff}
C {vsource.sym} 1150 -100 0 0 {name=V8 value=Vb5 savecurrent=false}
C {lab_wire.sym} 1150 -160 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 1150 -20 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {vsource.sym} 1060 -100 0 0 {name=V7 value=Vb6 savecurrent=false}
C {lab_wire.sym} 1060 -20 0 0 {name=p40 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1060 -160 0 0 {name=p41 sig_type=std_logic lab=Vb6}
