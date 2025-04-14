// ----- ----- Sensor LakeShore ----- ----- //
res=10;

folga1=0.15;
folga2=0.05;

alt_cil=30;
compriLS=102;
espLS=1.1;
largLS=3.9;
R=9.2/2;
Rr=8.95/2;
r=5.75/2;
alt_cil2=4.35;
alt_trapCil=4;

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

/*
// ----- ----- Sensor LakeShore ----- ----- //
cylinder(alt_cil,R,R,$fn=res);
translate([0,0,alt_cil])cylinder(alt_cil2,Rr,Rr,$fn=res);
translate([0,0,alt_cil+alt_cil2])cylinder(alt_trapCil,Rr,r,$fn=res);
translate([-largLS/2,-espLS/2,alt_cil+alt_cil2+alt_trapCil])cube([largLS,espLS,compriLS]);

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
*/

// ----- ----- Goniômetro ----- ----- //
difference(){
    translate([0,0,0]){
        translate([-xgBase/2,-ygBase/2,0])cube([xgBase,ygBase,zgBase]);
        translate([0,0,0])cylinder(altG,rG,rG,$fn=res);
        //translate([0,0,alt_cil])cylinder(alt_cil2,Rr+folga1+espSup,Rr+folga1+espSup,$fn=res);
        //translate([0,0,alt_cil+alt_cil2])cylinder(alt_trapCil,Rr+folga1+espSup,r+folga1+espSup,$fn=res);
        //translate([0,entre_fixa/2,0])cylinder(espSup2,R+folga1+espSup,R+folga1+espSup,$fn=res);
        //translate([0,-entre_fixa/2,0])cylinder(espSup2,R+folga1+espSup,R+folga1+espSup,$fn=res);
        //translate([-(R+folga1+espSup),-entre_fixa/2,0])cube([2*(R+folga1+espSup),entre_fixa,espSup2]);
    }
    #translate([entreFurosGbase/2,ygBase/2-r_furoGbase,0])#cylinder(zgBase,r_furoGbase,r_furoGbase,$fn=res);
    #translate([-entreFurosGbase/2,ygBase/2-r_furoGbase,0])#cylinder(zgBase,r_furoGbase,r_furoGbase,$fn=res);
    #translate([entreFurosGbase/2,-ygBase/2+r_furoGbase,0])#cylinder(zgBase,r_furoGbase,r_furoGbase,$fn=res);
    #translate([-entreFurosGbase/2,-ygBase/2+r_furoGbase,0])#cylinder(zgBase,r_furoGbase,r_furoGbase,$fn=res);
    //#translate([0,0,alt_cil])cylinder(alt_cil2,Rr+folga1,Rr+folga1,$fn=res);
    //#translate([0,0,alt_cil+alt_cil2])cylinder(alt_trapCil,Rr+folga1,r+folga1,$fn=res);
    //#translate([0,entre_fixa/2,0])cylinder(espSup2,r_furo+folga1,r_furo+folga1,$fn=res);
    //#translate([0,-entre_fixa/2,0])cylinder(espSup2,r_furo+folga1,r_furo+folga1,$fn=res);
    
}
