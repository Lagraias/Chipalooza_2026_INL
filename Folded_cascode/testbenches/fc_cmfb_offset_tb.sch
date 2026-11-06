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
N 140 -490 230 -490 {lab=Vinn}
N 140 -550 230 -550 {lab=Vinp}
N 830 -420 830 -370 {lab=VSSA}
N 310 -460 370 -460 {lab=VSSA}
N 410 -530 510 -530 {lab=voutn}
N 410 -510 510 -510 {lab=voutp}
N 440 -530 440 -440 {lab=voutn}
N 510 -510 520 -510 {lab=voutp}
N 520 -510 520 -440 {lab=voutp}
N 440 -380 440 -330 {lab=VSSA}
N 520 -380 520 -330 {lab=VSSA}
N 700 -530 730 -530 {lab=voutp}
N 700 -510 730 -510 {lab=voutn}
N 310 -620 310 -580 {lab=VDDA}
N 830 -600 830 -560 {lab=VDDA}
N 120 -190 120 -150 {lab=VDDA}
N 120 -90 120 -40 {lab=VSSA}
N 210 -190 210 -150 {lab=VSSA}
N 210 -90 210 -40 {lab=0}
N 320 -180 320 -140 {lab=Vb1}
N 320 -90 320 -40 {lab=VSSA}
N 420 -180 420 -140 {lab=Vb3}
N 420 -90 420 -40 {lab=VSSA}
N 220 -420 260 -420 {lab=Vb1}
N 220 -400 260 -400 {lab=Vb1}
N 220 -380 260 -380 {lab=Vb3}
N 220 -360 260 -360 {lab=Vb4}
N 220 -340 260 -340 {lab=Vb5}
N 220 -420 220 -400 {lab=Vb1}
N 930 -490 970 -490 {lab=Vb4}
N 700 -470 730 -470 {lab=Vb1}
N 700 -450 730 -450 {lab=Vb6}
N 700 -490 730 -490 {lab=Balance_Level}
N 780 -190 780 -150 {lab=Balance_Level}
N 780 -90 780 -40 {lab=VSSA}
N -350 -520 -350 -470 {lab=Vinp}
N -350 -410 -350 -370 {lab=VSSA}
N -120 -520 -120 -470 {lab=Vinn}
N -120 -410 -120 -370 {lab=VSSA}
N 620 -180 620 -140 {lab=Vb5}
N 620 -90 620 -40 {lab=VSSA}
N 530 -180 530 -140 {lab=Vb6}
N 530 -90 530 -40 {lab=VSSA}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/folded_cascode.sym} 330 -360 0 0 {name=x1}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/cmfb.sym} 620 -410 0 0 {name=x2}
C {vsource.sym} -90 -220 0 0 {name=Vdiff value=0 savecurrent=false}
C {lab_wire.sym} -90 -140 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -90 -290 0 0 {name=p14 sig_type=std_logic lab=vdiff_node}
C {lab_wire.sym} 830 -370 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 370 -460 0 1 {name=p2 sig_type=std_logic lab=VSSA}
C {capa-2.sym} 440 -410 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 520 -410 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 440 -330 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 520 -330 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 460 -530 0 1 {name=p17 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 460 -510 0 1 {name=p18 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 700 -510 0 0 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 700 -530 0 0 {name=p4 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 310 -610 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 830 -590 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {vsource.sym} 120 -120 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 120 -180 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 120 -40 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 210 -120 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 210 -180 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 210 -40 0 0 {name=l1 lab=0}
C {vsource.sym} 320 -120 0 0 {name=V5 value=Vb1 savecurrent=false}
C {lab_wire.sym} 320 -180 0 0 {name=p22 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 320 -40 0 0 {name=p23 sig_type=std_logic lab=VSSA}
C {vsource.sym} 420 -120 0 0 {name=V6 value=Vb3 savecurrent=false}
C {lab_wire.sym} 420 -180 0 0 {name=p24 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 420 -40 0 0 {name=p25 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 220 -400 0 0 {name=p9 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 220 -380 0 0 {name=p10 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 220 -360 0 0 {name=p11 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 220 -340 0 0 {name=p19 sig_type=std_logic lab=Vb5}
C {devices/code_shown.sym} 40 -770 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"}
C {lab_wire.sym} 700 -470 0 0 {name=p21 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 700 -450 0 0 {name=p26 sig_type=std_logic lab=Vb6}
C {lab_wire.sym} 700 -490 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {vsource.sym} 780 -120 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 780 -180 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 780 -40 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {launcher.sym} 280 -830 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op simulation/fc_cmfb_op_tb.raw"}
C {lab_wire.sym} 950 -490 0 1 {name=p20 sig_type=std_logic lab=Vb4}
C {noconn.sym} 970 -490 2 0 {name=l3}
C {lab_wire.sym} 150 -550 0 0 {name=p35 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 150 -490 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {code_shown.sym} -810 -690 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp 27

.param VDDA=5
.param Balance_Level=1.3
.param Vb1 = 3.96
.param Vb3 = 3.6
.param Vb5 = 0.72
.param Vb6 = 0.83
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
C {vsource.sym} 620 -120 0 0 {name=V8 value=Vb5 savecurrent=false}
C {lab_wire.sym} 620 -180 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 620 -40 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {vsource.sym} 530 -120 0 0 {name=V7 value=Vb6 savecurrent=false}
C {lab_wire.sym} 530 -40 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 530 -180 0 0 {name=p39 sig_type=std_logic lab=Vb6}
