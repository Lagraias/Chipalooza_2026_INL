v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 460 -400 550 -400 {lab=Vinn}
N 460 -420 550 -420 {lab=Vinp}
N 660 -500 660 -460 {lab=VDDA}
N 780 -410 810 -410 {lab=voutp}
N 780 -370 810 -370 {lab=voutn}
N 860 -300 860 -250 {lab=VSSA}
N 940 -300 940 -250 {lab=VSSA}
N 810 -370 860 -370 {lab=voutn}
N 860 -370 860 -360 {lab=voutn}
N 810 -410 940 -410 {lab=voutp}
N 940 -410 940 -360 {lab=voutp}
N 520 -380 550 -380 {lab=Balance_Level}
N 520 -360 550 -360 {lab=Iref}
N 660 -320 660 -270 {lab=VSSA}
N 100 -420 100 -380 {lab=VDDA}
N 100 -320 100 -270 {lab=VSSA}
N 260 -420 260 -380 {lab=VSSA}
N 260 -320 260 -270 {lab=0}
N 170 -180 170 -140 {lab=Balance_Level}
N 170 -80 170 -30 {lab=VSSA}
N 320 -180 320 -140 {lab=Iref}
N 320 -80 320 -30 {lab=VSSA}
N -370 -200 -370 -160 {lab=VSSA}
N -370 -200 -280 -200 {lab=VSSA}
N -280 -200 -250 -200 {lab=VSSA}
N -520 -200 -370 -200 {lab=VSSA}
N -520 -280 -520 -260 {lab=Vinp}
N -250 -280 -250 -260 {lab=Vinn}
N -370 -160 -370 -50 {lab=VSSA}
C {top_fc.sym} 700 -390 0 0 {name=x1}
C {devices/code_shown.sym} 470 -670 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {launcher.sym} 710 -730 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/top_fc_op_tb.raw"}
C {lab_wire.sym} 660 -490 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 810 -370 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 810 -410 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 860 -330 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 940 -330 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 860 -250 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 940 -250 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 660 -270 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} 100 -350 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 100 -410 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 100 -270 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 260 -350 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 260 -410 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 260 -270 0 0 {name=l1 lab=0}
C {vsource.sym} 170 -110 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 170 -170 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 170 -30 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 520 -380 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 320 -170 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 320 -30 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} 320 -110 0 0 {name=I0 value=1u}
C {lab_wire.sym} 520 -360 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 160 -750 0 0 {name=NGSPICE only_toplevel=false value=
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
save v(vinp) v(vinn) v(voutp) v(voutn)
tran 10n 50u
let vid = v(vinp)-v(vinn)
let vod = v(voutp)-v(voutn)
let vocm = (v(voutp)+v(voutn))/2

* Nominal testbench only saved waveforms. Add scalar measurements for CACE.
meas tran vid_max MAX vid
meas tran vid_min MIN vid
meas tran vod_max MAX vod
meas tran vod_min MIN vod
meas tran vod_rms RMS vod
meas tran vocm_min MIN vocm
meas tran vocm_max MAX vocm
let vid_pp = vid_max-vid_min
let vod_pp = vod_max-vod_min

print vid_pp vod_pp vod_rms vocm_min vocm_max
echo $&vid_pp $&vod_pp $&vod_rms $&vocm_min $&vocm_max > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc

"}
C {lab_wire.sym} -370 -50 0 0 {name=p11 sig_type=std_logic lab=VSSA}
C {vsource.sym} -250 -230 0 0 {name=V9 value="PULSE(2.499975 2.500025 1u 1n 1n 10u 20u)" savecurrent=false}
C {vsource.sym} -520 -230 0 0 {name=V10 value="PULSE(2.500025 2.499975 1u 1n 1n 10u 20u)" savecurrent=false}
C {lab_wire.sym} -520 -280 0 0 {name=p36 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -250 -280 0 1 {name=p37 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 460 -400 0 0 {name=p14 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 460 -420 0 0 {name=p15 sig_type=std_logic lab=Vinp}
