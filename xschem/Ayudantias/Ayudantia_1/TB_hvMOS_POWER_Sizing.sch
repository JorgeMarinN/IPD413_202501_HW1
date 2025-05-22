v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 -1270 -540 -1270 -480 {}
L 4 -1270 -480 -570 -480 {}
L 4 -570 -550 -570 -480 {}
L 4 -1270 -550 -570 -550 {}
L 4 -1270 -550 -1270 -540 {}
T {l_min_HVnmos = 0.45u; l_min_HVpmos = 0.4u
w_max = 10u; w_min_HVnmos = 0.3u; w_min_HVpmos = 0.3u;} -1250 -540 0 0 0.4 0.4 {}
T {* mult es la multiplicidad, es equivalente 
a poner el mismo transistor en paralelo.
} -540 -540 0 0 0.4 0.4 {}
N -660 -330 -660 -290 {
lab=GND}
N -660 -420 -660 -390 {
lab=Vg_M1}
N -540 -420 -540 -390 {
lab=Vd_M1}
N -540 -330 -540 -290 {
lab=GND}
N -660 -290 -540 -290 {
lab=GND}
N -660 -290 -660 -270 {
lab=GND}
N -540 -290 -430 -290 {
lab=GND}
N -700 -110 -670 -110 {
lab=GND}
N -670 -110 -670 -50 {
lab=GND}
N -700 -50 -670 -50 {
lab=GND}
N -700 -150 -700 -140 {
lab=#net1}
N -700 -230 -700 -210 {
lab=Vd_M2}
N -770 -110 -740 -110 {
lab=Vg_M2}
N -560 -110 -520 -110 {
lab=Vg_M1}
N -480 -80 -480 -40 {
lab=Vd_M1}
N -480 -150 -480 -140 {
lab=#net2}
N -480 -110 -460 -110 {
lab=#net2}
N -460 -150 -460 -110 {
lab=#net2}
N -480 -150 -460 -150 {
lab=#net2}
N -480 -170 -480 -150 {
lab=#net2}
N -750 -290 -660 -290 {
lab=GND}
N -750 -330 -750 -290 {
lab=GND}
N -750 -420 -750 -390 {
lab=Vg_M2}
N -700 -50 -700 -40 {
lab=GND}
N -700 -80 -700 -50 {
lab=GND}
N -430 -330 -430 -290 {
lab=GND}
N -430 -420 -430 -390 {
lab=Vd_M2}
N -320 -330 -320 -290 {
lab=GND}
N -320 -420 -320 -390 {
lab=Vdd}
N -430 -290 -320 -290 {
lab=GND}
C {vsource.sym} -660 -360 0 0 {name=Vg_M1 value=\{Vg_M1\} savecurrent=false}
C {vsource.sym} -540 -360 0 0 {name=Vd_M1 value=0 savecurrent=false}
C {lab_pin.sym} -540 -420 0 0 {name=p1 sig_type=std_logic lab=Vd_M1}
C {lab_pin.sym} -660 -420 0 0 {name=p4 sig_type=std_logic lab=Vg_M1}
C {gnd.sym} -660 -270 0 0 {name=l2 lab=GND}
C {sg13g2_pr/sg13_hv_nmos.sym} -720 -110 2 1 {name=M2
l=\{l_M2\}
w=\{w_M2\}
ng=\{ng_M2\}
m=\{mult_M2\}
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} -700 -40 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -700 -230 0 0 {name=p2 sig_type=std_logic lab=Vd_M2}
C {ammeter.sym} -480 -200 0 0 {name=VdM1 savecurrent=true spice_ignore=0}
C {ngspice_get_value.sym} -780 -170 0 0 {name=r6 
node=Vth_M2
descr="Vth="}
C {lab_pin.sym} -770 -110 0 0 {name=p3 sig_type=std_logic lab=Vg_M2}
C {sg13g2_pr/sg13_hv_pmos.sym} -500 -110 0 0 {name=M1
l=\{l_M1\}
w=\{w_M1\}
ng=\{ng_M1\}
m=\{mult_M1\}
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -480 -40 0 0 {name=p7 sig_type=std_logic lab=Vd_M1}
C {lab_pin.sym} -560 -110 0 0 {name=p8 sig_type=std_logic lab=Vg_M1}
C {lab_pin.sym} -480 -230 0 0 {name=p9 sig_type=std_logic lab=Vdd}
C {ammeter.sym} -700 -180 0 0 {name=VdM2 savecurrent=true spice_ignore=0}
C {vsource.sym} -750 -360 0 0 {name=Vg_M2 value=\{Vg_M2\} savecurrent=false}
C {lab_pin.sym} -750 -420 0 0 {name=p6 sig_type=std_logic lab=Vg_M2}
C {code.sym} -1130 -330 0 0 {name=POWER_MOS_Param only_toplevel=false spice_ignore=0

value="
.param temp=27
.param mult_M1 = 3
.param w_M1 =10u 
.param l_M1 = 0.4u
.param ng_M1 = 1

.param mult_M2 = 1
.param w_M2 =10u 
.param l_M2 =0.45u
.param ng_M2 =1



"}
C {code.sym} -1250 -330 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="

.lib cornerMOShv.lib mos_tt
.lib cornerMOSlv.lib mos_tt
*.lib cornerMOShv.lib mos_ff
*.lib cornerMOSlv.lib mos_ff
*.lib cornerMOShv.lib mos_ss
*.lib cornerMOSlv.lib mos_ss
*.lib cornerMOShv.lib mos_sf
*.lib cornerMOSlv.lib mos_sf
*.lib cornerMOShv.lib mos_fs
*.lib cornerMOSlv.lib mos_fs

*.include /opt/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
*.lib $::SG13G2_MODELS/cornerRES.lib res_typ
*.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
*.lib $::SG13G2_MODELS/diodes.lib
"}
C {devices/code.sym} -1130 -180 0 0 {name=DC_sweep_simulation only_toplevel=false 
value="
.save all

.param Vg_M1 = 0
.param Vg_M2 = 3.3
.csparam V_on = 100m

.control
reset 
run
dc Vd_M2 0 1 0.01 
*dc Vds 0 0.5 0.01 temp 0 27 1
let Vds_M2 = v(Vd_M2) 
let Ids_M2 = i(VdM2)



*let G_M2 = Ids_M2/(Vds_M2+0.01)
let G_M2 = @n.xm2.nsg13_hv_nmos[gds]
let Vth_M2 = @n.xm2.nsg13_hv_nmos[vth]
let Ron_M2 = 1/G_M2
let I_M2 = i(VdM2)
let G_M22 = deriv(I_M2)
let Ron_M22 = 1/G_M22

plot Ron_M2 Ron_M22 vs Vds_M2
plot Ids_M2 vs Vds_M2
*plot Vth_M2 vs Vds_M2

let Vds_on = \{V_on\}

meas dc Ion_M2 FIND Ids_M2 AT=\{Vds_on\}
meas dc RonM2 FIND Ron_M22 AT=\{Vds_on\}
*write TB_hvMOS_POWER_Sizing_IPD413_202501_HW1.raw IM2 RonM2
.endc


.control
reset 
run
dc Vd_M1 2.3 3.3 0.01 
*dc Vd_M1 2 1.8 0.01 temp 0 27 1

let Vsd_M1 = v(Vdd) -v(Vd_M1)
let Isd_M1 = i(VdM1)

let G_M1 = @n.xm1.nsg13_hv_pmos[gds]
let G_M11 = deriv(Isd_M1)
let Ron_M11 = -1/G_M11
*let G_M1 = Isd_M1/Vsd_M1
let Ron_M1 = 1/G_M1
let Vth_M1 = @n.xm1.nsg13_hv_pmos[vth]

plot Isd_M1 vs Vsd_M1
plot Ron_M1 Ron_M11 vs Vsd_M1
*plot Vth_M1 vs Vsd_M1

let Vsd_on = 3.3-\{V_on\}

meas dc Ion_M1 FIND Isd_M1 AT=\{Vsd_on\}
meas dc RonM1 FIND Ron_M11 AT=\{Vsd_on\}


.endc

.control
reset
unset filetype
op
let Vth_M2 = @n.xm2.nsg13_hv_nmos[vth]
let gds_M2 = @n.xm2.nsg13_hv_nmos[gds]
let Vov_M2 = v(Vg_M2) - Vth_M2
let Vth_M1 = @n.xm1.nsg13_hv_pmos[vth]
let gds_M1 = @n.xm1.nsg13_hv_pmos[gds]
let Vov_M1 = v(Vdd)-v(Vg_M1) - Vth_M1
write TB_hvMOS_POWER_Sizing.raw
.endc

.end
"}
C {launcher.sym} -1120 -410 0 0 {name=h1
descr="Annotate OP" 
*tclcommand="set show_hidden_texts 1; xschem annotate_op"
tclcommand="xschem annotate_op"}
C {ngspice_get_value.sym} -780 -140 0 0 {name=r1 node=Vov_M2
descr="Vov="}
C {vsource.sym} -430 -360 0 0 {name=Vd_M2 value=3.3 savecurrent=false}
C {lab_pin.sym} -430 -420 0 0 {name=p10 sig_type=std_logic lab=Vd_M2}
C {vsource.sym} -320 -360 0 0 {name=Vdd value=3.3 savecurrent=false}
C {lab_pin.sym} -320 -420 0 0 {name=p5 sig_type=std_logic lab=Vdd}
C {ngspice_get_value.sym} -420 -180 0 0 {name=r2 
node=Vth_M1
descr="Vth="}
C {ngspice_get_value.sym} -420 -150 0 0 {name=r3 node=Vov_M1
descr="Vov="}
