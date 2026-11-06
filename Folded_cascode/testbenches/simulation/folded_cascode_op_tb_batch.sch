v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 610 -210 610 -170 {lab=VDDA}
N 610 -110 610 -60 {lab=VSSA}
N 850 -600 850 -560 {lab=VDDA}
N 850 -440 900 -440 {lab=VSSA}
N 760 -400 800 -400 {lab=Vb2}
N 760 -380 800 -380 {lab=Vb2}
N 760 -360 800 -360 {lab=Vb3}
N 760 -340 800 -340 {lab=Vb4}
N 760 -320 800 -320 {lab=Vb5}
N 710 -530 770 -530 {lab=vinp}
N 580 -440 580 -420 {lab=vinn}
N 580 -420 670 -420 {lab=vinn}
N 670 -470 670 -420 {lab=vinn}
N 670 -470 770 -470 {lab=vinn}
N 540 -530 650 -530 {lab=v_cm}
N 580 -530 580 -500 {lab=v_cm}
N 950 -510 1050 -510 {lab=voutn}
N 950 -490 1050 -490 {lab=voutp}
N 980 -510 980 -420 {lab=voutn}
N 1050 -490 1060 -490 {lab=voutp}
N 1060 -490 1060 -420 {lab=voutp}
N 980 -360 980 -310 {lab=VSSA}
N 1060 -360 1060 -310 {lab=VSSA}
N 470 -530 470 -490 {lab=v_cm}
N 470 -430 470 -380 {lab=VSSA}
N 470 -530 540 -530 {lab=v_cm}
N 700 -210 700 -170 {lab=VSSA}
N 700 -110 700 -60 {lab=0}
N 1060 -490 1090 -490 {lab=voutp}
N 1090 -550 1090 -490 {lab=voutp}
N 1090 -550 1210 -550 {lab=voutp}
N 1050 -510 1210 -510 {lab=voutn}
N 1250 -500 1250 -470 {lab=0}
N 1250 -590 1250 -560 {lab=vout}
N 1250 -590 1300 -590 {lab=vout}
N 910 -200 910 -160 {lab=Vb2}
N 910 -110 910 -60 {lab=VSSA}
N 1010 -200 1010 -160 {lab=Vb3}
N 1010 -110 1010 -60 {lab=VSSA}
N 1110 -200 1110 -160 {lab=Vb4}
N 1110 -110 1110 -60 {lab=VSSA}
N 1210 -200 1210 -160 {lab=Vb5}
N 1210 -110 1210 -60 {lab=VSSA}
N 760 -400 760 -380 {lab=Vb2}
C {/home/juan/realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/folded_cascode.sym} 870 -340 0 0 {name=x1}
C {vsource.sym} 610 -140 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 610 -200 0 0 {name=p1 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 850 -590 0 0 {name=p2 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 610 -60 0 0 {name=p3 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 900 -440 0 1 {name=p4 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 760 -380 0 0 {name=p6 sig_type=std_logic lab=Vb2}
C {lab_wire.sym} 760 -360 0 0 {name=p7 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 760 -340 0 0 {name=p8 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 760 -320 0 0 {name=p9 sig_type=std_logic lab=Vb5}
C {vsource.sym} 680 -530 3 0 {name=Vin1 value=0 savecurrent=false}
C {vsource.sym} 580 -470 0 0 {name=Vin value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} 750 -530 0 0 {name=p10 sig_type=std_logic lab=vinp}
C {lab_wire.sym} 740 -470 0 0 {name=p11 sig_type=std_logic lab=vinn}
C {capa-2.sym} 980 -390 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 1060 -390 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 980 -310 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1060 -310 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {vsource.sym} 470 -460 0 0 {name=V2 value=2.5 savecurrent=false}
C {lab_wire.sym} 470 -380 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 540 -530 0 0 {name=p14 sig_type=std_logic lab=v_cm}
C {vsource.sym} 700 -140 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 700 -200 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 700 -60 0 0 {name=l1 lab=0}
C {lab_wire.sym} 1000 -510 0 1 {name=p17 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 1000 -490 0 1 {name=p18 sig_type=std_logic lab=voutp}
C {vcvs.sym} 1250 -530 0 0 {name=E1 value=1}
C {gnd.sym} 1250 -470 0 0 {name=l2 lab=0}
C {lab_wire.sym} 1260 -590 0 1 {name=p19 sig_type=std_logic lab=vout}
C {code_shown.sym} 10 -870 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp 27
.param VDDA=5
.control
option sparse
set filetype=ascii
save all
save @m.x1.xm1.m0[id]
save @m.x1.xm1.m0[gm]
save @m.x1.xm1.m0[vgs]
save @m.x1.xm1.m0[vds]
save @m.x1.xm1.m0[vth]
save @m.x1.xm1.m0[gds]

save @m.x1.xm2.m0[id]
save @m.x1.xm2.m0[gm]
save @m.x1.xm2.m0[vgs]
save @m.x1.xm2.m0[vds]
save @m.x1.xm2.m0[vth]
save @m.x1.xm2.m0[gds]

save @m.x1.xm9.m0[id]
save @m.x1.xm9.m0[gm]
save @m.x1.xm9.m0[vgs]
save @m.x1.xm9.m0[vds]
save @m.x1.xm9.m0[vth]
save @m.x1.xm9.m0[gds]

save @m.x1.xm8.m0[id]
save @m.x1.xm8.m0[gm]
save @m.x1.xm8.m0[vgs]
save @m.x1.xm8.m0[vds]
save @m.x1.xm8.m0[vth]
save @m.x1.xm8.m0[gds]

save @m.x1.xm6.m0[id]
save @m.x1.xm6.m0[gm]
save @m.x1.xm6.m0[vgs]
save @m.x1.xm6.m0[vds]
save @m.x1.xm6.m0[vth]
save @m.x1.xm6.m0[gds]

save @m.x1.xm5.m0[id]
save @m.x1.xm5.m0[gm]
save @m.x1.xm5.m0[vgs]
save @m.x1.xm5.m0[vds]
save @m.x1.xm5.m0[vth]
save @m.x1.xm5.m0[gds]

op
write folded_cascode_op_tb.raw


*set appendwrite
*ac dec 101 1k 10G
*write folded_cascode_ac_tb.raw
*plot 20*log(vout)

.endc
"}
C {vsource.sym} 910 -140 0 0 {name=V5 value=4.02 savecurrent=false}
C {lab_wire.sym} 910 -200 0 0 {name=p22 sig_type=std_logic lab=Vb2}
C {lab_wire.sym} 910 -60 0 0 {name=p23 sig_type=std_logic lab=VSSA}
C {vsource.sym} 1010 -140 0 0 {name=V6 value=2.3 savecurrent=false}
C {lab_wire.sym} 1010 -200 0 0 {name=p24 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 1010 -60 0 0 {name=p25 sig_type=std_logic lab=VSSA}
C {vsource.sym} 1110 -140 0 0 {name=V7 value=1.3 savecurrent=false}
C {lab_wire.sym} 1110 -200 0 0 {name=p26 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 1110 -60 0 0 {name=p27 sig_type=std_logic lab=VSSA}
C {vsource.sym} 1210 -140 0 0 {name=V8 value=0.78 savecurrent=false}
C {lab_wire.sym} 1210 -200 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 1210 -60 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {noconn.sym} 1300 -590 0 1 {name=l3}
C {devices/code_shown.sym} 530 -830 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"}
C {launcher.sym} 600 -710 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/testbenches/simulation/folded_cascode_op_tb.raw"}
