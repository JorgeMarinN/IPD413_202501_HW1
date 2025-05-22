v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1090 -360 1140 -360 {
lab=g1}
N 1180 -290 1180 -230 {
lab=GND}
N 1180 -360 1260 -360 {
lab=GND}
N 1260 -360 1260 -290 {
lab=GND}
N 1180 -290 1260 -290 {
lab=GND}
N 1180 -530 1180 -390 {
lab=d1}
N 1180 -530 1330 -530 {
lab=d1}
N 1180 -330 1180 -290 {
lab=GND}
C {devices/code_shown.sym} 210 -650 0 0 {name=NGSPICE
only_toplevel=true
value="

vgs g1 0 dc=0.75
vds d1 0 dc=0.75

.control
save all
*pre_osdi /home/jmarin/Documents/IHP_designs/ihp_design/psp103_nqs.osdi 
pre_osdi /opt/pdks/ihp-sg13g2/libs.tech/ngspice/openvaf/psp103_nqs.osdi 
*  set color0 = white

save @n.xm1.nsg13_lv_nmos[ids]
save @n.xm1.nsg13_lv_nmos[gm]


dc vgs 0.01 1.8 0.01
*dc vds 0.01 1.8 0.01 vgs 0.1 1.8 0.3

let idn = @n.xm1.nsg13_lv_nmos[ids]
let gmn = @n.xm1.nsg13_lv_nmos[gm]
let vthn = @n.xm1.nsg13_lv_nmos[vth]
let vgsn = @n.xm1.nsg13_lv_nmos[vgs]
let vdsatn = @n.xm1.nsg13_lv_nmos[vdss]
let cgg = @n.xm1.nsg13_lv_nmos[cgg]
let cgsol = @n.xm1.nsg13_lv_nmos[cgsol]
let cgdol = @n.xm1.nsg13_lv_nmos[cgdol]
let vov = 2*idn/gmn
let gmoverId = gmn/idn
let cgg_tot = cgg + cgsol + cgdol
let ft = 1e-9*gmn/6.28/cgg_tot
*let idnoverw = idn/W

plot idn
plot ylog idn
plot gmn
plot xlog gmoverId
plot gmoverId

*wrdata /home/designer/shared/IPD413_202501/sim_data/data_nmos_idvgs_VDSp9_test.txt idn
*wrdata /workspaces/usm-vlsi-tools/shared_xserver/simulations/Projects/IHP/IPD413_202501/sim_data/Tarea_1/data_nmos_idvgs_VDSp9_test.txt idn
wrdata data_nmos_idvgs_VDSp9_test.txt idn

*wrdata /home/designer/shared/IPD413_202501/sim_data/data_nmos_idvgs_VDSp9_gmid-ft.txt gmoverId ft
wrdata data_nmos_idvgs_VDSp9_gmid-ft.txt gmoverId ft

let W = 5e-6
setscale gmoverId
plot idn/W
plot vov

.endc
" }
C {devices/ipin.sym} 1090 -360 0 0 {name=p1 lab=g1}
C {devices/iopin.sym} 1330 -530 0 0 {name=p2 lab=d1}
C {devices/gnd.sym} 1180 -230 0 0 {name=l3 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 1160 -360 2 1 {name=M1
l=0.5u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/code_shown.sym} 790 -300 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
