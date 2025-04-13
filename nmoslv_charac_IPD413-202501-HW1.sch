v {xschem version=3.4.5 file_version=1.2
}
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

vgs g1 0 dc=0.9
vds d1 0 dc=0.9

.control
save all
*pre_osdi /home/jmarin/Documents/IHP_designs/ihp_design/psp103_nqs.osdi 
*  set color0 = white

save @n.xm1.nsg13_lv_nmos[ids]
save @n.xm1.nsg13_lv_nmos[gm]


dc vgs 0.01 1.8 0.01

let idn = @n.xm1.nsg13_lv_nmos[ids]
let gmn = @n.xm1.nsg13_lv_nmos[gm]
let vthn = @n.xm1.nsg13_lv_nmos[vth]
let vgsn = @n.xm1.nsg13_lv_nmos[vgs]
let vdsatn = @n.xm1.nsg13_lv_nmos[vdss]
let vov1 = v(g1) - vthn
let vov2 = 2*idn/gmn
let gmoverId = gmn/idn

plot idn
*plot idn vs vov1 
*plot idn vs vov2 
*plot vov2
plot gmn
plot xlog gmoverId
*plot idn vs vdsatn

wrdata /home/designer/shared/IPD413_202501/sim_data/data_nmos_idvgs_VDSp9_test.txt idn


let W = 5e-6
*let gmoverId = gmn/idn
setscale gmoverId
plot idn/W
plot vov2





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
C {devices/code_shown.sym} 1140 -110 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
