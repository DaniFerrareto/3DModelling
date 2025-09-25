// ----- ----- Declaração de Variáveis  ----- ----- //

$fn=3;
bx=138.9;
by=98.4;
bz=5;

ateInterrup=100;
altAtebase=30;

rfio=5/2;
rrealfio=4.35/2;
dist=(2.35+11)/2;

transx=10.1;
transy=9.45;
transz=2.1;

zx=17.5;

moreesq=6.3;
moredir=13.7;

// ----- ----- Declaração de Bibliotecas ----- ----- //
use <funcoes_GFCx.scad>

// ----- ----- Declaração de Funções ----- ----- //

// ----- ----- ----- MAIN ----- ----- ----- //

difference(){
    union(){
        cube([bx,by+2*bz,bz]);
        translate([0,0,bz])cube([bx,bz,altAtebase]);
        translate([0,by+bz,bz])cube([ateInterrup,bz,altAtebase]);
        translate([-bz,by+2*bz-zx,0])rotate([0,90,0])translate([-altAtebase-bz,0,0])cube([altAtebase+bz,zx,bz]);
        rotate([0,0,90])translate([0,0,0])rotate([0,90,0])translate([-altAtebase-bz,0,0])cube([altAtebase+bz,moreesq,bz]);
        translate([0,bz,0])rotate([90,0,0])translate([bx,0,0])cube([moredir,altAtebase+bz,bz]);
    }
    #translate([bx-transy-rrealfio,transy+bz+rrealfio,0])rotate([0,0,90])
    #funcao_2d_array_cilindros(r=rfio,d=dist,h=bz,nx=17,ny=21,geo=2,res=100,nome="Conjunto 1");
    #translate([0,by+bz,bz])rotate([90,0,0])translate([0,-by-2*bz,-bz])
    #translate([bx-transy-rrealfio,transy+bz+rrealfio,0])rotate([0,0,90])
    #funcao_2d_array_cilindros(r=rfio,d=dist,h=bz,nx=22,ny=21,geo=2,res=100,nome="Conjunto 1");
}
//translate([80,50,-bz])cube([50,50,bz]);
//translate([70,50,-bz])rotate([0,0,90])cube([50,50,bz]);
//translate([90,10,-bz])cube([33.6,26.3,bz]);