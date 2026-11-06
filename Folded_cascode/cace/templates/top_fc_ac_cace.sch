v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 750 -480 750 -440 {lab=VDDA}
N 870 -390 900 -390 {lab=voutp}
N 870 -350 900 -350 {lab=voutn}
N 950 -280 950 -230 {lab=VSSA}
N 1030 -280 1030 -230 {lab=VSSA}
N 900 -350 950 -350 {lab=voutn}
N 950 -350 950 -340 {lab=voutn}
N 900 -390 1030 -390 {lab=voutp}
N 1030 -390 1030 -340 {lab=voutp}
N 610 -360 640 -360 {lab=Balance_Level}
N 610 -340 640 -340 {lab=Iref}
N 750 -300 750 -250 {lab=VSSA}
N -200 -180 -200 -140 {lab=VDDA}
N -200 -80 -200 -30 {lab=VSSA}
N -40 -180 -40 -140 {lab=VSSA}
N -40 -80 -40 -30 {lab=0}
N -190 -370 -190 -330 {lab=Balance_Level}
N -190 -270 -190 -220 {lab=VSSA}
N -40 -370 -40 -330 {lab=Iref}
N -40 -270 -40 -220 {lab=VSSA}
N 160 -190 160 -150 {lab=Vinp}
N 160 -90 160 -40 {lab=VSSA}
N 160 -190 250 -190 {lab=Vinp}
N 250 -280 250 -260 {lab=Vinn}
N 250 -280 410 -280 {lab=Vinn}
N 160 -340 410 -340 {lab=Vinp}
N 160 -340 160 -190 {lab=Vinp}
N 250 -260 250 -250 {lab=Vinn}
N 580 -400 640 -400 {lab=Vinp}
N 580 -380 640 -380 {lab=Vinn}
N 1010 -350 1050 -350 {lab=voutn}
N 1030 -390 1050 -390 {lab=voutp}
N 1090 -340 1090 -290 {lab=VSSA}
N 1090 -420 1090 -400 {lab=Vout}
N 1090 -420 1150 -420 {lab=Vout}
N 950 -350 1010 -350 {lab=voutn}
C {top_fc.sym} 790 -370 0 0 {name=x1}
C {devices/code_shown.sym} 560 -650 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {launcher.sym} 800 -710 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op ../testbenches/simulation/top_fc_op_tb.raw"}
C {lab_wire.sym} 750 -470 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 900 -350 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 900 -390 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 950 -310 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 1030 -310 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 950 -230 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1030 -230 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 750 -250 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} -200 -110 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} -200 -170 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} -200 -30 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} -40 -110 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} -40 -170 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} -40 -30 0 0 {name=l1 lab=0}
C {vsource.sym} -190 -300 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} -190 -360 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -190 -220 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 610 -360 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -40 -360 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} -40 -220 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} -40 -300 0 0 {name=I0 value=1u}
C {lab_wire.sym} 610 -340 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 250 -730 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp CACE\{temperature\}
.param VDDA = CACE\{vdd\}
.param Balance_Level = CACE\{balance_level\}

* Use the DUT subcircuit generated or selected by CACE.
.include CACE\{DUT_path\}

.control
set noaskquit
set filetype=ascii
set wr_singlescale
set wr_vecnames
save v(vinp) v(vinn) v(voutp) v(voutn)

ac dec 100 1 1G

let vid = v(vinp) - v(vinn)
let vod = v(voutp) - v(voutn)
let ad = vod / vid
let gain_db = db(ad)
let phase_deg = (180/pi)*ph(ad)

meas ac gain_dc FIND gain_db AT=1
meas ac fu WHEN gain_db=0 CROSS=1
meas ac phase_fu FIND phase_deg AT=fu
let pm = 180 + phase_fu

print gain_dc fu phase_fu pm

* Each CACE run has its own output filename.
echo $&gain_dc $&fu $&pm > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
C {vsource.sym} 160 -120 0 0 {name=V5 value=CACE\{vcm\} savecurrent=false}
C {lab_wire.sym} 160 -40 0 0 {name=p11 sig_type=std_logic lab=VSSA}
C {vsource.sym} 250 -220 0 0 {name=V9 value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} 310 -280 0 1 {name=p17 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 320 -340 0 1 {name=p35 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 580 -400 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 580 -380 0 0 {name=p15 sig_type=std_logic lab=Vinn}
C {vcvs.sym} 1090 -370 0 0 {name=E1 value=1}
C {noconn.sym} 1150 -420 2 0 {name=l4}
C {lab_wire.sym} 1100 -420 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {lab_wire.sym} 1090 -290 0 1 {name=p33 sig_type=std_logic lab=VSSA}
