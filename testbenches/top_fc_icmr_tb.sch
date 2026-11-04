v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 10 -160 100 -160 {lab=Vinn}
N 10 -180 100 -180 {lab=Vinp}
N 210 -260 210 -220 {lab=VDDA}
N 330 -170 360 -170 {lab=voutp}
N 330 -130 360 -130 {lab=voutn}
N 410 -60 410 -10 {lab=VSSA}
N 490 -60 490 -10 {lab=VSSA}
N 360 -130 410 -130 {lab=voutn}
N 410 -130 410 -120 {lab=voutn}
N 360 -170 490 -170 {lab=voutp}
N 490 -170 490 -120 {lab=voutp}
N 70 -140 100 -140 {lab=Balance_Level}
N 70 -120 100 -120 {lab=Iref}
N 210 -80 210 -30 {lab=VSSA}
N -350 -180 -350 -140 {lab=VDDA}
N -350 -80 -350 -30 {lab=VSSA}
N -190 -180 -190 -140 {lab=VSSA}
N -190 -80 -190 -30 {lab=0}
N -330 60 -330 100 {lab=Balance_Level}
N -330 160 -330 210 {lab=VSSA}
N -180 60 -180 100 {lab=Iref}
N -180 160 -180 210 {lab=VSSA}
N -830 60 -830 110 {lab=Vinp}
N -830 170 -830 210 {lab=VSSA}
N -580 60 -580 110 {lab=Vinn}
N -580 170 -580 210 {lab=VSSA}
N -830 -160 -830 -120 {lab=Vcm_node}
N -830 -60 -830 -10 {lab=VSSA}
N -580 -160 -580 -120 {lab=Vdiff}
N -580 -60 -580 -10 {lab=VSSA}
C {realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/top_fc.sym} 250 -150 0 0 {name=x1}
C {devices/code_shown.sym} 20 -430 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {launcher.sym} 260 -490 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/top_fc_op_tb.raw"}
C {lab_wire.sym} 210 -250 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 360 -130 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 360 -170 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 410 -90 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 490 -90 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 410 -10 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 490 -10 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 210 -30 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} -350 -110 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} -350 -170 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} -350 -30 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} -190 -110 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} -190 -170 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} -190 -30 0 0 {name=l1 lab=0}
C {vsource.sym} -330 130 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} -330 70 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -330 210 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 70 -140 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -180 70 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} -180 210 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} -180 130 0 0 {name=I0 value=1u}
C {lab_wire.sym} 70 -120 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} -290 -510 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp 27
.param VDDA = 5
.param Balance_Level = 1.5

.param sw_stat_global=0
.param sw_stat_mismatch=0

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

* ------------------------------------------------------------
* Nominal operating point at VCM = 2.5 V
* ------------------------------------------------------------

alter @Vcm[dc] = 2.5

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
C {bsource.sym} -830 140 0 0 {name=Bvinp VAR=V FUNC="\{V(Vcm_node) + V(Vdiff)/2\}" m=1}
C {lab_wire.sym} -830 60 0 0 {name=p11 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -580 60 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} -580 210 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -830 210 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {bsource.sym} -580 140 0 0 {name=Bvinn VAR=V FUNC="\{V(Vcm_node) - V(Vdiff)/2\}" m=1}
C {vsource.sym} -830 -90 0 0 {name=Vcm value=2.5 savecurrent=false}
C {lab_wire.sym} -830 -10 0 0 {name=p39 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -830 -160 0 0 {name=p40 sig_type=std_logic lab=Vcm_node}
C {vsource.sym} -580 -90 0 0 {name=Vdiff value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} -580 -10 0 0 {name=p41 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -580 -160 0 0 {name=p42 sig_type=std_logic lab=Vdiff}
C {lab_wire.sym} 10 -160 0 0 {name=p14 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 10 -180 0 0 {name=p15 sig_type=std_logic lab=Vinp}
