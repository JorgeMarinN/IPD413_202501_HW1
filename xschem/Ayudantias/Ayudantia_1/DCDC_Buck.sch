v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -60 -20 -60 30 {
lab=Vc}
N -60 190 -60 240 {
lab=GND}
N 140 190 230 190 {
lab=GND}
N -60 180 -60 190 {
lab=GND}
N -130 -50 -100 -50 {
lab=VgM1}
N -130 150 -100 150 {
lab=VgM2}
N -90 -100 -60 -100 {
lab=Vin}
N -60 -90 -60 -80 {
lab=Vin}
N -100 30 -60 30 {
lab=Vc}
N 140 30 150 30 {
lab=#net1}
N 230 30 270 30 {
lab=Vo}
N 20 30 40 30 {
lab=#net2}
N -60 -50 -40 -50 {
lab=Vin}
N -40 -90 -40 -50 {
lab=Vin}
N -60 -90 -40 -90 {
lab=Vin}
N -60 -100 -60 -90 {
lab=Vin}
N -60 150 -40 150 {
lab=GND}
N -40 150 -40 190 {
lab=GND}
N -60 190 -40 190 {
lab=GND}
N 230 100 230 190 {
lab=GND}
N 230 30 230 40 {
lab=Vo}
N 210 30 230 30 {
lab=Vo}
N 140 30 140 50 {
lab=#net1}
N 100 30 140 30 {
lab=#net1}
N -90 240 -60 240 {
lab=GND}
N 140 110 140 190 {
lab=GND}
N -60 30 -60 40 {
lab=Vc}
N -60 30 -40 30 {
lab=Vc}
N -60 100 -60 120 {
lab=#net3}
N -40 190 140 190 {
lab=GND}
C {ind.sym} 70 30 3 1 {name=L1
m=1
value=\{L\}
footprint=1206
device=inductor}
C {capa.sym} 140 80 0 0 {name=C1
m=1
value=\{C\}
footprint=1206
device="ceramic capacitor"}
C {iopin.sym} -90 -100 2 0 {name=p1 lab=Vin

}
C {ipin.sym} -130 -50 0 0 {name=p2 lab=VgM1}
C {ipin.sym} -130 150 0 0 {name=p4 lab=VgM2}
C {lab_pin.sym} -100 30 0 0 {name=p5 sig_type=std_logic lab=Vc}
C {ammeter.sym} 180 30 3 0 {name=V_Io savecurrent=true spice_ignore=0}
C {ammeter.sym} -10 30 3 0 {name=V_IL savecurrent=true spice_ignore=0}
C {iopin.sym} 270 30 0 0 {name=p3 lab=Vo}
C {res.sym} 230 70 0 0 {name=R1
value=\{R\}
footprint=1206
device=resistor
m=1}
C {iopin.sym} -90 240 2 0 {name=p6 lab=GND

}
C {ammeter.sym} -60 70 0 1 {name=V_IM2 savecurrent=true spice_ignore=0}
C {sg13g2_pr/sg13_hv_pmos.sym} -80 -50 0 0 {name=M3
l=\{l_M1\}
w=\{w_M1\}
ng=\{ng_M1\}
m=\{mult_M1\}
model=sg13_hv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} -80 150 2 1 {name=M1
l=\{l_M2\}
w=\{w_M2\}
ng=\{ng_M2\}
m=\{mult_M2\}
model=sg13_hv_nmos
spiceprefix=X
}
