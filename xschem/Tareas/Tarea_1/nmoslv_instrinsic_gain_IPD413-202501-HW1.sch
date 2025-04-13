v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 3300 -480 3300 -470 {
lab=GND}
N 3220 -540 3260 -540 {
lab=g1}
N 3220 -480 3300 -480 {
lab=GND}
N 3100 -490 3180 -490 {
lab=ref}
N 3120 -530 3180 -530 {
lab=d1}
N 3120 -620 3120 -530 {
lab=d1}
N 3300 -620 3300 -570 {
lab=d1}
N 3120 -620 3300 -620 {
lab=d1}
N 3220 -590 3220 -540 {
lab=g1}
N 3300 -660 3300 -620 {
lab=d1}
N 3300 -820 3300 -760 {
lab=VDD}
N 3300 -660 3370 -660 {
lab=d1}
N 3300 -540 3340 -540 {
lab=GND}
N 3340 -540 3340 -490 {
lab=GND}
N 3300 -490 3340 -490 {
lab=GND}
N 3300 -490 3300 -480 {
lab=GND}
N 3300 -700 3300 -660 {
lab=d1}
N 3300 -510 3300 -490 {
lab=GND}
C {devices/gnd.sym} 3300 -470 0 0 {name=l1 lab=GND}
C {devices/vcvs.sym} 3220 -510 0 0 {name=E1 value=1000}
C {devices/ipin.sym} 3100 -490 0 0 {name=p1 lab=ref}
C {devices/iopin.sym} 3220 -590 0 0 {name=p2 lab=g1}
C {devices/isource.sym} 3300 -730 0 0 {name=I0 value=1m}
C {devices/vdd.sym} 3300 -820 0 0 {name=l2 lab=VDD}
C {devices/iopin.sym} 3370 -660 0 0 {name=p3 lab=d1}
C {devices/code_shown.sym} 3480 -770 0 0 {name=s1 only_toplevel=false value=".option wnflag=1
vds ref 0 0.9
vsup VDD 0 1.8

.control
save all

dc vds 0.2 1.8 0.01
plot abs(1/deriv(v(g1)))
*wrdata /home/designer/shared/IPD413_202501_HW1/sim_data/data_nmos_intrinsic_gain_Lp15.dat abs(1/deriv(v(g1)))
wrdata /workspaces/usm-vlsi-tools/shared_xserver/simulations/Projects/IHP/IPD413_2025/sim_data/Tarea_1/data_nmos_intrinsic_gain_Lp15.dat abs(1/deriv(v(g1)))
.endc"}
C {sg13g2_pr/sg13_lv_nmos.sym} 3280 -540 2 1 {name=M1
l=0.3u
w=10u
ng=4
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/code_shown.sym} 3480 -460 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
