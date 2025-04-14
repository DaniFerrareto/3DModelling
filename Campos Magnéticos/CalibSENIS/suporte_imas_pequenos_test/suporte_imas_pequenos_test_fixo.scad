res=10;

d=9.5;
base_x=1;
base_y=1;
pilar_x=15;
pilar_y=15;
pilar_z=160;
base_fixa_x=2*6.8+2*25.2;
base_fixa_y=15;
base_fixa_z=2;

entre_imas=90;
enc_cil_ima=9.9/2;
fixa_ima=1;
fixa_ima_z=1;


translate([(base_fixa_x-pilar_x)/2-(entre_imas-pilar_x)/2,0,pilar_z])
translate([entre_imas/2,15/2,20-15])
cylinder(25,4,4,$fn=res);
translate([(base_fixa_x-pilar_x)/2-(entre_imas-pilar_x)/2,0,pilar_z])
translate([entre_imas/2,15/2,20+10])
translate([-15/2,-15/2,0])
cube([15,15,3]);