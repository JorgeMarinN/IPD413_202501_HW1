v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -4000 -1740 -3940 -1740 {
lab=#net1}
N -3900 -1800 -3900 -1770 {
lab=#net2}
N -3900 -1710 -3900 -1670 {
lab=GND}
N -4000 -1670 -3900 -1670 {
lab=GND}
N -4070 -1740 -4070 -1670 {
lab=GND}
N -4000 -1680 -4000 -1670 {
lab=GND}
N -4070 -1670 -4000 -1670 {
lab=GND}
N -3900 -1740 -3880 -1740 {
lab=GND}
N -3880 -1740 -3880 -1710 {
lab=GND}
N -3900 -1710 -3880 -1710 {
lab=GND}
N -4070 -1800 -3960 -1800 {
lab=#net3}
C {title.sym} -4520 -1250 0 0 {name=l1 author="Prof: Jorge Marín , Ayudante: Andrés Martínez"}
C {vsource.sym} -4070 -1770 0 0 {name=vd value=3.3 savecurrent=false}
C {vsource.sym} -4000 -1710 0 0 {name=vg value=3.3 savecurrent=false}
C {sg13g2_pr/sg13_hv_nmos.sym} -3920 -1740 0 0 {name=M1
l=\{l_M1\}
w=\{W_M1\}
ng=1
m=1
model=sg13_hv_nmos
spiceprefix=X
}
C {code.sym} -4270 -1830 0 0 {name=MODEL only_toplevel=true
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

*.include /opt/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
*.lib $::SG13G2_MODELS/cornerRES.lib res_typ
*.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
*.lib $::SG13G2_MODELS/diodes.lib
"}
C {gnd.sym} -3980 -1670 0 0 {name=l2 lab=GND}
C {devices/simulator_commands_shown.sym} -3760 -1840 0 0 {name=COMMANDS1 spice_ignore=0
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.param W_M1 = 1u
.param l_M1 = 1u
.options savecurrents
*.dc vd 0 3.3 0.1
.control
  let start_w = 1u
  let stop_w = 90u
  let delta_w = 10u
  let w_act = start_w

  let len = 1+(stop_w-start_w)/delta_w
  let Id_sweep = vector(len)

  while w_act le stop_w
    dc vd 0 3.3 0.1
    alterparam W_M1 = $&w_act
    reset
    save all
    save @n.xm1.nsg13_hv_nmos[ids]
    let Id =  @n.xm1.nsg13_hv_nmos[ids]
    *run
    remzerovec
    write Sweep_W.raw
    plot Id
    let w_act = w_act + delta_w
    set appendwrite
  end
.endc
"}
C {ammeter.sym} -3930 -1800 3 0 {name=V_Id savecurrent=true spice_ignore=0}
