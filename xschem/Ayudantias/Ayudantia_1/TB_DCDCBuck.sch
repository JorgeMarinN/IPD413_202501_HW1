v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {

}
E {}
T {- d = Vo/Vin. => Como la señal de disparo VgM1 es el negado de VsdM1, d*=1-d.
- R=Vo/Io, C= (rI)/(8*rV*R*fsw), L = Vs/(4*Io*rI*fsw)} -1070 -430 0 0 0.4 0.4 {}
N -744 -260 -730 -260 {
lab=Vg_M1}
N -744 -220 -730 -220 {
lab=Vg_M2}
N -420 -180 -420 -150 {
lab=Vdd}
N -420 -90 -420 -70 {
lab=GND}
N -700 -180 -700 -150 {
lab=Vg_M1}
N -700 -90 -700 -70 {
lab=GND}
N -700 -30 -700 0 {
lab=Vg_M2}
N -700 60 -700 80 {
lab=GND}
N -520 -240 -520 -230 {
lab=Vo}
N -640 -200 -640 -190 {
lab=GND}
N -520 -240 -490 -240 {
lab=Vo}
N -550 -240 -520 -240 {
lab=Vo}
N -640 -360 -640 -340 {
lab=Vdd}
N -640 -300 -640 -280 {
lab=#net1}
C {lab_pin.sym} -640 -358 0 0 {name=p1 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} -744 -260 0 0 {name=p2 sig_type=std_logic lab=Vg_M1}
C {lab_pin.sym} -744 -220 0 0 {name=p3 sig_type=std_logic lab=Vg_M2}
C {lab_pin.sym} -496 -240 2 0 {name=p4 sig_type=std_logic lab=Vo}
C {vsource.sym} -420 -120 0 0 {name=Vin value=\{Vin\} savecurrent=false}
C {lab_pin.sym} -420 -180 0 0 {name=p5 sig_type=std_logic lab=Vdd}
C {gnd.sym} -420 -70 0 0 {name=l2 lab=GND}
C {vsource.sym} -700 30 0 0 {name=Vg2 value="PULSE(0 \{VH\} \{TdR\} \{TR\} \{TF\} \{T*D-TdR-TdF\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} -700 -180 0 0 {name=p6 sig_type=std_logic lab=Vg_M1}
C {gnd.sym} -700 -70 0 0 {name=l4 lab=GND}
C {vsource.sym} -700 -120 0 0 {name=Vg1 value="PULSE(0 \{VH\} 0 \{TR\} \{TF\} \{T*D\} \{T\} 0)" savecurrent=false}
C {lab_pin.sym} -700 -30 0 0 {name=p7 sig_type=std_logic lab=Vg_M2}
C {gnd.sym} -700 80 0 0 {name=l5 lab=GND}
C {code.sym} -1060 -320 0 0 {name=Sim_Param only_toplevel=false 

value="
.param Vin = 3.3
.param VH = 3.3
.param Del = 0

.ic v(Vo) = 0
*.ic i(x1.L1) = 0
*.ic v(Vc) = 0


*.param fsw = 10Meg
*.param fsw = 8.5Meg
.param fsw = 1Meg

.param Vo = 1.8
.param Io = 500m
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
C {gnd.sym} -640 -190 0 0 {name=l3 lab=GND}
C {ammeter.sym} -640 -320 0 0 {name=V_Iin savecurrent=true spice_ignore=0}
C {devices/code.sym} -1060 -170 0 1 {name=Transient_simulation only_toplevel=false spice_ignore=1

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
C {devices/code.sym} -1060 -170 0 0 {name=Sweep_Io only_toplevel=false spice_ignore=1

value="
.save all
.param tau = 4*L/R
.csparam tau = \{tau\}
.param SimTime = tau+10*T
.csparam Sim_end = \{SimTime\}
.csparam Vo = \{Vo\}
.csparam T = \{T\}
.csparam L = \{L\}
.csparam C = \{C\}
.csparam R = \{R\}

.tran 10n \{SimTime\} uic

.control
set color0 = white

* Rango de corrientes para el sweep
let strt = 10m
let stp = 100m
let step = 10m
compose Io_sweep2 start = 10m stop = 100m step=10m 

let R_sweep = \{Vo\}/Io_sweep2
let len = 1+(stp-strt)/step

let eff_sweep = vector(len)
let Io_sweep = vector(len)
let Vo_sweep = vector(len)
let Po_sweep = vector(len)
let Pin_sweep = vector(len)
let loss_M1_sweep = vector(len)
let loss_M2_sweep = vector(len)

let index = 0

foreach R_val $&R_sweep
	alterparam R = $R_val
	reset
	save all
	run
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

	let Tmeas_i = \{Sim_end\} - 5*\{T\}
	let Tmeas_end = \{Sim_end\}

	*plot v(Vo)
	*plot Io i(v.x1.V_IL)
	*plot Id_M1 Id_M2
	*plot Po Pin
	*plot P_M1 P_M2
	*plot v(x1.Vc)
	*plot v(Vg_M1) v(Vg_M2)
	*plot Ron_M1 Ron_M2
	
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
	
	let eff_sweep[index] =  eff
	let Io_sweep[index] = Io_mean
	let Vo_sweep[index] = Vo_mean
	let Po_sweep[index] = Po_mean
	let Pin_sweep[index] = Pin_mean
	
	let loss_M1_sweep[index] = loss_M1
	let loss_M2_sweep[index] = loss_M2
	
	let index = index + 1

	*write TB_DCDCBuck.raw
end
*print eff loss_M1_sweep loss_M2_sweep
print fsw_sweep
print eff_sweep loss_M2_sweep loss_M1_sweep
print R_sweep Io_sweep Vo_sweep 
print Po_sweep Pin_sweep 
plot eff_sweep vs Io_sweep
plot Io_sweep vs R_sweep
plot Pin_sweep Po_sweep vs Io_sweep
plot loss_M1_sweep loss_M2_sweep vs Io_sweep 
.endc


.end
"}
C {devices/code.sym} -950 -170 0 0 {name=Sweep_fsw only_toplevel=false spice_ignore=0

value="
.save all
.param tau = 4*L/R
.csparam tau = \{tau\}
.param SimTime = tau+10*T
.csparam Sim_end = \{SimTime\}
.csparam Vo = \{Vo\}
.csparam T = \{T\}
.csparam L = \{L\}
.csparam C = \{C\}
.csparam R = \{R\}
.csparam fsw = \{fsw\}

.tran 10n \{SimTime\} uic

.control
set color0 = white

let strt = 500k
let stp = 10Meg
let step = 500k

compose fsw_sweep start = 500k stop = 10Meg step = 500k

let T_sweep = 1/fsw_sweep
let len = 1+(stp-strt)/step

let eff_sweep = vector(len)
*let fsw_sweep = vector(len)
let Io_sweep = vector(len)
let Vo_sweep = vector(len)
let Po_sweep = vector(len)
let Pin_sweep = vector(len)
let loss_M1_sweep = vector(len)
let loss_M2_sweep = vector(len)

let index = 0

foreach T_val $&T_sweep
	alterparam fsw = $fsw_val
	alterparam T = $T_val
	reset
	save all
	run
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

	let Tmeas_i = \{Sim_end\} - 5*\{T\}
	let Tmeas_end = \{Sim_end\}

	*plot v(Vo)
	*plot Io i(v.x1.V_IL)
	*plot Id_M1 Id_M2
	*plot Po Pin
	*plot P_M1 P_M2
	*plot v(x1.Vc)
	*plot v(Vg_M1) v(Vg_M2)
	*plot Ron_M1 Ron_M2
	
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
	
	let eff_sweep[index] =  eff
	let Io_sweep[index] = Io_mean
	let Vo_sweep[index] = Vo_mean
	let Po_sweep[index] = Po_mean
	let Pin_sweep[index] = Pin_mean
	
	let loss_M1_sweep[index] = loss_M1
	let loss_M2_sweep[index] = loss_M2
	
	let index = index + 1

	*write TB_DCDCBuck.raw
end
*print eff loss_M1_sweep loss_M2_sweep
print eff_sweep loss_M2_sweep loss_M1_sweep
print fsw_sweep Io_sweep Vo_sweep 
print Po_sweep Pin_sweep 
plot eff_sweep vs fsw_sweep
plot Io_sweep vs fsw_sweep
plot Vo_sweep vs fsw_sweep
plot Pin_sweep Po_sweep vs fsw_sweep
plot loss_M1_sweep loss_M2_sweep vs fsw_sweep 
.endc


.end
"}
C {code.sym} -1180 -320 0 0 {name=MODEL only_toplevel=true
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
C {../Ayudantia_1/DCDC_Buck.sym} -630 -220 0 0 {name=X1}
C {code.sym} -950 -320 0 0 {name=POWER_MOS_Param only_toplevel=false spice_ignore=0

value="
.param temp=27
.param mult_M1 = 3*800
.param w_M1 =10u 
.param l_M1 = 0.4u
.param ng_M1 = 1

.param mult_M2 = 800
.param w_M2 =10u 
.param l_M2 =0.45u
.param ng_M2 =1



"}
