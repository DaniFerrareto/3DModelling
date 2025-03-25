// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;
folga1=0.125;

cubox=50-35;
cuboy=50;
cuboz=60;
rBob=15;
esp=2.5;

rInt=10.45;
rExt=12.45;
alt=15;

supr=18;
supalt=5;

// Estamos nos referindo aqui ao encaixe do interior
encx=54.5;
ency=54.5;
encz=10;
espenc=2;

// ----- ----- ----- MAIN ----- ----- ----- //
translate([0,0,120]){    
    //Encaixe Cilíndrico Real
    translate([0,0,encz+espenc-120+70-encz])
    difference(){
        cylinder(alt,rExt,rExt,$fn=res);
        #cylinder(alt,rInt,rInt,$fn=res);
    }
    
    // Base do Encaixe Cilíndrico de Sobra
    translate([0,0,-120+70-encz])
    translate([-(encx+2*espenc)/2,-(ency+2*espenc)/2,0])
    difference(){
        cube([encx+2*espenc,ency+2*espenc,encz+espenc]);
        #translate([espenc,espenc,0])cube([encx,ency,encz]);
    }
}