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
C {devices/code_shown.sym} 410 -650 0 0 {name=NGSPICE
only_toplevel=true
value="
.option wnflag = 1 scale=1e-6
.option sparse

vgs g1 0 dc=0.9 ac=1
vds d1 0 dc=0.9
hout io 0 vds 1

.control
save all

set sqrnoise
noise v(io) vgs dec 100 1 100G

setplot noise1
plot 10*log10(onoise_spectrum)

setplot noise2
print onoise_total

.endc
" }
C {devices/ipin.sym} 1090 -360 0 0 {name=p1 lab=g1}
C {devices/iopin.sym} 1330 -530 0 0 {name=p2 lab=d1}
C {devices/gnd.sym} 1180 -230 0 0 {name=l3 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 1160 -360 2 1 {name=M2
l=0.35u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/code_shown.sym} 790 -650 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
