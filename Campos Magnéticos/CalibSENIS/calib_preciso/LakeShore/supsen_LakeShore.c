// ----- ----- Declaração de Variáveis ----- ----- //
res=100;

folga1=0.15;
folga2=0.05;

alt_cil=30;
compriLS=102; //~4in(polegadas)
espLS=1.1; //~0.045in
largLS=3.9; //~0.15in
R=9.2/2;
Rr=8.95/2;
r=5.75/2;
alt_cil2=4.35;
alt_trapCil=4;
xAA=largLS*0.9; //~0.2in
yAA=largLS*0.9; //~0.2in
// Active area: 0.04in
zAA=espLS;
dofA=3.9;

espSup=3;
espSup2=5;
entre_fixa=(55.9+45.75)/2;
r_furo=6.35/2;

xgBase=73.15;
ygBase=82.55;
zgBase=6.5;
rG=73/2;
altG=31.1;
r_furoGbase=7.2/2;
entreFurosGbase=(43.25+57.55)/2;

entre_imas=7;
rIma=9.5/2;
altIma=15;
espSupIma=3;
largSUP=10;
xBasinha=entre_imas+2*largSUP;
yBasinha=15;
zBasinha=10;
edei=1; //edei: esp_dist_entre_imas

/*
// ----- ----- Sensor LakeShore ----- ----- //
cylinder(alt_cil,R,R,$fn=res);
translate([0,0,alt_cil])cylinder(alt_cil2,Rr,Rr,$fn=res);
translate([0,0,alt_cil+alt_cil2])cylinder(alt_trapCil,Rr,r,$fn=res);
translate([-largLS/2,-espLS/2,alt_cil+alt_cil2+alt_trapCil])cube([largLS,espLS,compriLS]);
#translate([-largLS/2+largLS/2-xAA/2,espLS/2,alt_cil+alt_cil2+alt_trapCil+compriLS-yAA/2-dofA])rotate([90,0,0])cube([xAA,yAA,zAA]);
*/

// ----- ----- Suporte do Sensor ----- ----- //
difference(){
    translate([0,0,0]){
        cylinder(alt_cil,R+folga1+espSup,R+folga1+espSup,$fn=res);
        translate([0,0,alt_cil])cylinder(alt_cil2,Rr+folga1+espSup,Rr+folga1+espSup,$fn=res);
        translate([0,0,alt_cil+alt_cil2])cylinder(alt_trapCil,Rr+folga1+espSup,r+folga1+espSup,$fn=res);
        translate([0,entre_fixa/2,0])cylinder(espSup2,R+folga1+espSup,R+folga1+espSup,$fn=res);
        translate([0,-entre_fixa/2,0])cylinder(espSup2,R+folga1+espSup,R+folga1+espSup,$fn=res);
        translate([-(R+folga1+espSup),-entre_fixa/2,0])cube([2*(R+folga1+espSup),entre_fixa,espSup2]);
    }
    #cylinder(alt_cil,R+folga1,R+folga1,$fn=res);
    #translate([0,0,alt_cil])cylinder(alt_cil2,Rr+folga1,Rr+folga1,$fn=res);
    #translate([0,0,alt_cil+alt_cil2])cylinder(alt_trapCil,Rr+folga1,r+folga1,$fn=res);
    #translate([0,entre_fixa/2,0])cylinder(espSup2,r_furo+folga1,r_furo+folga1,$fn=res);
    #translate([0,-entre_fixa/2,0])cylinder(espSup2,r_furo+folga1,r_furo+folga1,$fn=res);
    
}
/*
// ----- ----- Goniômetro ----- ----- //
translate([0,0,-altG])
difference(){
    translate([0,0,0]){
        translate([-xgBase/2,-ygBase/2,0])cube([xgBase,ygBase,zgBase]);
        translate([0,0,0])cylinder(altG,rG,rG,$fn=res);
        translate([-xgBase/2,-(ygBase*1.25)/2,-zgBase])cube([xgBase,ygBase*1.25,zgBase]);
    }
    #translate([entreFurosGbase/2,ygBase/2-r_furoGbase,-zgBase])cylinder(2*zgBase,r_furoGbase,r_furoGbase,$fn=res);
    #translate([-entreFurosGbase/2,ygBase/2-r_furoGbase,-zgBase])cylinder(2*zgBase,r_furoGbase,r_furoGbase,$fn=res);
    #translate([entreFurosGbase/2,-ygBase/2+r_furoGbase,-zgBase])cylinder(2*zgBase,r_furoGbase,r_furoGbase,$fn=res);
    #translate([-entreFurosGbase/2,-ygBase/2+r_furoGbase,-zgBase])cylinder(2*zgBase,r_furoGbase,r_furoGbase,$fn=res);
    
    #translate([-r_furoGbase,0,0]){
        #translate([entreFurosGbase/2,ygBase/2-r_furoGbase,0])cube([2*r_furoGbase,r_furoGbase,zgBase]);
        #translate([-entreFurosGbase/2,ygBase/2-r_furoGbase,0])cube([2*r_furoGbase,r_furoGbase,zgBase]);
        #translate([entreFurosGbase/2,-ygBase/2+r_furoGbase-r_furoGbase,0])cube([2*r_furoGbase,r_furoGbase,zgBase]);
        #translate([-entreFurosGbase/2,-ygBase/2+r_furoGbase-r_furoGbase,0])cube([2*r_furoGbase,r_furoGbase,zgBase]);
    }
}

// ----- ----- Suporte para Imãs Pequenos ----- ----- //
translate([0,0,alt_cil+alt_cil2+alt_trapCil+compriLS-dofA])
rotate([0,180,0])
rotate([0,0,180])
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

translate([-(2*largSUP+entre_imas)/2,-5+(ygBase*1.25)/2,-altG-zgBase])
cube([2*largSUP+entre_imas,5,zgBase+altG+alt_cil+alt_cil2+alt_trapCil+compriLS-dofA+altIma]);
translate([-(2*largSUP+entre_imas)/2,-(ygBase*1.25)/2,-altG-zgBase])
cube([2*largSUP+entre_imas,5,zgBase+altG+alt_cil+alt_cil2+alt_trapCil+compriLS-dofA+altIma]);
translate([-(2*largSUP+entre_imas)/2,-(ygBase*1.25)/2,-altG-zgBase+zgBase+altG+alt_cil+alt_cil2+alt_trapCil+compriLS-dofA+altIma])
cube([2*largSUP+entre_imas,ygBase*1.25,5]);
*/
