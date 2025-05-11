v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 4160 -540 4160 -530 {
lab=GND}
N 4080 -600 4120 -600 {
lab=vg}
N 4160 -720 4160 -630 {
lab=vout}
N 4160 -880 4160 -820 {
lab=VDD}
N 4160 -720 4230 -720 {
lab=vout}
N 4160 -600 4200 -600 {
lab=GND}
N 4200 -580 4200 -550 {
lab=GND}
N 4160 -550 4200 -550 {
lab=GND}
N 4160 -760 4160 -720 {
lab=vout}
N 4160 -570 4160 -550 {
lab=GND}
N 4080 -650 4080 -600 {
lab=vg}
N 3930 -600 4020 -600 {
lab=#net1}
N 3930 -540 4160 -540 {
lab=GND}
N 4160 -550 4160 -540 {
lab=GND}
N 4420 -720 4420 -660 {
lab=vfb}
N 4370 -720 4420 -720 {
lab=vfb}
N 4420 -600 4420 -580 {
lab=GND}
N 4230 -760 4230 -720 {
lab=vout}
N 4230 -720 4310 -720 {
lab=vout}
N 4200 -580 4420 -580 {
lab=GND}
N 4200 -600 4200 -580 {
lab=GND}
C {devices/code_shown.sym} 3140 -800 0 0 {name=s1 only_toplevel=false value=".option wnflag=1
vsup VDD 0 1.8
vref vref 0 0.9

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

op
print vg
print vout

.endc"}
C {devices/gnd.sym} 4160 -530 0 0 {name=l3 lab=GND}
C {devices/isource.sym} 4160 -790 0 0 {name=I1 value=785u}
C {devices/vdd.sym} 4160 -880 0 0 {name=l4 lab=VDD}
C {devices/iopin.sym} 4230 -760 0 0 {name=p6 lab=vout}
C {sg13g2_pr/sg13_lv_nmos.sym} 4140 -600 2 1 {name=M1
l=0.13u
w=4.4u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/code_shown.sym} 2850 -800 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
C {bsource.sym} 3930 -570 0 0 {name=B1 VAR=V FUNC="0.9*(1+tanh(10000*(v(vfb)-v(vref))))"}
C {vsource.sym} 4050 -600 1 0 {name=V1 value="dc 0 ac 1" savecurrent=false}
C {lab_pin.sym} 4080 -650 0 0 {name=p1 sig_type=std_logic lab=vg}
C {res.sym} 4340 -720 1 0 {name=R1
value=10000000
footprint=1206
device=resistor
m=1}
C {capa.sym} 4420 -630 0 0 {name=C2
m=1
value=10
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 4420 -720 2 0 {name=p5 sig_type=std_logic lab=vfb}
