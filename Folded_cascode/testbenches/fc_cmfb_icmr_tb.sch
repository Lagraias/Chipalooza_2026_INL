v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
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
N -250 -200 -250 -150 {lab=Vinp}
N -250 -90 -250 -50 {lab=VSSA}
N 0 -200 0 -150 {lab=Vinn}
N 0 -90 0 -50 {lab=VSSA}
N 330 -550 420 -550 {lab=Vinp}
N 330 -490 420 -490 {lab=Vinn}
N -250 -420 -250 -380 {lab=Vcm_node}
N -250 -320 -250 -270 {lab=VSSA}
N 0 -420 0 -380 {lab=Vdiff}
N 0 -320 0 -270 {lab=VSSA}
N 790 -180 790 -140 {lab=Vb5}
N 790 -90 790 -40 {lab=VSSA}
N 700 -180 700 -140 {lab=Vb6}
N 700 -90 700 -40 {lab=VSSA}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/folded_cascode.sym} 520 -360 0 0 {name=x1}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/cmfb.sym} 810 -410 0 0 {name=x2}
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
C {vsource.sym} 280 -120 0 0 {name=V1 value=VDDA savecurrent=false}
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
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {lab_wire.sym} 890 -470 0 0 {name=p21 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 890 -450 0 0 {name=p26 sig_type=std_logic lab=Vb6}
C {lab_wire.sym} 890 -490 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {vsource.sym} 970 -120 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 970 -180 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 970 -40 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {launcher.sym} 470 -830 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op simulation/fc_cmfb_op_tb.raw"}
C {lab_wire.sym} 1140 -490 0 1 {name=p20 sig_type=std_logic lab=Vb4}
C {noconn.sym} 1160 -490 2 0 {name=l3}
C {vcvs.sym} 780 -640 0 0 {name=E1 value=1}
C {lab_wire.sym} 780 -560 0 0 {name=p33 sig_type=std_logic lab=VSSA}
C {noconn.sym} 840 -690 2 0 {name=l4}
C {lab_wire.sym} 790 -690 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {lab_wire.sym} 330 -550 0 1 {name=p35 sig_type=std_logic lab=Vinp}
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
* ICMR ANALYSIS
*
* Input definition:
*
*   Vinp = VCM + Vdiff/2
*   Vinn = VCM - Vdiff/2
*
* Vdiff has AC = 1 V.
*
* Therefore:
*
*   Vid(ac) = Vinp - Vinn = 1 V
*
* The common-mode voltage VCM is swept from 0 V to 5 V.
* For every VCM value, the low-frequency differential gain
* is evaluated at 1 Hz.
* ============================================================


* ------------------------------------------------------------
* Nominal operating point at VCM = 2.5 V
* ------------------------------------------------------------

alter @Vcm[dc] = 2.5

op

write fc_cmfb_icmr_op_tb.raw


* ------------------------------------------------------------
* Persistent sweep variables
*
* Variables are stored in the CONST plot so they survive
* the creation of each new AC plot.
* ------------------------------------------------------------

setplot const

let vcm_val  = 0
let vcm_stop = 5
let vcm_step = 0.01


* ------------------------------------------------------------
* Remove previous result file
* ------------------------------------------------------------

shell rm -f icmr_gain.dat


* ============================================================
* COMMON-MODE SWEEP
* ============================================================

while vcm_val <= vcm_stop

    * --------------------------------------------------------
    * Set current common-mode voltage
    * --------------------------------------------------------

    alter @Vcm[dc] = $&vcm_val


    * --------------------------------------------------------
    * Low-frequency differential gain
    *
    * Only one AC point is required because no MEAS AT
    * interpolation is used.
    * --------------------------------------------------------

    ac lin 1 1 1


    * --------------------------------------------------------
    * Differential output
    * --------------------------------------------------------

    let vod = v(voutp)-v(voutn)


    * --------------------------------------------------------
    * Differential gain
    *
    * Vdiff AC amplitude = 1 V
    * --------------------------------------------------------

    let ad = vod/v(Vdiff)


    * --------------------------------------------------------
    * Differential gain in dB
    * --------------------------------------------------------

    let gain_now = db(ad)


    * --------------------------------------------------------
    * Store:
    *
    * column 1 = VCM [V]
    * column 2 = differential gain [dB]
    * --------------------------------------------------------

    echo $&const.vcm_val $&gain_now >> icmr_gain.dat


    * --------------------------------------------------------
    * Return to persistent variables
    * --------------------------------------------------------

    setplot const


    * --------------------------------------------------------
    * Increment common-mode voltage
    * --------------------------------------------------------

    let vcm_val = vcm_val + vcm_step

end


* ------------------------------------------------------------
* Restore nominal common-mode voltage
* ------------------------------------------------------------

alter @Vcm[dc] = 2.5

.endc
"}
C {bsource.sym} -250 -120 0 0 {name=Bvinp VAR=V FUNC="\{V(Vcm_node) + V(Vdiff)/2\}" m=1}
C {lab_wire.sym} -250 -200 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 0 -200 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 0 -50 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -250 -50 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 330 -490 0 1 {name=p15 sig_type=std_logic lab=Vinn}
C {bsource.sym} 0 -120 0 0 {name=Bvinn VAR=V FUNC="\{V(Vcm_node) - V(Vdiff)/2\}" m=1}
C {vsource.sym} -250 -350 0 0 {name=Vcm value=2.5 savecurrent=false}
C {lab_wire.sym} -250 -270 0 0 {name=p39 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -250 -420 0 0 {name=p40 sig_type=std_logic lab=Vcm_node}
C {vsource.sym} 0 -350 0 0 {name=Vdiff value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} 0 -270 0 0 {name=p41 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 0 -420 0 0 {name=p42 sig_type=std_logic lab=Vdiff}
C {vsource.sym} 790 -120 0 0 {name=V8 value=Vb5 savecurrent=false}
C {lab_wire.sym} 790 -180 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 790 -40 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {vsource.sym} 700 -120 0 0 {name=V7 value=Vb6 savecurrent=false}
C {lab_wire.sym} 700 -40 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 700 -180 0 0 {name=p43 sig_type=std_logic lab=Vb6}
