v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 3750 -490 3750 -470 {
lab=GND}
N 3670 -540 3710 -540 {
lab=vg}
N 3670 -590 3670 -540 {
lab=vg}
N 3750 -660 3750 -570 {
lab=vout}
N 3750 -820 3750 -760 {
lab=VDD}
N 3750 -660 3820 -660 {
lab=vout}
N 3750 -540 3790 -540 {
lab=GND}
N 3790 -540 3790 -490 {
lab=GND}
N 3750 -490 3790 -490 {
lab=GND}
N 3750 -700 3750 -660 {
lab=vout}
N 3750 -510 3750 -490 {
lab=GND}
C {devices/code_shown.sym} 3110 -290 0 0 {name=s1 only_toplevel=false value=".option wnflag=1
vsup VDD 0 1.8
vin vg 0 dc=0.933 ac=1

cload vout 0 5p

.control
save all

save @n.xm1.nsg13_lv_nmos[gm]
save @n.xm1.nsg13_lv_nmos[ids]
save @n.xm1.nsg13_lv_nmos[gds]

*dc vin -0.01 0.01 0.001
*dc vin 0.932 0.934 0.001

*let gdsn = @n.xm1.nsg13_lv_nmos[gds]
*let gmn = @n.xm1.nsg13_lv_nmos[gm]
*let vthn = @n.xm1.nsg13_lv_nmos[vth]
*let idn = @n.xm1.nsg13_lv_nmos[ids]
*let ao = gmn / gdsn

*plot deriv(v(vout)) vs v(vout) ao vs v(vout)

ac dec 100 1 1T
plot vdb(vout)

.endc"}
C {devices/gnd.sym} 3750 -470 0 0 {name=l3 lab=GND}
C {devices/iopin.sym} 3670 -590 0 0 {name=p5 lab=vg}
C {devices/isource.sym} 3750 -730 0 0 {name=I1 value=785u}
C {devices/vdd.sym} 3750 -820 0 0 {name=l4 lab=VDD}
C {devices/iopin.sym} 3820 -660 0 0 {name=p6 lab=vout}
C {sg13g2_pr/sg13_lv_nmos.sym} 3730 -540 2 1 {name=M1
l=0.13u
w=4.38u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/code_shown.sym} 3840 -270 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
