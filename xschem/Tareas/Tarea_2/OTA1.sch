v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 100 -370 220 -370 {}
L 4 90 -370 100 -370 {}
L 4 90 -470 220 -470 {}
L 4 90 -470 90 -370 {}
L 4 220 -470 220 -370 {}
L 4 100 -240 220 -240 {}
L 4 90 -240 100 -240 {}
L 4 90 -320 220 -320 {}
L 4 470 -370 590 -370 {}
L 4 460 -370 470 -370 {}
L 4 460 -470 590 -470 {}
L 4 460 -470 460 -370 {}
L 4 590 -470 590 -370 {}
L 4 470 -220 590 -220 {}
L 4 460 -220 470 -220 {}
L 4 460 -320 590 -320 {}
L 4 460 -320 460 -220 {}
L 4 590 -320 590 -220 {}
L 4 90 -320 90 -240 {}
L 4 220 -320 220 -240 {}
L 4 -50 -560 70 -560 {}
L 4 -60 -560 -50 -560 {}
L 4 -60 -640 70 -640 {}
L 4 -60 -640 -60 -560 {}
L 4 70 -640 70 -560 {}
L 4 640 -540 760 -540 {}
L 4 630 -540 640 -540 {}
L 4 630 -640 760 -640 {}
L 4 630 -640 630 -540 {}
L 4 760 -640 760 -540 {}
L 4 830 -500 830 -420 {}
L 4 830 -500 965 -500 {}
L 4 995 -500 995 -420 {}
L 4 830 -400 965 -400 {}
L 4 830 -420 830 -400 {}
L 4 995 -420 995 -400 {}
L 4 965 -500 995 -500 {}
L 4 965 -400 995 -400 {}
T {M1} 145 -470 0 0 0.3 0.3 {}
T {M3} 145 -320 0 0 0.3 0.3 {}
T {M2} 515 -470 0 0 0.3 0.3 {}
T {M4} 515 -320 0 0 0.3 0.3 {}
T {M8} -5 -640 0 0 0.3 0.3 {}
T {M7} 685 -640 0 0 0.3 0.3 {}
T {OTA} 875 -500 0 0 0.3 0.3 {}
N 520 -650 520 -630 {
lab=VDD}
N 520 -160 520 -110 {
lab=VSS}
N 680 -230 710 -230 {
lab=VSS}
N 330 -230 360 -230 {
lab=VSS}
N 360 -160 520 -160 {
lab=VSS}
N 650 -410 680 -410 {
lab=VA}
N 650 -510 650 -410 {
lab=VA}
N 650 -510 680 -510 {
lab=VA}
N 360 -410 390 -410 {
lab=VA}
N 390 -510 650 -510 {
lab=VA}
N 520 -600 540 -600 {
lab=VDD}
N 540 -650 540 -600 {
lab=VDD}
N 520 -650 540 -650 {
lab=VDD}
N 610 -670 610 -650 {
lab=VDD}
N 540 -650 610 -650 {
lab=VDD}
N 360 -290 360 -260 {
lab=VB}
N 170 -650 520 -650 {
lab=VDD}
N 170 -650 170 -630 {
lab=VDD}
N 140 -600 170 -600 {
lab=VDD}
N 140 -650 140 -600 {
lab=VDD}
N 140 -650 170 -650 {
lab=VDD}
N 290 -410 320 -410 {
lab=IN_N}
N 680 -370 780 -370 {
lab=VC}
N 360 -290 410 -290 {
lab=VB}
N 410 -290 410 -230 {
lab=VB}
N 400 -230 410 -230 {
lab=VB}
N 210 -600 480 -600 {
lab=Vibias}
N 360 -200 360 -160 {
lab=VSS}
N 330 -160 360 -160 {
lab=VSS}
N 360 -380 360 -290 {
lab=VB}
N 330 -230 330 -160 {
lab=VSS}
N 710 -230 710 -160 {
lab=VSS}
N 680 -160 710 -160 {
lab=VSS}
N 680 -200 680 -160 {
lab=VSS}
N 520 -160 680 -160 {
lab=VSS}
N 410 -200 640 -200 {
lab=VB}
N 360 -450 360 -440 {
lab=#net1}
N 390 -510 390 -410 {
lab=VA}
N 360 -510 390 -510 {
lab=VA}
N 720 -410 730 -410 {
lab=IN_P}
N 680 -450 680 -440 {
lab=#net2}
N 680 -380 680 -370 {
lab=VC}
N 680 -370 680 -320 {
lab=VC}
N 90 -510 210 -510 {
lab=Vibias}
N 210 -600 210 -510 {
lab=Vibias}
N 840 -370 890 -370 {
lab=OUT}
N 640 -230 640 -200 {
lab=VB}
N 410 -230 410 -200 {
lab=VB}
C {devices/ipin.sym} 290 -410 0 0 {name=p2 lab=IN_N
}
C {devices/ipin.sym} 730 -410 0 1 {name=p1 lab=IN_P}
C {devices/ipin.sym} 90 -510 0 0 {name=p9 lab=Vibias}
C {sg13g2_pr/sg13_lv_pmos.sym} 340 -410 0 0 {name=M1
l=\{l_M12\}
w=\{w_M12\}
ng=1
m=\{m_M12\}
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 380 -230 2 0 {name=M3
l=\{l_M34\}
w=\{w_M34\}
ng=1
m=\{m_M34\}
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 700 -410 0 1 {name=M2
l=\{l_M12\}
w=\{w_M12\}
ng=1
m=\{m_M12\}
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 660 -230 2 1 {name=M4
l=\{l_M34\}
w=\{w_M34\}
ng=1
m=\{m_M34\}
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 500 -600 0 0 {name=M7
l=\{l_M875\}
w=\{w_M7\}
ng=1
m=\{m_M7\}
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 190 -600 0 1 {name=M8
l=\{l_M875\}
w=\{w_M8\}
ng=1
m=\{m_M8\}
model=sg13_lv_pmos
spiceprefix=X
}
C {opin.sym} 890 -370 0 0 {name=p6 lab=OUT}
C {iopin.sym} 610 -670 2 0 {name=p3 lab=VDD}
C {iopin.sym} 520 -110 2 0 {name=p4 lab=VSS}
C {ammeter.sym} 360 -480 0 1 {name=Vmeas savecurrent=true spice_ignore=0}
C {ammeter.sym} 680 -290 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {ammeter.sym} 680 -480 0 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {ammeter.sym} 520 -540 0 1 {name=Vmeas5 savecurrent=true spice_ignore=0}
C {ammeter.sym} 170 -540 0 1 {name=Vmeas6 savecurrent=true spice_ignore=0}
C {ammeter.sym} 810 -370 3 0 {name=Vmeas7 savecurrent=true spice_ignore=0}
C {devices/lab_wire.sym} 580 -510 0 1 {name=l4 sig_type=std_logic lab=VA

}
C {devices/lab_wire.sym} 360 -320 2 1 {name=l5 sig_type=std_logic lab=VB
}
C {devices/lab_wire.sym} 680 -340 2 1 {name=l6 sig_type=std_logic lab=VC

}
C {ngspice_get_value.sym} 155 -425 0 1 {name=r1 node=VthM1
descr="Vth= "}
C {ngspice_get_value.sym} 155 -400 0 1 {name=r2 node=gmM1
descr="gm= "}
C {ngspice_get_value.sym} 205 -425 0 1 {name=r3 node=VsdM1
descr="Vsd= "}
C {ngspice_get_value.sym} 205 -400 0 1 {name=r5 node= VovM1
descr="Vov= "}
C {ngspice_get_value.sym} 140 -375 0 1 {name=r8 node=VsgM1
descr="Vsg= "}
C {ngspice_get_value.sym} 155 -275 0 1 {name=r16 node=VthM3
descr="Vth= "}
C {ngspice_get_value.sym} 155 -250 0 1 {name=r17 node=gmM3
descr="gm= "}
C {ngspice_get_value.sym} 205 -275 0 1 {name=r18 node=VdsM3
descr="Vds= "}
C {ngspice_get_value.sym} 525 -425 0 1 {name=r4 node=VthM2
descr="Vth= "}
C {ngspice_get_value.sym} 525 -400 0 1 {name=r6 node=gmM2
descr="gm= "}
C {ngspice_get_value.sym} 585 -425 0 1 {name=r7 node=VsdM2
descr="Vsd= "}
C {ngspice_get_value.sym} 585 -400 0 1 {name=r9 node= VovM2
descr="Vov= "}
C {ngspice_get_value.sym} 510 -375 0 1 {name=r10 node=VsgM2
descr="Vsg= "}
C {ngspice_get_value.sym} 525 -275 0 1 {name=r11 node=VthM4
descr="Vth= "}
C {ngspice_get_value.sym} 525 -250 0 1 {name=r12 node=gmM4
descr="gm= "}
C {ngspice_get_value.sym} 575 -275 0 1 {name=r13 node=VdsM4
descr="Vds= "}
C {ngspice_get_value.sym} 575 -250 0 1 {name=r14 node= VovM4
descr="Vov= "}
C {ngspice_get_value.sym} 510 -225 0 1 {name=r15 node=VgsM4
descr="Vgs= "}
C {ngspice_get_value.sym} 5 -595 0 1 {name=r20 node=VthM8
descr="Vth= "}
C {ngspice_get_value.sym} 5 -570 0 1 {name=r21 node=gmM8
descr="gm= "}
C {ngspice_get_value.sym} 55 -595 0 1 {name=r22 node=VsdM8
descr="Vsd= "}
C {ngspice_get_value.sym} 695 -595 0 1 {name=r24 node=VthM7
descr="Vth= "}
C {ngspice_get_value.sym} 695 -570 0 1 {name=r25 node=gmM7
descr="gm= "}
C {ngspice_get_value.sym} 745 -595 0 1 {name=r26 node=VsdM7
descr="Vsd= "}
C {ngspice_get_value.sym} 745 -570 0 1 {name=r27 node= VovM7
descr="Vov= "}
C {ngspice_get_value.sym} 680 -545 0 1 {name=r28 node=VsgM7
descr="Vsg= "}
C {ngspice_get_value.sym} 215 -375 0 1 {name=r40 node=RoM1
descr="Ro= "}
C {ngspice_get_value.sym} 585 -375 0 1 {name=r42 node=RoM2
descr="Ro= "}
C {ngspice_get_value.sym} 755 -545 0 1 {name=r43 node=RoM7
descr="Ro= "}
C {ngspice_get_value.sym} 575 -225 0 1 {name=r44 node=RoM4
descr="Ro= "}
C {devices/lab_wire.sym} 330 -600 0 0 {name=l7 sig_type=std_logic lab=Vibias
}
C {ngspice_get_value.sym} 870 -455 0 1 {name=r23 node=Av1
descr="Av1= "}
C {ngspice_get_value.sym} 945 -455 0 1 {name=r49 node=BW
descr="BW= "}
C {ngspice_get_value.sym} 945 -430 0 1 {name=r50 node=GBW
descr="GBW= "}
C {ngspice_get_value.sym} 880 -405 0 1 {name=r53 node=DCG
descr="DCG= "}
