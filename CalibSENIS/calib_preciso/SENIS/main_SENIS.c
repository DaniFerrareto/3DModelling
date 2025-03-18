// ----- ----- Declaração de Variáveis ----- ----- //
res=10;
folga1=0.15;
folga2=0.05;

base_B=30;
base_b=6;
alt_trap=11;
l_senis=61;
l_cil_senis=19;
entre_cil=20;
r_cil=2.2/2;
li_senis=20;
esp_senis=1.2;

esp_bar=2;
alt_bar=5;
x_bar=5;
y_bar=5;
z_bar=5;

x_cnct=32.7;
y_cnct=8.65;
z_cnct=11.35-esp_senis;
li_cnct_senis=2.45;

x_chip=5;
y_chip=5;
z_chip=0.9;

x_FSV=0.1;
y_FSV=0.1;
z_FSV=0.01;

where_y_FSV=li_senis+alt_trap+l_senis-3;
where_z_FSV=esp_senis+0.9-0.35;

entre_imas=7;
rIma=9.5/2;
altIma=15;
espSupIma=3;
largSUP=10;
xBasinha=entre_imas+2*largSUP;
yBasinha=15;
zBasinha=10;
edei=1; //edei: esp_dist_entre_imas

alt_bar2=altIma-where_z_FSV-folga2;

// ----- ----- Chip ----- ----- //
translate([base_B/2-x_chip/2,where_y_FSV-y_chip/2,esp_senis])cube([x_chip,y_chip,z_chip]);

// ----- ----- FSV ----- ----- //
#translate([base_B/2-x_FSV/2,where_y_FSV-y_FSV/2,where_z_FSV])cube([x_FSV,y_FSV,z_FSV]);
#translate([base_B/2-x_FSV/2,where_y_FSV-y_FSV/2,z_FSV+where_z_FSV])cube([x_FSV,y_FSV,1000]);

// ----- ----- PCB ----- ----- //
difference(){
    linear_extrude(esp_senis)
    polygon(points=[[0,0],
                    [base_B,0],
                    [base_B,li_senis],
                    [base_B/2+base_b/2,li_senis+alt_trap],
                    [base_B/2+base_b/2,li_senis+alt_trap+l_senis],
                    [base_B/2-base_b/2,li_senis+alt_trap+l_senis],
                    [base_B/2-base_b/2,li_senis+alt_trap],
                    [0,li_senis]]);
    #translate([base_B/2+entre_cil/2,l_cil_senis,0])cylinder(esp_senis,r_cil,r_cil,$fn=res);
    #translate([base_B/2-entre_cil/2,l_cil_senis,0])cylinder(esp_senis,r_cil,r_cil,$fn=res);
}

translate([base_B/2+entre_cil/2,l_cil_senis,0])cylinder(esp_senis+2,r_cil-folga1,r_cil-folga1,$fn=res);
translate([base_B/2-entre_cil/2,l_cil_senis,0])cylinder(esp_senis+2,r_cil-folga1,r_cil-folga1,$fn=res);

// ----- ----- Conector ----- ----- //
translate([base_B/2-x_cnct/2,li_cnct_senis,esp_senis])cube([x_cnct,y_cnct,z_cnct]);


// ----- ----- Suporte para a PCB ----- ----- //
translate([0,0,-folga2])
linear_extrude(alt_bar+folga2)
polygon(points=[[-folga1,-folga1],
                [base_B+folga1,-folga1],
                [base_B+folga1,li_cnct_senis-folga1],//
                [base_B/2+x_cnct/2+folga1,li_cnct_senis-folga1],//
                [base_B/2+x_cnct/2+folga1,li_cnct_senis+y_cnct+folga1],//
                [base_B+folga1,li_cnct_senis+y_cnct+folga1],//
                [base_B+folga1,li_senis],
                [base_B/2+base_b/2+folga1,li_senis+alt_trap],
                [base_B/2+base_b/2+folga1+esp_bar,li_senis+alt_trap],
                [base_B+folga1+esp_bar,li_senis],
                [base_B+folga1+esp_bar,li_cnct_senis+y_cnct+folga1+esp_bar],//
                [base_B/2+x_cnct/2+folga1+esp_bar,li_cnct_senis+y_cnct+folga1+esp_bar],//
                [base_B/2+x_cnct/2+folga1+esp_bar,li_cnct_senis-folga1-esp_bar],//
                [base_B+folga1+esp_bar,li_cnct_senis-folga1-esp_bar],//
                [base_B+folga1+esp_bar,-folga1-esp_bar],
                [-folga1-esp_bar,-folga1-esp_bar],
                [-folga1-esp_bar,li_cnct_senis-folga1-esp_bar],//
                [-folga1-2*esp_bar,li_cnct_senis-folga1-esp_bar],//
                [-folga1-2*esp_bar,li_cnct_senis+y_cnct+folga1+esp_bar],//
                [-folga1-esp_bar,li_cnct_senis+y_cnct+folga1+esp_bar],//
                [-folga1-esp_bar,li_senis],
                [base_B/2-base_b/2-folga1-esp_bar,li_senis+alt_trap],
                [base_B/2-base_b/2-folga1,li_senis+alt_trap],
                [-folga1,li_senis],
                [-folga1,li_cnct_senis+y_cnct+folga1],//
                [-folga1+base_B/2-x_cnct/2,li_cnct_senis+y_cnct+folga1],//
                [-folga1+base_B/2-x_cnct/2,li_cnct_senis-folga1],//
                [-folga1,li_cnct_senis-folga1]]);
         
translate([0,0,-folga2-alt_bar2])
linear_extrude(alt_bar2)
polygon(points=[[base_B/2+base_b/2+folga1+esp_bar,li_senis+alt_trap],
                [base_B+folga1+esp_bar,li_senis],
                [base_B+folga1+esp_bar,li_cnct_senis+y_cnct+folga1+esp_bar],//
                [base_B/2+x_cnct/2+folga1+esp_bar,li_cnct_senis+y_cnct+folga1+esp_bar],//
                [base_B/2+x_cnct/2+folga1+esp_bar,li_cnct_senis-folga1-esp_bar],//
                [base_B+folga1+esp_bar,li_cnct_senis-folga1-esp_bar],//
                [base_B+folga1+esp_bar,-folga1-esp_bar],
                [-folga1-esp_bar,-folga1-esp_bar],
                [-folga1-esp_bar,li_cnct_senis-folga1-esp_bar],//
                [-folga1-2*esp_bar,li_cnct_senis-folga1-esp_bar],//
                [-folga1-2*esp_bar,li_cnct_senis+y_cnct+folga1+esp_bar],//
                [-folga1-esp_bar,li_cnct_senis+y_cnct+folga1+esp_bar],//
                [-folga1-esp_bar,li_senis],
                [base_B/2-base_b/2-folga1-esp_bar,li_senis+alt_trap]]);
                
                
// ----- ----- Suporte para Imãs Pequenos ----- ----- //
translate([base_B/2,where_y_FSV,where_z_FSV+z_FSV/2])
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
        translate([-largSUP-entre_imas/2,-(rIma+folga1+espSupIma),-altIma])
        cube([2*largSUP+entre_imas,2*(rIma+folga1+espSupIma),zBasinha]);
        translate([0,-where_y_FSV,-0.005])
        translate([-largSUP-entre_imas/2,0,-altIma])
        cube([2*largSUP+entre_imas,where_y_FSV,zBasinha]);
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
}
