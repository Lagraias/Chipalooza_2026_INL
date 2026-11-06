v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1420 -2010 1420 -1970 {lab=VSSA}
N 2540 -2060 2540 -2010 {lab=VSSA}
N 2020 -2100 2080 -2100 {lab=VSSA}
N 2120 -2170 2220 -2170 {lab=voutn}
N 2120 -2150 2220 -2150 {lab=voutp}
N 2150 -2170 2150 -2080 {lab=voutn}
N 2220 -2150 2230 -2150 {lab=voutp}
N 2230 -2150 2230 -2080 {lab=voutp}
N 2150 -2020 2150 -1970 {lab=VSSA}
N 2230 -2020 2230 -1970 {lab=VSSA}
N 2410 -2170 2440 -2170 {lab=voutp}
N 2410 -2150 2440 -2150 {lab=voutn}
N 2020 -2260 2020 -2220 {lab=VDDA}
N 2540 -2240 2540 -2200 {lab=VDDA}
N 1830 -1830 1830 -1790 {lab=VDDA}
N 1830 -1730 1830 -1680 {lab=VSSA}
N 1920 -1830 1920 -1790 {lab=VSSA}
N 1920 -1730 1920 -1680 {lab=0}
N 2030 -1820 2030 -1780 {lab=Vb1}
N 2030 -1730 2030 -1680 {lab=VSSA}
N 2130 -1820 2130 -1780 {lab=Vb3}
N 2130 -1730 2130 -1680 {lab=VSSA}
N 1930 -2060 1970 -2060 {lab=Vb1}
N 1930 -2040 1970 -2040 {lab=Vb1}
N 1930 -2020 1970 -2020 {lab=Vb3}
N 1930 -2000 1970 -2000 {lab=Vb4}
N 1930 -1980 1970 -1980 {lab=Vb5}
N 1930 -2060 1930 -2040 {lab=Vb1}
N 2640 -2130 2680 -2130 {lab=Vb4}
N 2410 -2110 2440 -2110 {lab=Vb1}
N 2410 -2090 2440 -2090 {lab=Vb5}
N 2410 -2130 2440 -2130 {lab=Balance_Level}
N 2490 -1830 2490 -1790 {lab=Balance_Level}
N 2490 -1730 2490 -1680 {lab=VSSA}
N 2220 -2260 2220 -2170 {lab=voutn}
N 2220 -2260 2260 -2260 {lab=voutn}
N 2230 -2150 2240 -2150 {lab=voutp}
N 2240 -2300 2240 -2150 {lab=voutp}
N 2240 -2300 2260 -2300 {lab=voutp}
N 2300 -2250 2300 -2200 {lab=VSSA}
N 2300 -2330 2300 -2310 {lab=Vout}
N 2300 -2330 2360 -2330 {lab=Vout}
N 1420 -2010 1510 -2010 {lab=VSSA}
N 1510 -2010 1540 -2010 {lab=VSSA}
N 1270 -2010 1420 -2010 {lab=VSSA}
N 1270 -2090 1270 -2070 {lab=Vinp}
N 1900 -2190 1940 -2190 {lab=Vinp}
N 1900 -2130 1940 -2130 {lab=Vinn}
N 1540 -2090 1540 -2070 {lab=Vinn}
N 1420 -1970 1420 -1860 {lab=VSSA}
N 2320 -1820 2320 -1780 {lab=Vb5}
N 2320 -1730 2320 -1680 {lab=VSSA}
N 2230 -1820 2230 -1780 {lab=Vb6}
N 2230 -1730 2230 -1680 {lab=VSSA}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/folded_cascode.sym} 2040 -2000 0 0 {name=x1}
C {realhome/Documents/gf180/2026_chipalooza/Chipalooza_2026_INL/Folded_cascode/schematic/cmfb.sym} 2330 -2050 0 0 {name=x2}
C {lab_wire.sym} 1420 -1860 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 2540 -2010 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 2080 -2100 0 1 {name=p2 sig_type=std_logic lab=VSSA}
C {capa-2.sym} 2150 -2050 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 2230 -2050 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 2150 -1970 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 2230 -1970 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 2170 -2170 0 1 {name=p17 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 2170 -2150 0 1 {name=p18 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 2410 -2150 0 0 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 2410 -2170 0 0 {name=p4 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 2020 -2250 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 2540 -2230 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {vsource.sym} 1830 -1760 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 1830 -1820 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 1830 -1680 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 1920 -1760 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 1920 -1820 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 1920 -1680 0 0 {name=l1 lab=0}
C {vsource.sym} 2030 -1760 0 0 {name=V5 value=Vb1 savecurrent=false}
C {lab_wire.sym} 2030 -1820 0 0 {name=p22 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 2030 -1680 0 0 {name=p23 sig_type=std_logic lab=VSSA}
C {vsource.sym} 2130 -1760 0 0 {name=V6 value=Vb3 savecurrent=false}
C {lab_wire.sym} 2130 -1820 0 0 {name=p24 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 2130 -1680 0 0 {name=p25 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1930 -2040 0 0 {name=p9 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 1930 -2020 0 0 {name=p10 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 1930 -2000 0 0 {name=p11 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 1930 -1980 0 0 {name=p19 sig_type=std_logic lab=Vb5}
C {devices/code_shown.sym} 1750 -2410 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {lab_wire.sym} 2410 -2110 0 0 {name=p21 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 2410 -2090 0 0 {name=p26 sig_type=std_logic lab=Vb6}
C {lab_wire.sym} 2410 -2130 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {vsource.sym} 2490 -1760 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 2490 -1820 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 2490 -1680 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {code_shown.sym} 80 -3160 0 0 {name=NGSPICE only_toplevel=false value=
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

write fc_cmfb_op_tb.raw

tran 10n 50u


let vid  = v(vinp)-v(vinn)
let vod  = v(voutp)-v(voutn)
let vocm = (v(voutp)+v(voutn))/2

plot vid
plot vod
plot vocm
plot v(vb4)


write folded_cascode_tran_tb.raw

.endc
"}
C {launcher.sym} 1990 -2470 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op simulation/fc_cmfb_op_tb.raw"}
C {lab_wire.sym} 2660 -2130 0 1 {name=p20 sig_type=std_logic lab=Vb4}
C {noconn.sym} 2680 -2130 2 0 {name=l3}
C {vcvs.sym} 2300 -2280 0 0 {name=E1 value=1}
C {lab_wire.sym} 2300 -2200 0 0 {name=p33 sig_type=std_logic lab=VSSA}
C {noconn.sym} 2360 -2330 2 0 {name=l4}
C {lab_wire.sym} 2310 -2330 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {vsource.sym} 1540 -2040 0 0 {name=V9 value="PULSE(2.499975 2.500025 1u 1n 1n 10u 20u)" savecurrent=false}
C {lab_wire.sym} 1900 -2130 0 0 {name=p14 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 1900 -2190 0 0 {name=p35 sig_type=std_logic lab=Vinp}
C {vsource.sym} 1270 -2040 0 0 {name=V10 value="PULSE(2.500025 2.499975 1u 1n 1n 10u 20u)" savecurrent=false}
C {lab_wire.sym} 1270 -2090 0 0 {name=p36 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} 1540 -2090 0 1 {name=p37 sig_type=std_logic lab=Vinn}
C {vsource.sym} 2320 -1760 0 0 {name=V8 value=Vb5 savecurrent=false}
C {lab_wire.sym} 2320 -1820 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 2320 -1680 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {vsource.sym} 2230 -1760 0 0 {name=V7 value=Vb6 savecurrent=false}
C {lab_wire.sym} 2230 -1680 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 2230 -1820 0 0 {name=p38 sig_type=std_logic lab=Vb6}
