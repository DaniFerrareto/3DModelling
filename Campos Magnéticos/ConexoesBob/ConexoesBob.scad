// ----- ----- ----- Declaração de variáveis ----- ----- ----- //
basex=160;
basey=139;
basez=5.1;

quadx=39.9;
quady=18.05;
quadz=17.45-5.10;
espquad=2.55;
entreQuad=1;
quadxdist=27.3;
eachQuad=17+18.05;
totalQuads=2*17+3*18.05;

dquadx=39.9;
dquady=1;
dquadz=17.45-5.10;
dquadxdist=5;
eachDquad=2*18.05-espquad+12.95;
totalDquads=3*(2*18.05-espquad)+2*12.95;

dpinx=15.05;
dpiny=3.5;
dpinz=18.5-5.1;
entrePins=10;
totalDpins=3*17+2*29.75;
eachPin=17+29.75;
dpinxdist=27.25;

// ----- ----- ----- Declaração de Funções ----- ----- ----- //
use <funcoes_GFCx.scad>

module quadrados(){
    difference(){
        cube([quadx,quady,quadz]);
        #translate([espquad,espquad,0])cube([quadx-2*espquad,quady-2*espquad,quadz]);
    }
}

module doublequadrados(){
    quadrados();
    translate([0,quady-espquad,0])quadrados();
}

module doublepins(){
    cube([dpinx,dpiny,dpinz]);
    translate([0,entrePins+dpiny,0])cube([dpinx,dpiny,dpinz]);
}

// ----- ----- ----- MAIN ----- ----- ----- //

//Base //dquadxdist+dquadx+dpinxdist+dpinx+quadxdist
cube([basex,basey,basez]);

//Double Quadrados, Double Pins e Quadrados
translate([0,0,basez]){
    
    // Double Quadrados
    translate([dquadxdist,basey/2-totalDquads/2,0]){
        doublequadrados();
        translate([0,eachDquad,0])doublequadrados();
        translate([0,2*eachDquad,0])doublequadrados();
    }
    
    // Double Pins
    translate([dquadxdist+dquadx+dpinxdist,basey/2-totalDpins/2,0]){
        doublepins();
        translate([0,eachPin,0])doublepins();
        translate([0,2*eachPin,0])doublepins();
    }
    
    // Quadrados
    translate([dquadxdist+dquadx+dpinxdist+dpinx+quadxdist,basey/2-totalQuads/2,0]){
        quadrados();
        translate([0,eachQuad,0])quadrados();
        translate([0,2*eachQuad,0])quadrados();
    }
}