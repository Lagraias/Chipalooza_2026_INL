v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 500 -380 590 -380 {lab=Vinn}
N 500 -400 590 -400 {lab=Vinp}
N 700 -480 700 -440 {lab=VDDA}
N 820 -390 850 -390 {lab=voutp}
N 820 -350 850 -350 {lab=voutn}
N 900 -280 900 -230 {lab=VSSA}
N 980 -280 980 -230 {lab=VSSA}
N 850 -350 900 -350 {lab=voutn}
N 900 -350 900 -340 {lab=voutn}
N 850 -390 980 -390 {lab=voutp}
N 980 -390 980 -340 {lab=voutp}
N 560 -360 590 -360 {lab=Balance_Level}
N 560 -340 590 -340 {lab=Iref}
N 700 -300 700 -250 {lab=VSSA}
N 140 -400 140 -360 {lab=VDDA}
N 140 -300 140 -250 {lab=VSSA}
N 300 -400 300 -360 {lab=VSSA}
N 300 -300 300 -250 {lab=0}
N 210 -160 210 -120 {lab=Balance_Level}
N 210 -60 210 -10 {lab=VSSA}
N 360 -160 360 -120 {lab=Iref}
N 360 -60 360 -10 {lab=VSSA}
N -500 -190 -500 -140 {lab=Vinp}
N -500 -80 -500 -40 {lab=VSSA}
N -200 -190 -200 -140 {lab=Vinn}
N -200 -80 -200 -40 {lab=VSSA}
N -500 -410 -500 -370 {lab=Vcmd}
N -500 -310 -500 -260 {lab=VSSA}
C {top_fc.sym} 740 -370 0 0 {name=x1}
C {devices/code_shown.sym} 510 -650 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {launcher.sym} 750 -710 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/top_fc_op_tb.raw"}
C {lab_wire.sym} 700 -470 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 850 -350 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 850 -390 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 900 -310 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 980 -310 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 900 -230 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 980 -230 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 700 -250 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} 140 -330 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 140 -390 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 140 -250 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 300 -330 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 300 -390 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 300 -250 0 0 {name=l1 lab=0}
C {vsource.sym} 210 -90 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 210 -150 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 210 -10 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 560 -360 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 360 -150 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 360 -10 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} 360 -90 0 0 {name=I0 value=1u}
C {lab_wire.sym} 560 -340 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 200 -730 0 0 {name=NGSPICE only_toplevel=false value=
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
save v(Vcmd) v(voutp) v(voutn)
tran 10n 45u
let vod = v(voutp)-v(voutn)
let dvod_dt = deriv(vod)

* Reuse nominal testbench definitions and thresholds.
meas tran sr_pos MAX dvod_dt
meas tran sr_neg MIN dvod_dt
let sr_pos_vus = sr_pos*1e-6
let sr_neg_vus = abs(sr_neg)*1e-6
meas tran t_rise_10 WHEN vod=-0.64 RISE=1
meas tran t_rise_90 WHEN vod=0.64 RISE=1
meas tran t_fall_90 WHEN vod=0.64 FALL=1
meas tran t_fall_10 WHEN vod=-0.64 FALL=1
let tr_10_90_s = t_rise_90-t_rise_10
let tf_90_10_s = t_fall_10-t_fall_90
let sr_rise_10_90_vus = (1.28/tr_10_90_s)*1e-6
let sr_fall_90_10_vus = (1.28/tf_90_10_s)*1e-6

print sr_pos_vus sr_neg_vus sr_rise_10_90_vus sr_fall_90_10_vus tr_10_90_s tf_90_10_s
echo $&sr_pos_vus $&sr_neg_vus $&sr_rise_10_90_vus $&sr_fall_90_10_vus $&tr_10_90_s $&tf_90_10_s > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc

"}
C {bsource.sym} -500 -110 0 0 {name=Bvinp VAR=V FUNC="\{VCM + (V(Vcmd)-(V(voutp)-V(voutn)))/2\}" m=1}
C {lab_wire.sym} -500 -190 0 0 {name=p11 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -200 -190 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} -200 -40 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -500 -40 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {bsource.sym} -200 -110 0 0 {name=Bvinn VAR=V FUNC="\{VCM - (V(Vcmd)-(V(voutp)-V(voutn)))/2\}" m=1}
C {vsource.sym} -500 -340 0 0 {name=Vcmd value="PULSE(-0.8 0.8 5u 1n 1n 20u 100u)" savecurrent=false}
C {lab_wire.sym} -500 -260 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -500 -410 0 0 {name=p39 sig_type=std_logic lab=Vcmd}
C {lab_wire.sym} 500 -400 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 500 -380 0 0 {name=p15 sig_type=std_logic lab=Vinn}
