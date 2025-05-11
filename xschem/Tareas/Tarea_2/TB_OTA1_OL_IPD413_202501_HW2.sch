v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {

}
E {}
T {OTA 1 etapa

} -120 -590 0 0 0.4 0.4 {}
N -850 -510 -850 -480 {
lab=VDD}
N -850 -420 -850 -400 {
lab=GND}
N -120 -460 -120 -440 {
lab=VDD}
N 20 -460 20 -440 {
lab=GND}
N 120 -260 160 -260 {
lab=Vo}
C {vsource.sym} -850 -450 0 0 {name=Vin value=\{VDD\} savecurrent=false}
C {lab_pin.sym} -850 -510 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} -850 -400 0 0 {name=l2 lab=GND}
C {code.sym} -1060 -320 0 0 {name=Sim_Param only_toplevel=false 

value="
.param Vin = 3.3
.param VH = 3.3
.param Del = 0

.ic v(Vo) = 0
*.ic i(x1.L1) = 0
*.ic v(Vc) = 0


*.param fsw = 10Meg
*.param fsw = 8Meg
.param fsw = 1Meg

.param Vo = 1.8
.param Io = 26u
.param rI = 0.3
.param rV = 0.1
.param T = 1/fsw

.param D = 1-((Vo+0.05)/(Vin-0.03))
.param TR = 0.01*T
.param TF = 0.01*T
.param TdR = 1n
.param TdF = 1n

*Filtro
.param L = Vin/(4*Io*rI*fsw)
.param R = Vo/Io
.param C = rI/(8*rV*R*fsw)

*.option temp = 125
*.option temp = -40
.option temp = 27

"}
C {devices/code.sym} -1240 -170 0 0 {name=Transient_simulation only_toplevel=false spice_ignore=0

value="
.save v(Vo) i(v.x1.V_Io) i(V_Iin) v(Vdd) v(x1.Vc) i(v.x1.V_IM2) i(v.x1.V_IL) v(Vg_M1) v(Vg_M2)
.param tau = 4*L/R
.csparam tau = \{tau\}
.param SimTime = tau+30*T
.csparam Sim_end = \{SimTime\}

.csparam T = \{T\}
.csparam L = \{L\}
.csparam C = \{C\}
.csparam R = \{R\}

.tran 1n \{SimTime\} uic

.control

run
set color0 = white
*tran 10n \{SimTime\} uic
*tran 10n \{SimTime\}

let Tmeas_i = \{Sim_end\} -\{T\}*10
let Tmeas_end = \{Sim_end\}

let Io = i(v.x1.V_Io)
*let Id_M1 = @m.x1.xm1.msky130_fd_pr__pfet_01v8[id]
let Id_M1 = i(V_Iin)
*let Id_M2 = @m.x1.xm2.msky130_fd_pr__nfet_01v8[id]
let Id_M2 = -i(v.x1.V_IM2)
let gds_M1 = @m.x1.xm1.msky130_fd_pr__pfet_01v8[gds]
let gds_M2 = @m.x1.xm2.msky130_fd_pr__nfet_01v8[gds]

let Po = Io*v(Vo)
let I_in = i(V_Iin)
let Pin = I_in*v(Vdd)
let Vsd_M1 = v(Vdd) - v(x1.Vc)
let Vds_M2 = v(x1.Vc)
let P_M1 = Vsd_M1*Id_M1
let P_M2 = -Vds_M2*Id_M2
let Ron_M1 = Vsd_M1/Id_M1
let Ron_M2 = Vds_M2/Id_M2
*let Ron_M1 = 1/gds_M1
*let Ron_M2 = 1/gds_M2

meas tran Vo_mean AVG v(Vo) FROM=\{Tmeas_i\} TO=\{Tmeas_end\}
meas tran Io_mean AVG Io FROM=\{Tmeas_i\} TO=\{Tmeas_end\}
meas tran Irms_M1 RMS Id_M1 FROM=\{Tmeas_i\} TO=\{Tmeas_end\}
meas tran Irms_M2 RMS Id_M2 FROM=\{Tmeas_i\} TO=\{Tmeas_end\}
meas tran Po_mean AVG Po FROM=\{Tmeas_i\} TO=\{Tmeas_end\}
meas tran Pin_mean AVG Pin FROM=\{Tmeas_i\} TO=\{Tmeas_end\}
meas tran P_M1_mean AVG P_M1 FROM=\{Tmeas_i\} TO=\{Tmeas_end\}
meas tran P_M2_mean AVG P_M2 FROM=\{Tmeas_i\} TO=\{Tmeas_end\}

let eff = 100*Po_mean/Pin_mean
let loss_M1 = 100*P_M1_mean/Pin_mean
let loss_M2 = 100*P_M2_mean/Pin_mean
let cond_loss_M1 = Irms_M1*Irms_M1*40m*100
let cond_loss_M2 = Irms_M2*Irms_M2*35m*100
let sumaPot = eff+loss_M1+loss_M2
print eff loss_M1 loss_M2 cond_loss_M1 cond_loss_M2 sumaPot
print tau T L C R

plot Io i(v.x1.V_IL)
plot Id_M1 Id_M2
plot v(Vo)
plot Po Pin
*plot P_M1 P_M2
plot v(x1.Vc)
plot v(Vg_M1) v(Vg_M2)
plot Ron_M1 Ron_M2
*plot i(V_Iload)
write TB_DCDCBuck.raw
.endc


.end
"}
C {code.sym} -1240 -460 0 0 {name=MODEL only_toplevel=true
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
C {code.sym} -1240 -320 0 0 {name=POWER_MOS_Param only_toplevel=false 

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
C {/workspaces/usm-vlsi-tools/shared_xserver/simulations/Projects/IHP/IPD413_202501/xschem/Tareas/Tarea_2/OTA1.sym} -60 -260 0 0 {name=x2}
C {gnd.sym} 20 -460 2 0 {name=l1 lab=GND}
C {lab_pin.sym} -120 -460 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 160 -260 0 1 {name=p2 sig_type=std_logic lab=Vo}
