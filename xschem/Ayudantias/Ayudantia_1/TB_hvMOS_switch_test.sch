v {xschem version=3.4.5 file_version=1.2
}
G {}
K {type=subcircuit
format="@name @pinlist @symname"
template="name=X1"    }
V {}
S {}
E {}
T {PULSE(VL VH TD TR TF PW PER PHASE) 
} -470 -340 0 0 0.4 0.4 {}
N 120 30 150 30 {
lab=GND}
N 350 -140 350 -130 {
lab=Vdd}
N 350 -100 370 -100 {
lab=Vdd}
N 370 -140 370 -100 {
lab=Vdd}
N 350 -140 370 -140 {
lab=Vdd}
N 450 -330 450 -300 {
lab=Vdd}
N 450 -240 450 -220 {
lab=GND}
N 150 30 150 70 {
lab=GND}
N 120 70 150 70 {
lab=GND}
N 120 60 120 70 {
lab=GND}
N 120 70 120 90 {
lab=GND}
N 120 -160 120 -140 {
lab=Vdd}
N 40 -330 40 -300 {
lab=Vg_M2}
N 40 -240 40 -220 {
lab=GND}
N 40 -480 40 -450 {
lab=Vg_M1}
N 40 -390 40 -370 {
lab=GND}
N 120 -80 120 -70 {
lab=#net1}
N 120 -10 120 0 {
lab=Vc2}
N 350 10 350 20 {
lab=#net2}
N 350 -60 350 -50 {
lab=Vc1}
N 350 -160 350 -140 {
lab=Vdd}
N 350 80 350 90 {
lab=GND}
N 310 -60 350 -60 {
lab=Vc1}
N 350 -70 350 -60 {
lab=Vc1}
N 80 0 120 0 {
lab=Vc2}
N 290 -100 310 -100 {
lab=#net3}
N 60 30 80 30 {
lab=#net4}
N -20 30 0 30 {
lab=Vg_M2}
C {sg13g2_pr/sg13_hv_nmos.sym} 100 30 2 1 {name=M2
l=\{l_M2\}
w=\{w_M2\}
ng=\{ng_M2\}
m=\{mult_M2\}
model=sg13_hv_nmos
spiceprefix=X
}
C {gnd.sym} 120 90 0 0 {name=l1 lab=GND}
C {sg13g2_pr/sg13_hv_pmos.sym} 330 -100 0 0 {name=M1
l=\{l_M1\}
w=\{w_M1\}
ng=\{ng_M1\}
m=\{mult_M1\}
model=sg13_hv_pmos
spiceprefix=X
}
C {lab_pin.sym} -20 30 0 0 {name=p8 sig_type=std_logic lab=Vg_M2}
C {lab_pin.sym} 230 -100 0 0 {name=p1 sig_type=std_logic lab=Vg_M1}
C {vsource.sym} 450 -270 0 0 {name=Vdd value=\{Vdd\} savecurrent=false}
C {lab_pin.sym} 450 -330 0 0 {name=p5 sig_type=std_logic lab=Vdd}
C {gnd.sym} 450 -220 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 350 -160 0 0 {name=p2 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 120 -160 0 0 {name=p3 sig_type=std_logic lab=Vdd}
C {gnd.sym} 350 90 0 0 {name=l3 lab=GND}
C {ammeter.sym} 120 -110 0 0 {name=VdM2 savecurrent=true spice_ignore=0}
C {ammeter.sym} 350 50 0 0 {name=VdM1 savecurrent=true spice_ignore=0}
C {code.sym} -480 -260 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOShv.lib mos_tt
"}
C {code.sym} -200 -260 0 0 {name=Sim_Param only_toplevel=false 

value="

.param Vdd = 3.3
.param VH = 3.3
.param V_on = 100m
.param I_on = 50m

.param f_sw = 10Meg
.param D = 0.5
.param T = 1/f_sw
.param TR = T*0.01
.param TF = T*0.01
.param Del = 0.05u
* Tiempos muertos
.param TdR = 1n
.param TdF = 1n

.param R = (Vdd - V_on)/I_on

.param temp = 27



"}
C {devices/code.sym} -480 -120 0 0 {name=Transient_simulation only_toplevel=false 

value="
.save all
.param SimTime = 10*T

.tran 1n \{SimTime\}
.control
reset
set color0 = white
*tran 1n 1u
run
let VsdM1 = v(Vdd) - v(Vc1)
let VdsM2 = v(Vc2)
plot i(VdM1) i(VdM2)
plot v(Vc1) v(Vc2)
plot v(Vg_M1) v(Vg_M2)
plot VsdM1 VdsM2
plot i(V_IgM1) i(V_IgM2)
meas TRAN td_off_M1 TRIG v(Vg_M1) VAL=0.33 RISE=1 TARG VsdM1 VAL=0.33 RISE=1
meas TRAN td_on_M1 TRIG v(Vg_M1) VAL=2.97 FALL=1 TARG VsdM1 VAL=2.97 FALL=1
meas TRAN td_on_M2 TRIG v(Vg_M2) VAL=0.33 RISE=1 TARG VdsM2 VAL=2.97 FALL=1
meas TRAN td_off_M2 TRIG v(Vg_M2) VAL=2.97 FALL=1 TARG VdsM2 VAL=0.33 RISE=1
let TdR = td_off_M1 - td_on_M2 
let TdF = td_on_M1 - td_off_M2
print TdR TdF
.endc

.end
"}
C {vsource.sym} 40 -270 0 0 {name=Vg1 value="PULSE(0 \{VH\} \{TdR+Del\} \{1n\} \{1n\} \{T*D-TdR-TdF\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} 40 -480 0 0 {name=p4 sig_type=std_logic lab=Vg_M1}
C {gnd.sym} 40 -220 0 0 {name=l4 lab=GND}
C {vsource.sym} 40 -420 0 0 {name=Vg2 value="PULSE(0 \{VH\} \{Del\} \{1n\} \{1n\} \{T*D\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} 40 -330 0 0 {name=p6 sig_type=std_logic lab=Vg_M2}
C {gnd.sym} 40 -370 0 0 {name=l5 lab=GND}
C {res.sym} 120 -40 0 0 {name=R1
value=\{R\}
footprint=1206
device=resistor
m=1}
C {res.sym} 350 -20 0 0 {name=R2
value=\{R\}
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 80 0 0 0 {name=p7 sig_type=std_logic lab=Vc2}
C {lab_pin.sym} 310 -60 0 0 {name=p9 sig_type=std_logic lab=Vc1}
C {ammeter.sym} 30 30 3 0 {name=V_IgM1 savecurrent=true spice_ignore=0}
C {ammeter.sym} 260 -100 3 0 {name=V_IgM2 savecurrent=true spice_ignore=0}
C {code.sym} -370 -260 0 0 {name=POWER_MOS_Param only_toplevel=false spice_ignore=0

value="
.param temp=27
.param mult_M1 = 1
.param w_M1 =1u 
.param l_M1 = 1u
.param ng_M1 = 1

.param mult_M2 = 1
.param w_M2 =1u 
.param l_M2 =1u
.param ng_M2 =1



"}
