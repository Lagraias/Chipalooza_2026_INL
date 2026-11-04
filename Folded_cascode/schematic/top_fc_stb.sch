v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 180 -100 210 -100 {lab=Vb1b}
N 180 -120 210 -120 {lab=Vb1b}
N 740 -150 740 -100 {lab=VSSA}
N 610 -260 640 -260 {lab=voutp}
N 610 -240 640 -240 {lab=voutn}
N 610 -200 640 -200 {lab=Vb1b}
N 610 -180 640 -180 {lab=Vb6b}
N 610 -220 640 -220 {lab=Balance_Level}
N 360 -230 400 -230 {lab=voutn}
N 360 -210 400 -210 {lab=voutp}
N 260 -160 310 -160 {lab=VSSA}
N 180 -80 210 -80 {lab=Vb3}
N 180 -60 210 -60 {lab=Vb4_fc}
N 180 -40 210 -40 {lab=Vb5b}
N 260 -320 260 -280 {lab=VDDA}
N 130 -250 180 -250 {lab=Vinp}
N 130 -190 180 -190 {lab=Vinn}
N -90 -320 -90 -280 {lab=VDDA}
N -90 -130 -90 -80 {lab=VSSA}
N -220 -240 -180 -240 {lab=Iref}
N 0 -250 30 -250 {lab=Vb1b}
N 0 -220 30 -220 {lab=Vb3b}
N 0 -190 30 -190 {lab=Vb5b}
N 400 40 400 70 {lab=Vb3}
N 400 130 400 180 {lab=VSSA}
N 0 -160 30 -160 {lab=Vb6b}
N 890 -220 930 -220 {lab=Vb4_cmfb}
N 740 -360 740 -320 {lab=VDDA}
N 740 -320 740 -290 {lab=VDDA}
N 840 -220 890 -220 {lab=Vb4_cmfb}
C {realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/folded_cascode.sym} 280 -60 0 0 {name=x1}
C {realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/cmfb.sym} 530 -140 0 0 {name=x2}
C {lab_wire.sym} 740 -100 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 610 -240 0 0 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 610 -260 0 0 {name=p4 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 610 -200 0 0 {name=p21 sig_type=std_logic lab=Vb1b}
C {lab_wire.sym} 610 -180 0 0 {name=p26 sig_type=std_logic lab=Vb6b}
C {lab_wire.sym} 610 -220 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 400 -230 0 1 {name=p2 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 400 -210 0 1 {name=p5 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 180 -60 0 0 {name=p7 sig_type=std_logic lab=Vb4_fc}
C {lab_wire.sym} 260 -310 0 0 {name=p8 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 130 -190 0 0 {name=p9 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 130 -250 0 0 {name=p10 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -90 -80 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 310 -160 0 1 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -220 -240 0 0 {name=p14 sig_type=std_logic lab=Iref}
C {lab_wire.sym} 180 -120 0 0 {name=p18 sig_type=std_logic lab=Vb1b}
C {lab_wire.sym} 180 -80 0 0 {name=p19 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 180 -40 0 0 {name=p22 sig_type=std_logic lab=Vb5b}
C {iopin.sym} -360 -410 0 1 {name=p23 lab=Iref}
C {iopin.sym} -360 -460 0 1 {name=p24 lab=VDDA}
C {iopin.sym} -360 -360 0 1 {name=p25 lab=VSSA}
C {ipin.sym} -240 -460 0 0 {name=p28 lab=Vinp}
C {ipin.sym} -240 -430 0 0 {name=p29 lab=Vinn}
C {ipin.sym} 640 -460 0 0 {name=p30 lab=Balance_Level}
C {iopin.sym} 150 -460 0 1 {name=p31 lab=voutp}
C {iopin.sym} 150 -430 0 1 {name=p32 lab=voutn}
C {noconn.sym} 30 -220 2 0 {name=l2}
C {vsource.sym} 400 100 0 0 {name=V1 value="DC 3.6 AC 0" savecurrent=false}
C {lab_wire.sym} 400 40 0 0 {name=p15 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 400 180 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {noconn.sym} 30 -190 2 0 {name=l4}
C {lab_wire.sym} -90 -320 0 0 {name=p11 sig_type=std_logic lab=VDDA}
C {noconn.sym} 30 -250 2 0 {name=l1}
C {lab_wire.sym} 920 -220 0 0 {name=p34 sig_type=std_logic lab=Vb4_cmfb}
C {lab_wire.sym} 20 -250 0 1 {name=p39 sig_type=std_logic lab=Vb1b}
C {lab_wire.sym} 20 -220 0 1 {name=p40 sig_type=std_logic lab=Vb3b}
C {lab_wire.sym} 20 -190 0 1 {name=p41 sig_type=std_logic lab=Vb5b}
C {noconn.sym} 30 -160 2 0 {name=l6}
C {lab_wire.sym} 20 -160 0 1 {name=p42 sig_type=std_logic lab=Vb6b}
C {realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/bias_circuit.sym} -310 -60 0 0 {name=x3}
C {noconn.sym} 930 -220 2 0 {name=l7}
C {lab_wire.sym} 180 -100 0 0 {name=p33 sig_type=std_logic lab=Vb1b}
C {lab_wire.sym} 740 -350 0 0 {name=p46 sig_type=std_logic lab=VDDA}
C {ipin.sym} 150 -400 0 0 {name=p6 lab=Vb4_fc}
C {iopin.sym} 640 -420 0 1 {name=p17 lab=Vb4_cmfb}
