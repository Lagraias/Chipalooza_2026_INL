v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -60 -400 30 -400 {lab=#net1}
N -60 -420 30 -420 {lab=Vinp}
N 140 -500 140 -460 {lab=VDDA}
N 260 -410 290 -410 {lab=voutp}
N 260 -370 290 -370 {lab=voutn}
N 340 -300 340 -250 {lab=VSSA}
N 420 -300 420 -250 {lab=VSSA}
N 290 -370 340 -370 {lab=voutn}
N 340 -370 340 -360 {lab=voutn}
N 290 -410 420 -410 {lab=voutp}
N 420 -410 420 -360 {lab=voutp}
N 0 -380 30 -380 {lab=Balance_Level}
N 0 -360 30 -360 {lab=Iref}
N 140 -320 140 -270 {lab=VSSA}
N -420 -420 -420 -380 {lab=VDDA}
N -420 -320 -420 -270 {lab=VSSA}
N -260 -420 -260 -380 {lab=VSSA}
N -260 -320 -260 -270 {lab=0}
N -350 -180 -350 -140 {lab=Balance_Level}
N -350 -80 -350 -30 {lab=VSSA}
N -200 -180 -200 -140 {lab=Iref}
N -200 -80 -200 -30 {lab=VSSA}
N -900 -180 -900 -130 {lab=Vinp}
N -900 -70 -900 -30 {lab=VSSA}
N -600 -180 -600 -130 {lab=Vinn}
N -600 -70 -600 -30 {lab=VSSA}
N -900 -400 -900 -360 {lab=Vdiff}
N -900 -300 -900 -250 {lab=VSSA}
C {top_fc.sym} 180 -390 0 0 {name=x1}
C {devices/code_shown.sym} -50 -670 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {launcher.sym} 190 -730 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op ../testbenches/simulation/top_fc_op_tb.raw"}
C {lab_wire.sym} 140 -490 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 290 -370 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 290 -410 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 340 -330 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 420 -330 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 340 -250 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 420 -250 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 140 -270 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} -420 -350 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} -420 -410 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} -420 -270 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} -260 -350 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} -260 -410 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} -260 -270 0 0 {name=l1 lab=0}
C {vsource.sym} -350 -110 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} -350 -170 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -350 -30 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 0 -380 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -200 -170 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} -200 -30 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} -200 -110 0 0 {name=I0 value=1u}
C {lab_wire.sym} 0 -360 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 0 0 0 0 {name=NGSPICE only_toplevel=false value=
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
set wr_vecnames

* Output-referred and input-referred integrated noise, 1 Hz to 100 MHz.
noise v(voutp,voutn) Vdiff dec 100 1 100Meg
setplot noise1
wrdata CACE\{simpath\}/noise_spectrum_CACE\{N\}.dat onoise_spectrum inoise_spectrum
setplot noise2
print onoise_total inoise_total
echo $&onoise_total $&inoise_total > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
C {bsource.sym} -900 -100 0 0 {name=Bvinp VAR=V FUNC="\{VCM + V(Vdiff)/2\}" m=1}
C {lab_wire.sym} -900 -180 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -600 -180 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} -600 -30 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -900 -30 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {bsource.sym} -600 -100 0 0 {name=Bvinn VAR=V FUNC="\{VCM - V(Vdiff)/2\}" m=1}
C {vsource.sym} -900 -330 0 0 {name=Vdiff value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} -900 -250 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -900 -400 0 0 {name=p39 sig_type=std_logic lab=Vdiff}
C {lab_wire.sym} -60 -420 0 0 {name=p11 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -60 -400 0 0 {name=p15 sig_type=std_logic lab=Vinn}
