v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {

}
E {}
T {OTA Miller} -1410 -720 0 0 0.8 0.8 {}
T {Esto es tanto para lv_nmos como para lv_pmos
l_min = 0.13u
w_min = 0.15u; w_max = 10u

hvMOS
l_min_HVnmos = 0.45u; l_min_HVpmos = 0.4
w_min_HVnmos = 0.3u;w_min_HVpmos = 0.3u;w_max = 10u;
} -1400 -660 0 0 0.4 0.4 {}
N -1250 -110 -1250 -80 {
lab=VDD}
N -1250 -20 -1250 0 {
lab=GND}
N -430 -370 -430 -340 {
lab=VDD}
N -290 -370 -290 -340 {
lab=VSS}
N -1140 -110 -1140 -80 {
lab=VSS}
N -1140 -20 -1140 0 {
lab=GND}
N -560 -40 -560 -20 {
lab=VSS}
N -270 20 -270 50 {
lab=Vibias}
N -40 -100 -40 -60 {
lab=#net1}
N -190 -160 -40 -160 {
lab=VOUT}
N -380 -470 -40 -470 {
lab=VOUT}
N -40 -470 -40 -160 {
lab=VOUT}
N -650 -200 -650 -150 {
lab=VIN}
N -650 -200 -530 -200 {
lab=VIN}
N -750 -470 -750 -200 {
lab=VIN}
N -750 -200 -650 -200 {
lab=VIN}
N -790 -200 -750 -200 {
lab=VIN}
N -750 -470 -440 -470 {
lab=VIN}
N -900 -200 -850 -200 {
lab=VIN_Signal}
N -560 -120 -560 -100 {
lab=VCM}
N -560 -120 -530 -120 {
lab=VCM}
N -650 -90 -650 -70 {
lab=VSS}
N -900 -200 -900 -160 { lab=VIN_Signal}
N -900 -100 -900 -60 { lab=vstep}
N -900 0 -900 40 { lab=VCM}
N -270 110 -270 140 {
lab=VSS}
C {lab_pin.sym} -430 -368 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} -1250 -50 0 0 {name=VDD value=\{VDD\} savecurrent=false}
C {lab_pin.sym} -1250 -110 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} -1250 0 0 0 {name=l2 lab=GND}
C {code.sym} -980 -420 0 0 {name=Sim_Param only_toplevel=false 

value="
*.param VDD = 3.3
.param VDD = 1.2
.param VCM = 0.6
.param Ibias = 100u
.param Pi = 3.14159265
.param wo = 2*Pi*60Meg
.csparam wo = \{wo\}

.param VAC = 10m
*.param VAC  = 30m
*.param fin  = 9.765625e5
.param fin  = 1e4
.param T = 1/fin

.param vstep = 10m

.param R1 = 100k
*.param R2 = R1/10
.param R2 = R1/30

*.ic v(Vo) = 0

* OP Parameters & Singals to save
.save all

*.option temp = 125
*.option temp = -40
.option temp = 27

"}
C {code.sym} -1400 -420 0 0 {name=MODEL only_toplevel=true
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

.include /opt/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
*.lib $::SG13G2_MODELS/diodes.lib
"}
C {launcher.sym} -740 40 0 0 {name=h1
descr="Annotate OP" 
*tclcommand="set show_hidden_texts 1; xschem annotate_op"
tclcommand="xschem annotate_op"}
C {isource.sym} -270 80 0 0 {name=I0 value=DC\{ibias\}}
C {res.sym} -410 -470 1 0 {name=R3
*value=5k
value=\{R1\}
footprint=1206
device=resistor
m=1}
C {vsource.sym} -560 -70 0 0 {name=V3 value=DC\{VCM\}}
C {lab_pin.sym} -290 -368 0 0 {name=p2 sig_type=std_logic lab=VSS}
C {vsource.sym} -1140 -50 0 0 {name=VSS value=0 savecurrent=false}
C {lab_pin.sym} -1140 -110 0 0 {name=VSS1 sig_type=std_logic lab=VSS
value=0}
C {gnd.sym} -1140 0 0 0 {name=VSS2 lab=GND
value=0}
C {capa.sym} -650 -120 0 1 {name=C5
m=1
*value=3p
value=3p
footprint=1206
device="ceramic capacitor"}
C {res.sym} -820 -200 1 0 {name=R1
value=\{R2\}
footprint=1206
device=resistor
m=1}
C {capa.sym} -40 -130 0 0 {name=C1
m=1
value=\{Cl\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -40 -58 0 1 {name=p4 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -900 -200 0 0 {name=VSS3 sig_type=std_logic lab=VIN_Signal
value=0}
C {lab_pin.sym} -560 -120 0 0 {name=VSS4 sig_type=std_logic lab=VCM
value=0}
C {lab_pin.sym} -650 -70 0 0 {name=VSS5 sig_type=std_logic lab=VSS
value=0}
C {lab_pin.sym} -560 -20 0 0 {name=VSS6 sig_type=std_logic lab=VSS
value=0}
C {lab_pin.sym} -40 -210 0 0 {name=VSS7 sig_type=std_logic lab=VOUT
value=0}
C {capa.sym} -900 -130 2 0 {name=C4
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -900 40 3 0 {name=l20 sig_type=std_logic lab=VCM}
C {lab_wire.sym} -900 -90 3 0 {name=l24 sig_type=std_logic lab=vstep}
C {lab_pin.sym} -580 -200 1 0 {name=l1 sig_type=std_logic lab=VIN}
C {lab_pin.sym} -270 140 0 0 {name=VSS8 sig_type=std_logic lab=VSS
value=0}
C {code.sym} -740 -420 0 0 {name=MillerOTA_Param1 only_toplevel=false spice_ignore=1

value="
.param temp=27

.param m_M875 = 1
.param w_M8 =90u 
.param w_M7 =90u 
.param w_M5 =90u 
.param l_M875 = 0.45u

.param m_M12 = 15
.param w_M12 =30u 
.param l_M12 = 0.6u

.param m_M34 = 3
.param w_M34 =12u 
.param l_M34 = 1.85u

.param m_M6 = 50
.param w_M6 =15u 
.param l_M6 = 0.25u

.param m_R = 1
.param w_R =5.1u 
.param l_R = 0.15u

.param Cc = 4.3p
.param Cl = 20p
.csparam Cl = \{Cl\}
.csparam Cc = \{Cc\}

"}
C {lab_pin.sym} -270 30 0 0 {name=Vibias sig_type=std_logic lab=Vibias
value=0}
C {/workspaces/usm-vlsi-tools/shared_xserver/simulations/Projects/IHP/IPD413_202501/xschem/Tareas/Tarea_2/OTA2_lv.sym} -370 -160 0 0 {name=x1}
C {code.sym} -1280 -420 0 0 {name=MillerOTA_Param only_toplevel=false spice_ignore=1

value="
.param temp=27

.param m_M8 = 1
.param m_M7 = 1
.param m_M5 = 1
.param w_M8 =0.15u 
.param w_M7 =0.15u
.param w_M5 =0.15u
.param l_M875 = 0.13u

.param m_M12 = 1 
.param w_M12 =0.15u
.param l_M12 = 0.13u

.param m_M34 = 1
.param w_M34 =0.15u 
.param l_M34 = 0.13u

.param m_M6 = 1
.param w_M6 =0.15u 
.param l_M6 = 0.13u

.param m_R = 1
.param w_R =0.15u 
.param l_R = 0.13u

.param Cc = 4.3p
.param Cl = 20p
.csparam Cl = \{Cl\}
.csparam Cc = \{Cc\}

"}
C {devices/code.sym} -1155 -265 0 0 {name=Tran_sim only_toplevel=false spice_ignore=0

value="

*.param SimTime = 10*T
*.tran 0.01u \{SimTime\} uic
*.save all v(vsen)
.control

  set color0 = white
  tran 0.1u 100u
  setplot tran1
  *plot v(vsen) v(VOUT)
  plot v(vstep) v(VIN_signal) v(VOUT)
.endc

.end
"}
C {code.sym} -1130 -420 0 0 {name=MillerOTA_Param2 only_toplevel=false spice_ignore=0

value="
.param temp=27

.param m_M8 = 200
.param m_M7 = 18
.param m_M5 = 4500
.param w_M8 =1u 
.param w_M7 =1u
.param w_M5 =1u
.param l_M875 = 1u

.param m_M12 = 3
.param w_M12 =1u
.param l_M12 = 1u

.param m_M34 = 4
.param w_M34 =1u 
.param l_M34 = 9u

.param m_M6 = 420
.param w_M6 =1u 
.param l_M6 = 1u

.param m_R = 1
*.param w_R =10u 
.param w_R = 0.15u
.param l_R = 0.13u

*.param Cc = 0.1p
.param Cc = 0.4p
.param Cl = 20p
.csparam Cl = \{Cl\}
.csparam Cc = \{Cc\}

"}
C {vsource.sym} -900 -30 0 0 {name=V1 value="PULSE(\{-1*vstep\} \{vstep\} 0.0 1p 1p \{T/2\} \{T\}) DC 1 AC 0"}
