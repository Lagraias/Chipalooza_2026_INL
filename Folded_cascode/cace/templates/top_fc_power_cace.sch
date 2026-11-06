v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 10 -160 100 -160 {lab=Vinn}
N 10 -180 100 -180 {lab=Vinp}
N 160 -350 160 -310 {lab=VDDA}
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
N -280 60 -280 100 {lab=Balance_Level}
N -280 160 -280 210 {lab=VSSA}
N -130 60 -130 100 {lab=Iref}
N -130 160 -130 210 {lab=VSSA}
N -680 70 -680 120 {lab=Vinp}
N -680 180 -680 220 {lab=VSSA}
N -500 70 -500 120 {lab=Vinn}
N -500 180 -500 220 {lab=VSSA}
N -680 -150 -680 -110 {lab=Vdiff}
N -680 -50 -680 0 {lab=VSSA}
N 220 -230 220 -220 {lab=VDDA_OTA}
N 220 -250 220 -230 {lab=VDDA_OTA}
N 280 -250 280 -220 {lab=VDDA_CMFB}
N 160 -250 160 -220 {lab=VDDA_BIAS}
N 220 -350 220 -310 {lab=VDDA}
N 280 -350 280 -310 {lab=VDDA}
C {devices/code_shown.sym} 20 -480 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {launcher.sym} 260 -540 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op ../testbenches/simulation/top_fc_op_tb.raw"}
C {lab_wire.sym} 160 -340 0 0 {name=p5 sig_type=std_logic lab=VDDA}
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
C {vsource.sym} -280 130 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} -280 70 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -280 210 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 70 -140 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -130 70 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} -130 210 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} -130 130 0 0 {name=I0 value=1u}
C {lab_wire.sym} 70 -120 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} -290 -510 0 0 {name=NGSPICE only_toplevel=false value=
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
set wr_vecnames
op

* Ammeter source currents, the convention used in the original testbench.
let i_ota = abs(i(Vamm1))
let i_cmfb = abs(i(Vamm2))
let i_bias = abs(i(Vamm3))
let i_total = i_ota + i_cmfb + i_bias

* Export power in W; CACE formats in mW using YAML unit metadata.
let p_ota = CACE\{vdd\} * i_ota
let p_cmfb = CACE\{vdd\} * i_cmfb
let p_bias = CACE\{vdd\} * i_bias
let p_total = p_ota + p_cmfb + p_bias

* Return readable engineering units for all conditions.
let i_ota_uA = i_ota * 1e6
let i_cmfb_uA = i_cmfb * 1e6
let i_bias_uA = i_bias * 1e6
let i_total_uA = i_total * 1e6

print i_ota_uA i_cmfb_uA i_bias_uA i_total_uA
print p_ota p_cmfb p_bias p_total

echo $&i_ota_uA $&i_cmfb_uA $&i_bias_uA $&i_total_uA $&p_ota $&p_cmfb $&p_bias $&p_total > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
C {bsource.sym} -680 150 0 0 {name=Bvinp VAR=V FUNC="\{VCM + V(Vdiff)/2\}" m=1}
C {lab_wire.sym} -680 70 0 0 {name=p11 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -500 70 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} -500 220 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -680 220 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {bsource.sym} -500 150 0 0 {name=Bvinn VAR=V FUNC="\{VCM - V(Vdiff)/2\}" m=1}
C {vsource.sym} -680 -80 0 0 {name=Vdiff value=0 savecurrent=false}
C {lab_wire.sym} -680 0 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -680 -150 0 0 {name=p39 sig_type=std_logic lab=Vdiff}
C {lab_wire.sym} 10 -180 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 10 -160 0 0 {name=p15 sig_type=std_logic lab=Vinn}
C {top_fc_power.sym} 210 -100 0 0 {name=x1}
C {ammeter.sym} 220 -280 0 0 {name=Vamm1 savecurrent=true spice_ignore=0}
C {lab_wire.sym} 220 -230 0 1 {name=p40 sig_type=std_logic lab=VDDA_OTA}
C {ammeter.sym} 280 -280 0 0 {name=Vamm2 savecurrent=true spice_ignore=0}
C {lab_wire.sym} 280 -230 0 1 {name=p41 sig_type=std_logic lab=VDDA_CMFB}
C {ammeter.sym} 160 -280 0 0 {name=Vamm3 savecurrent=true spice_ignore=0}
C {lab_wire.sym} 160 -230 0 1 {name=p17 sig_type=std_logic lab=VDDA_BIAS}
C {lab_wire.sym} 220 -340 0 0 {name=p18 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 280 -340 0 0 {name=p19 sig_type=std_logic lab=VDDA}
