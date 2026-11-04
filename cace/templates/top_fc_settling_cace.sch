v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 430 -380 520 -380 {lab=Vinn}
N 430 -400 520 -400 {lab=Vinp}
N 630 -480 630 -440 {lab=VDDA}
N 750 -390 780 -390 {lab=voutp}
N 750 -350 780 -350 {lab=voutn}
N 830 -280 830 -230 {lab=VSSA}
N 910 -280 910 -230 {lab=VSSA}
N 780 -350 830 -350 {lab=voutn}
N 830 -350 830 -340 {lab=voutn}
N 780 -390 910 -390 {lab=voutp}
N 910 -390 910 -340 {lab=voutp}
N 490 -360 520 -360 {lab=Balance_Level}
N 490 -340 520 -340 {lab=Iref}
N 630 -300 630 -250 {lab=VSSA}
N 70 -400 70 -360 {lab=VDDA}
N 70 -300 70 -250 {lab=VSSA}
N 230 -400 230 -360 {lab=VSSA}
N 230 -300 230 -250 {lab=0}
N 140 -160 140 -120 {lab=Balance_Level}
N 140 -60 140 -10 {lab=VSSA}
N 290 -160 290 -120 {lab=Iref}
N 290 -60 290 -10 {lab=VSSA}
N -490 -160 -490 -110 {lab=Vinp}
N -490 -50 -490 -10 {lab=VSSA}
N -200 -160 -200 -110 {lab=Vinn}
N -200 -50 -200 -10 {lab=VSSA}
N -490 -380 -490 -340 {lab=Vcmd}
N -490 -280 -490 -230 {lab=VSSA}
C {top_fc.sym} 670 -370 0 0 {name=x1}
C {devices/code_shown.sym} 440 -650 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {launcher.sym} 680 -710 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/top_fc_op_tb.raw"}
C {lab_wire.sym} 630 -470 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 780 -350 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 780 -390 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 830 -310 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 910 -310 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 830 -230 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 910 -230 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 630 -250 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} 70 -330 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 70 -390 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 70 -250 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 230 -330 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 230 -390 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 230 -250 0 0 {name=l1 lab=0}
C {vsource.sym} 140 -90 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 140 -150 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 140 -10 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 490 -360 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 290 -150 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 290 -10 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} 290 -90 0 0 {name=I0 value=1u}
C {lab_wire.sym} 490 -340 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 130 -730 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp CACE\{temperature\}
.param VDDA = CACE\{vdd\}
.param Balance_Level = CACE\{balance_level\}
.param VCM = CACE\{vcm\}
.param VD = 0
.param sw_stat_global=0
.param sw_stat_mismatch=0
.include CACE\{DUT_path\}

.control
set noaskquit
set filetype=ascii
set wr_singlescale
save all
tran 1n 45u
let vod = v(voutp)-v(voutn)
let vocm = (v(voutp)+v(voutn))/2
let tracking_error = vod-v(Vcmd)
wrdata CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data v(Vcmd) vod vocm tracking_error
.endc

"}
C {bsource.sym} -490 -80 0 0 {name=Bvinp VAR=V FUNC="\{VCM + (V(Vcmd)-(V(voutp)-V(voutn)))/2\}" m=1}
C {lab_wire.sym} -490 -160 0 0 {name=p11 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -200 -160 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} -200 -10 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -490 -10 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {bsource.sym} -200 -80 0 0 {name=Bvinn VAR=V FUNC="\{VCM - (V(Vcmd)-(V(voutp)-V(voutn)))/2\}" m=1}
C {vsource.sym} -490 -310 0 0 {name=Vcmd value="PULSE(-0.8 0.8 5u 1n 1n 20u 100u)" savecurrent=false}
C {lab_wire.sym} -490 -230 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -490 -380 0 0 {name=p39 sig_type=std_logic lab=Vcmd}
C {lab_wire.sym} 430 -400 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 430 -380 0 0 {name=p15 sig_type=std_logic lab=Vinn}
