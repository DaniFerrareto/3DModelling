res=100;

folga1=0.15;
folga2=0.05;

d=9.5;
base_x=1;
base_y=1;
pilar_x=15;
pilar_y=15;
pilar_z=160;
base_fixa_x=2*6.8+2*25.2;
base_fixa_y=15;
base_fixa_z=2;

enc_cil_ima=9.9/2;
fixa_ima=1;
fixa_ima_z=1;

entre_imas=7;
rIma=9.5/2;
altIma=pilar_z;
espSupIma=3;
largSUP=10;
xBasinha=(entre_imas+2*largSUP)*2;
yBasinha=15;
zBasinha=10;
edei=1; //edei: esp_dist_entre_imas

// ----- ----- Suporte para Imãs Pequenos ----- ----- //
translate([0,0,pilar_z])
difference(){
    translate([0,0,0]){
        translate([-entre_imas/2,0,0])
        rotate([0,-90,0])
        cylinder(largSUP,rIma+folga1+espSupIma,rIma+folga1+espSupIma,$fn=res);
        translate([-largSUP-entre_imas/2,-(rIma+folga1+espSupIma),-altIma])
        cube([largSUP,2*(rIma+folga1+espSupIma),altIma]);
        translate([entre_imas/2,0,0])
        rotate([0,90,0])
        cylinder(largSUP,rIma+folga1+espSupIma,rIma+folga1+espSupIma,$fn=res);
        translate([entre_imas/2,-(rIma+folga1+espSupIma),-altIma])
        cube([largSUP,2*(rIma+folga1+espSupIma),altIma]);
        translate([-(xBasinha-2*largSUP-entre_imas)/2,0,0])
        translate([-largSUP-entre_imas/2,-(rIma+folga1+espSupIma),-altIma])
        cube([xBasinha,2*(rIma+folga1+espSupIma),zBasinha]);
        translate([-largSUP-entre_imas/2,-(rIma+folga1+espSupIma),-altIma])
        cube([2*largSUP+entre_imas,2*(rIma+folga1+espSupIma),pilar_z*0.9]);
    }
    #translate([-entre_imas/2-edei,0,0])
    #rotate([0,-90,0])
    #cylinder(largSUP-edei,rIma+folga1,rIma+folga1,$fn=res);
    #translate([entre_imas/2+edei,0,0])
    #rotate([0,90,0])
    #cylinder(largSUP-edei,rIma+folga1,rIma+folga1,$fn=res);
    #translate([-entre_imas/2,0,0])
    #rotate([0,-90,0])
    #cylinder(largSUP,(rIma+folga1)*0.75,(rIma+folga1)*0.75,$fn=res);
    #translate([entre_imas/2,0,0])
    #rotate([0,90,0])
    #cylinder(largSUP,(rIma+folga1)*0.75,(rIma+folga1)*0.75,$fn=res);
    #translate([-xBasinha*0.375,0,-pilar_z])cylinder(zBasinha,6.8/2,6.8/2,$fn=res);
    #translate([xBasinha*0.375,0,-pilar_z])cylinder(zBasinha,6.8/2,6.8/2,$fn=res);
}
