v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 430 -400 520 -400 {lab=Vinn}
N 430 -420 520 -420 {lab=Vinp}
N 630 -500 630 -460 {lab=VDDA}
N 750 -410 780 -410 {lab=voutp}
N 750 -370 780 -370 {lab=voutn}
N 830 -300 830 -250 {lab=VSSA}
N 910 -300 910 -250 {lab=VSSA}
N 780 -370 830 -370 {lab=voutn}
N 830 -370 830 -360 {lab=voutn}
N 780 -410 910 -410 {lab=voutp}
N 910 -410 910 -360 {lab=voutp}
N 490 -380 520 -380 {lab=Balance_Level}
N 490 -360 520 -360 {lab=Iref}
N 630 -320 630 -270 {lab=VSSA}
N 70 -420 70 -380 {lab=VDDA}
N 70 -320 70 -270 {lab=VSSA}
N 230 -420 230 -380 {lab=VSSA}
N 230 -320 230 -270 {lab=0}
N 140 -180 140 -140 {lab=Balance_Level}
N 140 -80 140 -30 {lab=VSSA}
N 290 -180 290 -140 {lab=Iref}
N 290 -80 290 -30 {lab=VSSA}
N -550 -190 -550 -140 {lab=Vinp}
N -550 -80 -550 -40 {lab=VSSA}
N -250 -190 -250 -140 {lab=Vinn}
N -250 -80 -250 -40 {lab=VSSA}
N -250 -410 -250 -370 {lab=Vdiff}
N -250 -310 -250 -260 {lab=VSSA}
N -420 -410 -420 -370 {lab=Vcmd}
N -420 -310 -420 -260 {lab=VSSA}
C {top_fc.sym} 670 -390 0 0 {name=x1}
C {devices/code_shown.sym} 440 -670 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {lab_wire.sym} 630 -490 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 780 -370 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 780 -410 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 830 -330 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 910 -330 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 830 -250 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 910 -250 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 630 -270 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} 70 -350 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 70 -410 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 70 -270 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 230 -350 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 230 -410 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 230 -270 0 0 {name=l1 lab=0}
C {vsource.sym} 140 -110 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 140 -170 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 140 -30 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 490 -380 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 290 -170 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 290 -30 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} 290 -110 0 0 {name=I0 value=1u}
C {lab_wire.sym} 490 -360 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 130 -750 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp CACE\{temperature\}
.param VDDA = CACE\{vdd\}
.param Balance_Level = CACE\{balance_level\}
.param VCM = CACE\{vcm\}
.param sw_stat_global=0
.param sw_stat_mismatch=0
.include CACE\{DUT_path\}

.control
set noaskquit
set filetype=ascii
set wr_singlescale

* Retain original command sweep and four output device saturation margins.
save all
save @m.x1.x1.xm6.m0[vds]
save @m.x1.x1.xm6.m0[vdsat]
save @m.x1.x1.xm7.m0[vds]
save @m.x1.x1.xm7.m0[vdsat]
save @m.x1.x1.xm8.m0[vds]
save @m.x1.x1.xm8.m0[vdsat]
save @m.x1.x1.xm10.m0[vds]
save @m.x1.x1.xm10.m0[vdsat]

dc Vcmd -4.5 4.5 5m

let vod = v(voutp)-v(voutn)
let vocm = (v(voutp)+v(voutn))/2
let tracking_error = vod-v(Vcmd)
let sat_xm6 = abs(@m.x1.x1.xm6.m0[vds])-abs(@m.x1.x1.xm6.m0[vdsat])
let sat_xm7 = abs(@m.x1.x1.xm7.m0[vds])-abs(@m.x1.x1.xm7.m0[vdsat])
let sat_xm8 = abs(@m.x1.x1.xm8.m0[vds])-abs(@m.x1.x1.xm8.m0[vdsat])
let sat_xm10 = abs(@m.x1.x1.xm10.m0[vds])-abs(@m.x1.x1.xm10.m0[vdsat])

* With wr_singlescale, the sweep command voltage is column one.
* Further columns: voutp voutn vod vocm error sat_xm6 sat_xm7 sat_xm8 sat_xm10.
wrdata CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data v(voutp) v(voutn) vod vocm tracking_error sat_xm6 sat_xm7 sat_xm8 sat_xm10
.endc
"}
C {bsource.sym} -550 -110 0 0 {name=Bvinp VAR=V FUNC="\{VCM + (V(Vcmd)-(V(voutp)-V(voutn)))/2\}" m=1}
C {lab_wire.sym} -550 -190 0 0 {name=p11 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -250 -190 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} -250 -40 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -550 -40 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {bsource.sym} -250 -110 0 0 {name=Bvinn VAR=V FUNC="\{VCM - (V(Vcmd)-(V(voutp)-V(voutn)))/2\}" m=1}
C {vsource.sym} -250 -340 0 0 {name=Vdiff value=0 savecurrent=false}
C {lab_wire.sym} -250 -260 0 0 {name=p41 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -250 -410 0 0 {name=p42 sig_type=std_logic lab=Vdiff}
C {vsource.sym} -420 -340 0 0 {name=Vcmd value=0 savecurrent=false}
C {lab_wire.sym} -420 -260 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -420 -410 0 0 {name=p39 sig_type=std_logic lab=Vcmd}
C {lab_wire.sym} 430 -400 0 0 {name=p14 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 430 -420 0 0 {name=p15 sig_type=std_logic lab=Vinp}
