v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 350 -370 350 -330 {lab=Vin}
N 350 -270 350 -220 {lab=VSSA}
N 350 -400 420 -400 {lab=Vin}
N 420 -380 510 -380 {lab=Vin}
N 420 -400 510 -400 {lab=Vin}
N 350 -400 350 -370 {lab=Vin}
N 620 -480 620 -440 {lab=VDDA}
N 740 -390 770 -390 {lab=voutp}
N 740 -350 770 -350 {lab=voutn}
N 820 -280 820 -230 {lab=VSSA}
N 900 -280 900 -230 {lab=VSSA}
N 770 -350 820 -350 {lab=voutn}
N 820 -350 820 -340 {lab=voutn}
N 770 -390 900 -390 {lab=voutp}
N 900 -390 900 -340 {lab=voutp}
N 480 -360 510 -360 {lab=Balance_Level}
N 420 -400 420 -380 {lab=Vin}
N 480 -340 510 -340 {lab=Iref}
N 620 -300 620 -250 {lab=VSSA}
N 60 -400 60 -360 {lab=VDDA}
N 60 -300 60 -250 {lab=VSSA}
N 220 -400 220 -360 {lab=VSSA}
N 220 -300 220 -250 {lab=0}
N 130 -160 130 -120 {lab=Balance_Level}
N 130 -60 130 -10 {lab=VSSA}
N 310 -160 310 -120 {lab=Iref}
N 310 -60 310 -10 {lab=VSSA}
C {top_fc.sym} 660 -370 0 0 {name=x1}
C {devices/code_shown.sym} 430 -650 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {launcher.sym} 670 -710 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/top_fc_op_tb.raw"}
C {vsource.sym} 350 -300 0 0 {name=V2 value=CACE\{vcm\} savecurrent=false}
C {lab_wire.sym} 350 -220 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 380 -400 0 0 {name=p14 sig_type=std_logic lab=Vin}
C {lab_wire.sym} 620 -470 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 770 -350 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 770 -390 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 820 -310 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 900 -310 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 820 -230 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 900 -230 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 620 -250 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} 60 -330 0 0 {name=V1 value="DC VDDA AC 1" savecurrent=false}
C {lab_wire.sym} 60 -390 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 60 -250 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 220 -330 0 0 {name=V3 value="DC 0 AC 0" savecurrent=false}
C {lab_wire.sym} 220 -390 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 220 -250 0 0 {name=l1 lab=0}
C {vsource.sym} 130 -90 0 0 {name=V4 value="DC Balance_Level AC 0" savecurrent=false}
C {lab_wire.sym} 130 -150 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 130 -10 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 480 -360 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 310 -150 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 310 -10 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} 310 -90 0 0 {name=I0 value="DC 1u AC 0"}
C {lab_wire.sym} 480 -340 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 120 -730 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp CACE\{temperature\}
.param VDDA = CACE\{vdd\}
.param Balance_Level = CACE\{balance_level\}
.include CACE\{DUT_path\}

.control
set noaskquit
set filetype=ascii
save v(voutp) v(voutn) v(VDDA) v(VSSA)
ac dec 100 1 1G

* Source magnitude AC = 1 V; calculate supply-to-differential
* and supply-to-common-mode transfer functions.
let vod = v(voutp)-v(voutn)
let vocm = (v(voutp)+v(voutn))/2
let aps_diff = vod/v(VDDA)
let aps_cm = vocm/v(VDDA)
let psrr_diff = -db(aps_diff)
let psrr_cm = -db(aps_cm)
meas ac psrrp_diff_1hz FIND psrr_diff AT=1
meas ac psrrp_diff_1k FIND psrr_diff AT=1k
meas ac psrrp_diff_10k FIND psrr_diff AT=10k
meas ac psrrp_diff_100k FIND psrr_diff AT=100k
meas ac psrrp_diff_1meg FIND psrr_diff AT=1Meg
meas ac psrrp_diff_10meg FIND psrr_diff AT=10Meg
meas ac psrrp_cm_1hz FIND psrr_cm AT=1
meas ac psrrp_cm_1k FIND psrr_cm AT=1k
meas ac psrrp_cm_10k FIND psrr_cm AT=10k
meas ac psrrp_cm_100k FIND psrr_cm AT=100k
meas ac psrrp_cm_1meg FIND psrr_cm AT=1Meg
meas ac psrrp_cm_10meg FIND psrr_cm AT=10Meg

print psrrp_diff_1hz psrrp_diff_1k psrrp_diff_10k psrrp_diff_100k psrrp_diff_1meg psrrp_diff_10meg psrrp_cm_1hz psrrp_cm_1k psrrp_cm_10k psrrp_cm_100k psrrp_cm_1meg psrrp_cm_10meg
echo $&psrrp_diff_1hz $&psrrp_diff_1k $&psrrp_diff_10k $&psrrp_diff_100k $&psrrp_diff_1meg $&psrrp_diff_10meg $&psrrp_cm_1hz $&psrrp_cm_1k $&psrrp_cm_10k $&psrrp_cm_100k $&psrrp_cm_1meg $&psrrp_cm_10meg > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
