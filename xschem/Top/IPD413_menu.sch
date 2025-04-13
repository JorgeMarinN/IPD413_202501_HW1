v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
L 4 -3760 -1340 -3760 -1070 {}
L 4 -4380 -1340 -3220 -1340 {}
L 4 -3760 -1280 -3220 -1280 {}
L 4 -3760 -1070 -3760 -750 {}
L 4 -3760 -1080 -3090 -1080 {}
L 4 -3220 -1280 -3090 -1280 {}
L 4 -3220 -1340 -3090 -1340 {}
T {Info Dispositivos ihp-sg13g2} -3740 -1320 0 0 0.5 0.5 {}
T {Esto es tanto para lv_nmos como para lv_pmos
l_min = 0.13u
w_min = 0.15u; w_max = 10u

hvMOS
l_min_HVnmos = 0.45u; l_min_HVpmos = 0.4
w_min_HVnmos = 0.3u;w_min_HVpmos = 0.3u;w_max = 10u;
} -3740 -1260 0 0 0.4 0.4 {}
T {PULSE(VL VH TD TR TF PW PER PHASE) 
} -4420 -1090 0 0 0.4 0.4 {}
T {IPD413 - "Seminario Avanzado de Electrónica Industrial"
=> "Diseño de circuitos integrados Analogicos"} -4380 -1450 0 0 0.8 0.8 {}
T {Bienvenidos al curso!! 

Objetivos generales:
-  Aprender metodologias de diseño de circuitos analogicos.
-  Aprender a usar las herramientas de simulación.
-  Aprender metodologias sistematicas para abordar un tapeout.
-  Adquirir una vision completa de todo el proceso de diseño 
de un CI.

} -4430 -1330 0 0 0.4 0.4 {}
T {Links} -3740 -1060 0 0 0.5 0.5 {}
T {- ChipUSM-vlsi-tools: https://github.com/ChipUSM/usm-vlsi-tools
- GitHub: https://github.com/IHP-GmbH
- Open Design Lib: https://github.com/IHP-GmbH/IHP-Open-DesignLib
- 
- 
- 
- 
} -3750 -1010 0 0 0.4 0.4 {}
C {title.sym} -4290 -710 0 0 {name=l1 author="Prof: Jorge Marín , Ayudante: Andrés Martínez"}
C {code.sym} -4430 -1010 0 0 {name=MODEL only_toplevel=true
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
C {code.sym} -4310 -1010 0 0 {name=Sim_Config only_toplevel=false 

value="

.option KLU
*.option itl4=100
.option method=gear
*.option maxord=2
*.option trtol=25 
*.option lvltim=1
*.option tnum=1e9
*.option reltol=1e-3
*.option abstol=1e-10
*.option vntol=1e-4
*.option event
*.option gmin=1e-10
.option cshunt=1e-13
"}
C {../Tutorial_xschem_ngspice/Tutorial.sym} -3990 -950 0 0 {name=X1}
C {../Ayudantias/Ayudantias.sym} -3990 -850 0 0 {name=X2}
C {../Tareas/Tareas.sym} -3990 -800 0 0 {name=X3}
C {../Proyecto/Proyecto.sym} -3990 -750 0 0 {name=X4}
C {../Unidades/Unidades.sym} -3990 -900 0 0 {name=X5}
