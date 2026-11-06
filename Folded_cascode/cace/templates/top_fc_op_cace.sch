v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -60 -150 -60 -110 {lab=Vin}
N -60 -50 -60 0 {lab=VSSA}
N -60 -180 10 -180 {lab=Vin}
N 10 -160 100 -160 {lab=Vin}
N 10 -180 100 -180 {lab=Vin}
N -60 -180 -60 -150 {lab=Vin}
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
N 10 -180 10 -160 {lab=Vin}
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
C {top_fc.sym} 250 -150 0 0 {name=x1}
C {devices/code_shown.sym} 20 -430 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {launcher.sym} 260 -490 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op ../testbenches/simulation/top_fc_op_tb.raw"}
C {vsource.sym} -60 -80 0 0 {name=V2 value=CACE\{vcm\} savecurrent=false}
C {lab_wire.sym} -60 0 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -30 -180 0 0 {name=p14 sig_type=std_logic lab=Vin}
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
C {vsource.sym} -280 130 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} -280 70 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -280 210 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 70 -140 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -130 70 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} -130 210 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} -130 130 0 0 {name=I0 value=1u}
C {lab_wire.sym} 70 -120 0 0 {name=p10 sig_type=std_logic lab=Iref}
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

* Preserve operating point in a separate raw file for device-level inspection.
save all
op
write CACE\{simpath\}/top_fc_op_CACE\{N\}.raw all
let voutp_dc = v(voutp)
let voutn_dc = v(voutn)
let vout_diff_dc = v(voutp)-v(voutn)
let vout_cm_dc = (v(voutp)+v(voutn))/2
print voutp_dc voutn_dc vout_diff_dc vout_cm_dc
echo $&voutp_dc $&voutn_dc $&vout_diff_dc $&vout_cm_dc > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
