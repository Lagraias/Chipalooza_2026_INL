v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 480 -520 480 -480 {lab=Vin}
N 480 -420 480 -370 {lab=VSSA}
N 1330 -540 1330 -490 {lab=VSSA}
N 810 -580 870 -580 {lab=VSSA}
N 910 -650 1010 -650 {lab=voutn}
N 910 -630 1010 -630 {lab=voutp}
N 940 -650 940 -560 {lab=voutn}
N 1010 -630 1020 -630 {lab=voutp}
N 1020 -630 1020 -560 {lab=voutp}
N 940 -500 940 -450 {lab=VSSA}
N 1020 -500 1020 -450 {lab=VSSA}
N 1200 -650 1230 -650 {lab=voutp}
N 1200 -630 1230 -630 {lab=voutn}
N 810 -740 810 -700 {lab=VDDA}
N 1330 -720 1330 -680 {lab=VDDA}
N 620 -310 620 -270 {lab=VDDA}
N 620 -210 620 -160 {lab=VSSA}
N 710 -310 710 -270 {lab=VSSA}
N 710 -210 710 -160 {lab=0}
N 820 -300 820 -260 {lab=Vb1}
N 820 -210 820 -160 {lab=VSSA}
N 920 -300 920 -260 {lab=Vb3}
N 920 -210 920 -160 {lab=VSSA}
N 720 -540 760 -540 {lab=Vb1}
N 720 -520 760 -520 {lab=Vb1}
N 720 -500 760 -500 {lab=Vb3}
N 720 -480 760 -480 {lab=Vb4}
N 720 -460 760 -460 {lab=Vb5}
N 720 -540 720 -520 {lab=Vb1}
N 1430 -610 1470 -610 {lab=CMFB_out}
N 1200 -590 1230 -590 {lab=Vb1}
N 1200 -570 1230 -570 {lab=Vb6}
N 1200 -610 1230 -610 {lab=Balance_Level}
N 1280 -310 1280 -270 {lab=Balance_Level}
N 1280 -210 1280 -160 {lab=VSSA}
N 1010 -740 1010 -650 {lab=voutn}
N 1010 -740 1050 -740 {lab=voutn}
N 1020 -630 1030 -630 {lab=voutp}
N 1030 -780 1030 -630 {lab=voutp}
N 1030 -780 1050 -780 {lab=voutp}
N 1090 -730 1090 -680 {lab=VSSA}
N 1090 -810 1090 -790 {lab=Vout}
N 1090 -810 1150 -810 {lab=Vout}
N 480 -520 570 -520 {lab=Vin}
N 570 -610 570 -590 {lab=Vin}
N 570 -610 730 -610 {lab=Vin}
N 480 -670 730 -670 {lab=Vin}
N 480 -670 480 -520 {lab=Vin}
N 570 -590 570 -580 {lab=Vin}
N 570 -580 570 -520 {lab=Vin}
N 1590 -610 1630 -610 {lab=Vb4}
N 1470 -610 1520 -610 {lab=CMFB_out}
N 1520 -610 1530 -610 {lab=CMFB_out}
N 1110 -300 1110 -260 {lab=Vb5}
N 1110 -210 1110 -160 {lab=VSSA}
N 1020 -300 1020 -260 {lab=Vb6}
N 1020 -210 1020 -160 {lab=VSSA}
C {/home/juan/realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/folded_cascode.sym} 830 -480 0 0 {name=x1}
C {/home/juan/realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/cmfb.sym} 1120 -530 0 0 {name=x2}
C {vsource.sym} 480 -450 0 0 {name=V2 value=2.5 savecurrent=false}
C {lab_wire.sym} 480 -370 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1330 -490 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 870 -580 0 1 {name=p2 sig_type=std_logic lab=VSSA}
C {capa-2.sym} 940 -530 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 1020 -530 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 940 -450 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1020 -450 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 960 -650 0 1 {name=p17 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 960 -630 0 1 {name=p18 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 1200 -630 0 0 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 1200 -650 0 0 {name=p4 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 810 -730 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 1330 -710 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {vsource.sym} 620 -240 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 620 -300 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 620 -160 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 710 -240 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 710 -300 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 710 -160 0 0 {name=l1 lab=0}
C {vsource.sym} 820 -240 0 0 {name=V5 value=Vb1 savecurrent=false}
C {lab_wire.sym} 820 -300 0 0 {name=p22 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 820 -160 0 0 {name=p23 sig_type=std_logic lab=VSSA}
C {vsource.sym} 920 -240 0 0 {name=V6 value=Vb3 savecurrent=false}
C {lab_wire.sym} 920 -300 0 0 {name=p24 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 920 -160 0 0 {name=p25 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 720 -520 0 0 {name=p9 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 720 -500 0 0 {name=p10 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 720 -480 0 0 {name=p11 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 720 -460 0 0 {name=p19 sig_type=std_logic lab=Vb5}
C {devices/code_shown.sym} 540 -890 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /usr/local/share/OpenPDKs/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"}
C {lab_wire.sym} 1200 -590 0 0 {name=p21 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 1200 -570 0 0 {name=p26 sig_type=std_logic lab=Vb6}
C {lab_wire.sym} 1200 -610 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {vsource.sym} 1280 -240 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 1280 -300 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 1280 -160 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {launcher.sym} 780 -950 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/testbenches/simulation/fc_cmfb_op_tb.raw"}
C {lab_wire.sym} 1440 -610 0 1 {name=p20 sig_type=std_logic lab=CMFB_out}
C {vcvs.sym} 1090 -760 0 0 {name=E1 value=1}
C {lab_wire.sym} 1090 -680 0 0 {name=p33 sig_type=std_logic lab=VSSA}
C {noconn.sym} 1150 -810 2 0 {name=l4}
C {lab_wire.sym} 1100 -810 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {lab_wire.sym} 640 -670 0 1 {name=p35 sig_type=std_logic lab=Vin}
C {code.sym} 310 -920 0 0 {name=SPICE only_toplevel=false value=
"
.temp 27
.param VDDA = 5
.param Balance_Level = 1.3
.param Vb1 = 3.96
.param Vb3 = 3.6
.param Vb5 = 0.72
.param Vb6 = 0.83
.param VD = 0

.control
option sparse
set filetype=ascii
set wr_singlescale
set wr_vecnames
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
save @m.x1.xm5.m0[vdsat]
save @m.x1.xm4.m0[vdsat]

save @m.x2.xm1.m0[id]
save @m.x2.xm1.m0[gm]
save @m.x2.xm1.m0[vgs]
save @m.x2.xm1.m0[vds]
save @m.x2.xm1.m0[vth]
save @m.x2.xm1.m0[gds]

save @m.x2.xm2.m0[id]
save @m.x2.xm2.m0[gm]
save @m.x2.xm2.m0[vgs]
save @m.x2.xm2.m0[vds]
save @m.x2.xm2.m0[vth]
save @m.x2.xm2.m0[gds]

save @m.x2.xm3.m0[id]
save @m.x2.xm3.m0[gm]
save @m.x2.xm3.m0[vgs]
save @m.x2.xm3.m0[vds]
save @m.x2.xm3.m0[vth]
save @m.x2.xm3.m0[gds]

save @m.x2.xm4.m0[id]
save @m.x2.xm4.m0[gm]
save @m.x2.xm4.m0[vgs]
save @m.x2.xm4.m0[vds]
save @m.x2.xm4.m0[vth]
save @m.x2.xm4.m0[gds]

save @m.x2.xm5.m0[id]
save @m.x2.xm5.m0[gm]
save @m.x2.xm5.m0[vgs]
save @m.x2.xm5.m0[vds]
save @m.x2.xm5.m0[vth]
save @m.x2.xm5.m0[gds]

save @m.x2.xm6.m0[id]
save @m.x2.xm6.m0[gm]
save @m.x2.xm6.m0[vgs]
save @m.x2.xm6.m0[vds]
save @m.x2.xm6.m0[vth]
save @m.x2.xm6.m0[gds]

save @m.x2.xm7.m0[id]
save @m.x2.xm7.m0[gm]
save @m.x2.xm7.m0[vgs]
save @m.x2.xm7.m0[vds]
save @m.x2.xm7.m0[vth]
save @m.x2.xm7.m0[gds]

save @m.x2.xm8.m0[id]
save @m.x2.xm8.m0[gm]
save @m.x2.xm8.m0[vgs]
save @m.x2.xm8.m0[vds]
save @m.x2.xm8.m0[vth]
save @m.x2.xm8.m0[gds]

save @m.x2.xm9.m0[id]
save @m.x2.xm9.m0[gm]
save @m.x2.xm9.m0[vgs]
save @m.x2.xm9.m0[vds]
save @m.x2.xm9.m0[vth]
save @m.x2.xm9.m0[gds]

op

write fc_cmfb_stb_op_tb.raw

set appendwrite
ac dec 100 1 1G

* Approximate CMFB loop gain
let loopgain = -v(CMFB_out)/v(Vb4)

* Magnitude and phase in degrees
let lg_db = db(loopgain)
let lg_phase_deg = phase(loopgain)*180/3.141592653589793

* -------------------------------------------------
* First 0-dB crossing
* -------------------------------------------------
meas ac f_ugf1 WHEN lg_db=0 CROSS=1
meas ac phase_ugf1 FIND lg_phase_deg AT=$&f_ugf1

let pm1 = 180 + phase_ugf1

* -------------------------------------------------
* Second 0-dB crossing
* -------------------------------------------------
meas ac f_ugf2 WHEN lg_db=0 CROSS=2
meas ac phase_ugf2 FIND lg_phase_deg AT=$&f_ugf2

* phase() wraps the phase between approximately -180 and +180 deg.
* At the second crossing, convert the positive wrapped phase
* to its continuous negative equivalent.
let phase_ugf2_unwrapped = phase_ugf2 - 360
let pm2 = 180 + phase_ugf2_unwrapped

* -------------------------------------------------
* Results
* -------------------------------------------------
print f_ugf1
print phase_ugf1
print pm1

print f_ugf2
print phase_ugf2
print phase_ugf2_unwrapped
print pm2

write fc_cmfb_stb_tb.raw

plot lg_db
plot lg_phase_deg

.endc
"}
C {vsource.sym} 1560 -610 1 0 {name=V9 value= "dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} 1600 -610 0 1 {name=p36 sig_type=std_logic lab=Vb4}
C {vsource.sym} 1110 -240 0 0 {name=V8 value=Vb5 savecurrent=false}
C {lab_wire.sym} 1110 -300 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 1110 -160 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {vsource.sym} 1020 -240 0 0 {name=V7 value=Vb6 savecurrent=false}
C {lab_wire.sym} 1020 -160 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1020 -300 0 0 {name=p39 sig_type=std_logic lab=Vb6}
