v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {To include mismatch variations, set sw_stat_mismatch=1
To include global variations, set sw_stat_global=1} -800 -820 0 0 0.4 0.4 {}
N -90 -290 -90 -250 {lab=vdiff_node}
N -90 -190 -90 -140 {lab=VSSA}
N 120 -190 120 -150 {lab=VDDA}
N 120 -90 120 -40 {lab=VSSA}
N 210 -190 210 -150 {lab=VSSA}
N 210 -90 210 -40 {lab=0}
N 480 -190 480 -150 {lab=Balance_Level}
N 480 -90 480 -40 {lab=VSSA}
N -350 -520 -350 -470 {lab=Vinp}
N -350 -410 -350 -370 {lab=VSSA}
N -120 -520 -120 -470 {lab=Vinn}
N -120 -410 -120 -370 {lab=VSSA}
N 350 -560 350 -520 {lab=VDDA}
N 470 -470 500 -470 {lab=voutp}
N 470 -430 500 -430 {lab=voutn}
N 550 -360 550 -310 {lab=VSSA}
N 630 -360 630 -310 {lab=VSSA}
N 500 -430 550 -430 {lab=voutn}
N 550 -430 550 -420 {lab=voutn}
N 500 -470 630 -470 {lab=voutp}
N 630 -470 630 -420 {lab=voutp}
N 210 -440 240 -440 {lab=Balance_Level}
N 210 -420 240 -420 {lab=Iref}
N 350 -380 350 -330 {lab=VSSA}
N 180 -480 240 -480 {lab=Vinp}
N 180 -460 240 -460 {lab=Vinn}
N 610 -430 650 -430 {lab=voutn}
N 630 -470 650 -470 {lab=voutp}
N 550 -430 610 -430 {lab=voutn}
N -260 -300 -260 -260 {lab=Iref}
N -260 -200 -260 -150 {lab=VSSA}
C {vsource.sym} -90 -220 0 0 {name=Vdiff value=0 savecurrent=false}
C {lab_wire.sym} -90 -140 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -90 -290 0 0 {name=p14 sig_type=std_logic lab=vdiff_node}
C {vsource.sym} 120 -120 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 120 -180 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 120 -40 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 210 -120 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 210 -180 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 210 -40 0 0 {name=l1 lab=0}
C {devices/code_shown.sym} 40 -770 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"}
C {vsource.sym} 480 -120 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 480 -180 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 480 -40 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {launcher.sym} 280 -830 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/fc_cmfb_op_tb.raw"}
C {code_shown.sym} -810 -690 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp 27

.param VDDA=5
.param Balance_Level=1.3
.param vcm = 2.5

* Monte Carlo mismatch only
.param sw_stat_global=0
.param sw_stat_mismatch=1

.control

let run = 0
let nrun = 250

shell rm -f vos_mc.txt

while run < nrun

    reset

    dc Vdiff -20m 20m 10u

    let vod = v(voutp)-v(voutn)

    meas dc vos WHEN vod=0 CROSS=1

    echo $&vos >> vos_mc.txt

    let run = run + 1

end

.endc
"}
C {bsource.sym} -350 -440 0 0 {name=Bvinp VAR=V FUNC="\{VCM+V(vdiff_node)/2\}" m=1}
C {bsource.sym} -120 -440 0 0 {name=Bvinn VAR=V FUNC="\{VCM-V(vdiff_node)/2\}" m=1}
C {lab_wire.sym} -350 -520 0 0 {name=p33 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -120 -520 0 0 {name=p34 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} -120 -370 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -350 -370 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/top_fc.sym} 390 -450 0 0 {name=x1}
C {lab_wire.sym} 350 -550 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 500 -430 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 500 -470 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 550 -390 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 630 -390 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 550 -310 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 630 -310 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 350 -330 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 210 -440 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 210 -420 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 180 -480 0 0 {name=p6 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 180 -460 0 0 {name=p9 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} -260 -290 0 0 {name=p11 sig_type=std_logic lab=Iref}
C {lab_wire.sym} -260 -150 0 0 {name=p17 sig_type=std_logic lab=VSSA}
C {isource.sym} -260 -230 0 0 {name=I0 value=1u}
