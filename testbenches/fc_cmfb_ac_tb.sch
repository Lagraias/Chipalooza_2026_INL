v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 1700 -2060 1700 -2020 {lab=Vinp}
N 1700 -1960 1700 -1910 {lab=VSSA}
N 2550 -2080 2550 -2030 {lab=VSSA}
N 2030 -2120 2090 -2120 {lab=VSSA}
N 2130 -2190 2230 -2190 {lab=voutn}
N 2130 -2170 2230 -2170 {lab=voutp}
N 2160 -2190 2160 -2100 {lab=voutn}
N 2230 -2170 2240 -2170 {lab=voutp}
N 2240 -2170 2240 -2100 {lab=voutp}
N 2160 -2040 2160 -1990 {lab=VSSA}
N 2240 -2040 2240 -1990 {lab=VSSA}
N 2420 -2190 2450 -2190 {lab=voutp}
N 2420 -2170 2450 -2170 {lab=voutn}
N 2030 -2280 2030 -2240 {lab=VDDA}
N 2550 -2260 2550 -2220 {lab=VDDA}
N 1840 -1850 1840 -1810 {lab=VDDA}
N 1840 -1750 1840 -1700 {lab=VSSA}
N 1930 -1850 1930 -1810 {lab=VSSA}
N 1930 -1750 1930 -1700 {lab=0}
N 2040 -1840 2040 -1800 {lab=Vb1}
N 2040 -1750 2040 -1700 {lab=VSSA}
N 2140 -1840 2140 -1800 {lab=Vb3}
N 2140 -1750 2140 -1700 {lab=VSSA}
N 1940 -2080 1980 -2080 {lab=Vb1}
N 1940 -2060 1980 -2060 {lab=Vb1}
N 1940 -2040 1980 -2040 {lab=Vb3}
N 1940 -2020 1980 -2020 {lab=Vb4}
N 1940 -2000 1980 -2000 {lab=Vb5}
N 1940 -2080 1940 -2060 {lab=Vb1}
N 2650 -2150 2690 -2150 {lab=Vb4}
N 2420 -2130 2450 -2130 {lab=Vb1}
N 2420 -2110 2450 -2110 {lab=Vb6}
N 2420 -2150 2450 -2150 {lab=Balance_Level}
N 2500 -1850 2500 -1810 {lab=Balance_Level}
N 2500 -1750 2500 -1700 {lab=VSSA}
N 2230 -2280 2230 -2190 {lab=voutn}
N 2230 -2280 2270 -2280 {lab=voutn}
N 2240 -2170 2250 -2170 {lab=voutp}
N 2250 -2320 2250 -2170 {lab=voutp}
N 2250 -2320 2270 -2320 {lab=voutp}
N 2310 -2270 2310 -2220 {lab=VSSA}
N 2310 -2350 2310 -2330 {lab=Vout}
N 2310 -2350 2370 -2350 {lab=Vout}
N 1700 -2060 1790 -2060 {lab=Vinp}
N 1790 -2150 1790 -2130 {lab=Vinn}
N 1790 -2150 1950 -2150 {lab=Vinn}
N 1700 -2210 1950 -2210 {lab=Vinp}
N 1700 -2210 1700 -2060 {lab=Vinp}
N 1790 -2130 1790 -2120 {lab=Vinn}
N 2330 -1840 2330 -1800 {lab=Vb5}
N 2330 -1750 2330 -1700 {lab=VSSA}
N 2240 -1840 2240 -1800 {lab=Vb6}
N 2240 -1750 2240 -1700 {lab=VSSA}
C {realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/folded_cascode.sym} 2050 -2020 0 0 {name=x1}
C {realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/schematic/cmfb.sym} 2340 -2070 0 0 {name=x2}
C {vsource.sym} 1700 -1990 0 0 {name=V2 value=2.5 savecurrent=false}
C {lab_wire.sym} 1700 -1910 0 0 {name=p15 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 2550 -2030 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 2090 -2120 0 1 {name=p2 sig_type=std_logic lab=VSSA}
C {capa-2.sym} 2160 -2070 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 2240 -2070 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 2160 -1990 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 2240 -1990 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 2180 -2190 0 1 {name=p17 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 2180 -2170 0 1 {name=p18 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 2420 -2170 0 0 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 2420 -2190 0 0 {name=p4 sig_type=std_logic lab=voutp}
C {lab_wire.sym} 2030 -2270 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 2550 -2250 0 0 {name=p6 sig_type=std_logic lab=VDDA}
C {vsource.sym} 1840 -1780 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} 1840 -1840 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 1840 -1700 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} 1930 -1780 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 1930 -1840 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} 1930 -1700 0 0 {name=l1 lab=0}
C {vsource.sym} 2040 -1780 0 0 {name=V5 value=Vb1 savecurrent=false}
C {lab_wire.sym} 2040 -1840 0 0 {name=p22 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 2040 -1700 0 0 {name=p23 sig_type=std_logic lab=VSSA}
C {vsource.sym} 2140 -1780 0 0 {name=V6 value=Vb3 savecurrent=false}
C {lab_wire.sym} 2140 -1840 0 0 {name=p24 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 2140 -1700 0 0 {name=p25 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 1940 -2060 0 0 {name=p9 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 1940 -2040 0 0 {name=p10 sig_type=std_logic lab=Vb3}
C {lab_wire.sym} 1940 -2020 0 0 {name=p11 sig_type=std_logic lab=Vb4}
C {lab_wire.sym} 1940 -2000 0 0 {name=p19 sig_type=std_logic lab=Vb5}
C {devices/code_shown.sym} 1760 -2430 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {lab_wire.sym} 2420 -2130 0 0 {name=p21 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} 2420 -2110 0 0 {name=p26 sig_type=std_logic lab=Vb6}
C {lab_wire.sym} 2420 -2150 0 0 {name=p27 sig_type=std_logic lab=Balance_Level}
C {vsource.sym} 2500 -1780 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} 2500 -1840 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} 2500 -1700 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {launcher.sym} 2000 -2490 0 0 {name=launcher1
descr="Load OP"
tclcommand="xschem annotate_op /home/juan/realhome/Documents/gf180/2026_chipalooza/fully_diff_FC/testbenches/simulation/fc_cmfb_op_tb.raw"}
C {lab_wire.sym} 2670 -2150 0 1 {name=p20 sig_type=std_logic lab=Vb4}
C {noconn.sym} 2690 -2150 2 0 {name=l3}
C {vcvs.sym} 2310 -2300 0 0 {name=E1 value=1}
C {lab_wire.sym} 2310 -2220 0 0 {name=p33 sig_type=std_logic lab=VSSA}
C {noconn.sym} 2370 -2350 2 0 {name=l4}
C {lab_wire.sym} 2320 -2350 0 1 {name=p34 sig_type=std_logic lab=Vout}
C {vsource.sym} 1790 -2090 0 0 {name=V9 value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} 1850 -2150 0 1 {name=p14 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 1860 -2210 0 1 {name=p35 sig_type=std_logic lab=Vinp}
C {code.sym} 1550 -2460 0 0 {name=SPICE only_toplevel=false value=
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

set appendwrite
ac dec 100 1 1G

* Differential input/output
let vid = v(vinp) - v(vinn)
let vod = v(voutp) - v(voutn)

* Differential gain
let ad = vod / vid

* Magnitude and phase
let gain_db = db(ad)
let phase_deg = (180/pi)*ph(ad)

* Plots
plot gain_db
plot phase_deg

* DC / low-frequency gain
meas ac gain_dc FIND gain_db AT=1

* Unity-gain frequency
meas ac fu WHEN gain_db=0 CROSS=1

* Phase at unity gain
meas ac phase_fu FIND phase_deg AT=fu

* Phase margin
let pm = 180 + phase_fu

print gain_dc
print fu
print phase_fu
print pm

write fc_cmfb_ac_tb.raw

.endc
"}
C {vsource.sym} 2330 -1780 0 0 {name=V8 value=Vb5 savecurrent=false}
C {lab_wire.sym} 2330 -1840 0 0 {name=p28 sig_type=std_logic lab=Vb5}
C {lab_wire.sym} 2330 -1700 0 0 {name=p29 sig_type=std_logic lab=VSSA}
C {vsource.sym} 2240 -1780 0 0 {name=V7 value=Vb6 savecurrent=false}
C {lab_wire.sym} 2240 -1700 0 0 {name=p32 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 2240 -1840 0 0 {name=p36 sig_type=std_logic lab=Vb6}
