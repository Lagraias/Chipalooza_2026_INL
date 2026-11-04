v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1110 -490 1110 -450 {lab=VDDA}
N 1230 -400 1260 -400 {lab=voutp}
N 1230 -360 1260 -360 {lab=voutn}
N 1310 -290 1310 -240 {lab=VSSA}
N 1390 -290 1390 -240 {lab=VSSA}
N 1260 -360 1310 -360 {lab=voutn}
N 1310 -360 1310 -350 {lab=voutn}
N 1260 -400 1390 -400 {lab=voutp}
N 1390 -400 1390 -350 {lab=voutp}
N 970 -370 1000 -370 {lab=Balance_Level}
N 970 -350 1000 -350 {lab=Iref}
N 1110 -310 1110 -260 {lab=VSSA}
N 640 -170 640 -130 {lab=VDDA}
N 640 -70 640 -20 {lab=VSSA}
N 800 -170 800 -130 {lab=VSSA}
N 800 -70 800 -20 {lab=0}
N 650 -360 650 -320 {lab=Balance_Level}
N 650 -260 650 -210 {lab=VSSA}
N 800 -360 800 -320 {lab=Iref}
N 800 -260 800 -210 {lab=VSSA}
N 940 -410 1000 -410 {lab=Vinp}
N 940 -390 1000 -390 {lab=Vinn}
N 1370 -360 1410 -360 {lab=voutn}
N 1390 -400 1410 -400 {lab=voutp}
N 1450 -350 1450 -300 {lab=VSSA}
N 1450 -430 1450 -410 {lab=Vout}
N 1450 -430 1510 -430 {lab=Vout}
N 1310 -360 1370 -360 {lab=voutn}
N 110 -170 110 -120 {lab=Vinp}
N 110 -60 110 -20 {lab=VSSA}
N 360 -170 360 -120 {lab=Vinn}
N 360 -60 360 -20 {lab=VSSA}
N 110 -400 110 -360 {lab=Vdiff}
N 110 -300 110 -250 {lab=VSSA}
N 360 -400 360 -360 {lab=Vcmac}
N 360 -300 360 -250 {lab=VSSA}
C {top_fc.sym} 1150 -380 0 0 {name=x1}
C {devices/code_shown.sym} 920 -660 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {lab_wire.sym} 1110 -480 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 1260 -360 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 1260 -400 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 1310 -320 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 1390 -320 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 1310 -240 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1390 -240 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1110 -260 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} 640 -100 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 640 -160 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 640 -20 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 800 -100 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 800 -160 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 800 -20 0 0 {name=l1 lab=0}
C {vsource.sym} 650 -290 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 650 -350 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 650 -210 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 970 -370 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 800 -350 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 800 -210 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} 800 -290 0 0 {name=I0 value=1u}
C {lab_wire.sym} 970 -350 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} 610 -740 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp CACE\{temperature\}
.param VDDA = CACE\{vdd\}
.param Balance_Level = CACE\{balance_level\}
.param VCM = CACE\{vcm\}
.include CACE\{DUT_path\}

.control
set noaskquit
set filetype=ascii
set wr_singlescale
set wr_vecnames

* First AC sweep: differential input AC=1, common-mode AC=0.
alter @Vdiff[acmag] = 1
alter @Vcmac[acmag] = 0
ac dec 100 1 1G
let vod = v(voutp) - v(voutn)
let ad = vod / v(Vdiff)
let ad_db = db(ad)
meas ac ad_1hz FIND ad_db AT=1

* Second AC sweep: differential input AC=0, common-mode AC=1.
alter @Vdiff[acmag] = 0
alter @Vcmac[acmag] = 1
ac dec 100 1 1G
let vod_cm = v(voutp) - v(voutn)
let acm = vod_cm / v(Vcmac)
let acm_db = db(acm)
meas ac acm_1hz FIND acm_db AT=1

* Compare both differential-output responses (ac1 vs ac2).
let cmrr_db = ac1.ad_db - acm_db
meas ac cmrr_1hz FIND cmrr_db AT=1
meas ac cmrr_1k FIND cmrr_db AT=1k
meas ac cmrr_10k FIND cmrr_db AT=10k
meas ac cmrr_100k FIND cmrr_db AT=100k
meas ac cmrr_1meg FIND cmrr_db AT=1Meg
meas ac cmrr_10meg FIND cmrr_db AT=10Meg

let ad_1hz_saved = ac1.ad_1hz
print ad_1hz_saved acm_1hz cmrr_1hz cmrr_1k cmrr_10k cmrr_100k cmrr_1meg cmrr_10meg
echo $&ad_1hz_saved $&acm_1hz $&cmrr_1hz $&cmrr_1k $&cmrr_10k $&cmrr_100k $&cmrr_1meg $&cmrr_10meg > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}
C {lab_wire.sym} 940 -410 0 0 {name=p14 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 940 -390 0 0 {name=p15 sig_type=std_logic lab=Vinn}
C {vcvs.sym} 1450 -380 0 0 {name=E1 value=1}
C {noconn.sym} 1510 -430 2 0 {name=l4}
C {lab_wire.sym} 1460 -430 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {lab_wire.sym} 1450 -300 0 1 {name=p33 sig_type=std_logic lab=VSSA}
C {bsource.sym} 110 -90 0 0 {name=Bvinp VAR=V FUNC="\{VCM+V(Vdiff)/2 + V(Vcmac)\}" m=1}
C {bsource.sym} 360 -90 0 0 {name=Bvinn VAR=V FUNC="\{VCM-V(Vdiff)/2 + V(Vcmac)\}" m=1}
C {lab_wire.sym} 110 -170 0 0 {name=p18 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 360 -170 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 360 -20 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 110 -20 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {vsource.sym} 110 -330 0 0 {name=vdiff value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} 110 -250 0 0 {name=p39 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 110 -400 0 0 {name=p40 sig_type=std_logic lab=Vdiff}
C {vsource.sym} 360 -330 0 0 {name=vcmac value="dc 0 ac 0" savecurrent=false}
C {lab_wire.sym} 360 -250 0 0 {name=p41 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 360 -400 0 0 {name=p42 sig_type=std_logic lab=Vcmac}
