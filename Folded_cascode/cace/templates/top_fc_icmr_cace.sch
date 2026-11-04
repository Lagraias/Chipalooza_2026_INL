v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 10 -160 100 -160 {lab=Vinn}
N 10 -180 100 -180 {lab=Vinp}
N 210 -260 210 -220 {lab=VDDA}
N 330 -170 360 -170 {lab=voutp}
N 330 -130 360 -130 {lab=voutn}
N 410 -60 410 -10 {lab=VSSA}
N 490 -60 490 -10 {lab=VSSA}
N 360 -130 410 -130 {lab=voutn}
N 410 -130 410 -120 {lab=voutn}
N 360 -170 490 -170 {lab=voutp}
N 490 -170 490 -120 {lab=voutp}
N 70 -140 100 -140 {lab=Balance_Level}
N 70 -120 100 -120 {lab=Iref}
N 210 -80 210 -30 {lab=VSSA}
N -350 -180 -350 -140 {lab=VDDA}
N -350 -80 -350 -30 {lab=VSSA}
N -190 -180 -190 -140 {lab=VSSA}
N -190 -80 -190 -30 {lab=0}
N -330 60 -330 100 {lab=Balance_Level}
N -330 160 -330 210 {lab=VSSA}
N -180 60 -180 100 {lab=Iref}
N -180 160 -180 210 {lab=VSSA}
N -830 60 -830 110 {lab=Vinp}
N -830 170 -830 210 {lab=VSSA}
N -580 60 -580 110 {lab=Vinn}
N -580 170 -580 210 {lab=VSSA}
N -830 -160 -830 -120 {lab=Vcm_node}
N -830 -60 -830 -10 {lab=VSSA}
N -580 -160 -580 -120 {lab=Vdiff}
N -580 -60 -580 -10 {lab=VSSA}
C {top_fc.sym} 250 -150 0 0 {name=x1}
C {devices/code_shown.sym} 20 -430 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
"}
C {lab_wire.sym} 210 -250 0 0 {name=p5 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} 360 -130 0 1 {name=p3 sig_type=std_logic lab=voutn}
C {lab_wire.sym} 360 -170 0 1 {name=p4 sig_type=std_logic lab=voutp}
C {capa-2.sym} 410 -90 0 0 {name=C1
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {capa-2.sym} 490 -90 0 0 {name=C2
m=1
value=20p
footprint=1206
device=polarized_capacitor}
C {lab_wire.sym} 410 -10 0 0 {name=p12 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 490 -10 0 0 {name=p13 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 210 -30 0 0 {name=p1 sig_type=std_logic lab=VSSA}
C {vsource.sym} -350 -110 0 0 {name=V1 value=VDDA savecurrent=false}
C {lab_wire.sym} -350 -170 0 0 {name=p7 sig_type=std_logic lab=VDDA}
C {lab_wire.sym} -350 -30 0 0 {name=p8 sig_type=std_logic lab=VSSA}
C {vsource.sym} -190 -110 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} -190 -170 0 0 {name=p16 sig_type=std_logic lab=VSSA}
C {gnd.sym} -190 -30 0 0 {name=l1 lab=0}
C {vsource.sym} -330 130 0 0 {name=V4 value=Balance_Level savecurrent=false}
C {lab_wire.sym} -330 70 0 0 {name=p30 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -330 210 0 0 {name=p31 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} 70 -140 0 0 {name=p2 sig_type=std_logic lab=Balance_Level}
C {lab_wire.sym} -180 70 0 0 {name=p6 sig_type=std_logic lab=Iref}
C {lab_wire.sym} -180 210 0 0 {name=p9 sig_type=std_logic lab=VSSA}
C {isource.sym} -180 130 0 0 {name=I0 value=1u}
C {lab_wire.sym} 70 -120 0 0 {name=p10 sig_type=std_logic lab=Iref}
C {code.sym} -290 -510 0 0 {name=NGSPICE only_toplevel=false value=
"
.temp CACE\{temperature\}
.param VDDA = CACE\{vdd\}
.param Balance_Level = CACE\{balance_level\}

* Same DC operating point and 1 Hz AC gain sweep as top_fc_icmr_tb.sch
* CACE writes two columns per point for its postprocess script.
.include CACE\{DUT_path\}

.control
set noaskquit
set filetype=ascii
set wr_singlescale
set wr_vecnames

setplot const
let vcm_val = 0
let vcm_stop = CACE\{vdd\}
let vcm_step = 0.01

* Each CACE run writes an independent result file.
shell rm -f CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data

while vcm_val <= vcm_stop
    alter @Vcm[dc] = $&vcm_val
    ac lin 1 1 1
    let vod = v(voutp) - v(voutn)
    let ad = vod / v(Vdiff)
    let gain_now = db(ad)
    echo $&const.vcm_val $&gain_now >> CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
    setplot const
    let vcm_val = vcm_val + vcm_step
end

alter @Vcm[dc] = CACE\{vcm\}
.endc
"}
C {bsource.sym} -830 140 0 0 {name=Bvinp VAR=V FUNC="\{V(Vcm_node) + V(Vdiff)/2\}" m=1}
C {lab_wire.sym} -830 60 0 0 {name=p11 sig_type=std_logic lab=Vinp}
C {lab_wire.sym} -580 60 0 0 {name=p36 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} -580 210 0 0 {name=p37 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -830 210 0 1 {name=p38 sig_type=std_logic lab=VSSA}
C {bsource.sym} -580 140 0 0 {name=Bvinn VAR=V FUNC="\{V(Vcm_node) - V(Vdiff)/2\}" m=1}
C {vsource.sym} -830 -90 0 0 {name=Vcm value=CACE\{vcm\} savecurrent=false}
C {lab_wire.sym} -830 -10 0 0 {name=p39 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -830 -160 0 0 {name=p40 sig_type=std_logic lab=Vcm_node}
C {vsource.sym} -580 -90 0 0 {name=Vdiff value="dc 0 ac 1" savecurrent=false}
C {lab_wire.sym} -580 -10 0 0 {name=p41 sig_type=std_logic lab=VSSA}
C {lab_wire.sym} -580 -160 0 0 {name=p42 sig_type=std_logic lab=Vdiff}
C {lab_wire.sym} 10 -160 0 0 {name=p14 sig_type=std_logic lab=Vinn}
C {lab_wire.sym} 10 -180 0 0 {name=p15 sig_type=std_logic lab=Vinp}
