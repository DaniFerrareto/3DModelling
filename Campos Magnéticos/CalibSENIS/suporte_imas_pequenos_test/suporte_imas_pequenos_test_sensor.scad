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


translate([(base_fixa_x-pilar_x)/2-(entre_imas-pilar_x)/2,0,pilar_z]){
    difference(){
        translate([0,0,0]){
            translate([0,15/2,15])rotate([0,-90,0])cylinder(10,15/2,15/2,$fn=res);
            translate([entre_imas+10,15/2,15])rotate([0,-90,0])cylinder(10,15/2,15/2,$fn=res);
            translate([-10,0,-40])cube([10,15,15+40]);
            translate([entre_imas,0,-40])cube([10,15,15+40]);
            translate([-10,0,-40])cube([20+entre_imas,15,10]);
        }
        #translate([-2,15/2,15])rotate([0,-90,0])cylinder(10,9.9/2,9.9/2,$fn=res);
        #translate([entre_imas+10+2,15/2,15])rotate([0,-90,0])cylinder(10,9.9/2,9.9/2,$fn=res);
        #translate([entre_imas/2,15/2,-40])cylinder(10,4+0.125,4+0.125,$fn=res);
    }
}
