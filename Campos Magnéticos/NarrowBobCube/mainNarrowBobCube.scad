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

// ----- ----- ----- Declaração de Funções ----- ----- ----- //
use <funcoes_GFCx.scad>
use <funcSuporteDoCuboBaixo_v2.scad>

// ----- ----- ----- MAIN ----- ----- ----- //
//Encaixe Cilíndrico Real
/*difference(){
    cylinder(alt,rExt,rExt,$fn=res);
    #cylinder(alt,rInt,rInt,$fn=res);
}*/

// Suporte do Cubo Baixo Versão 2
translate([25,25,0])
translate([-50,-50,0])
funcSuporteDoCuboBaixo_v2();


translate([0,0,120]){
    // Encaixe Cilíndrico de Sobra
    translate([0,0,encz+espenc-120+70-encz])
    difference(){
        cylinder(alt+5,rExt+0.5+2*esp,rExt+0.5+2*esp,$fn=res);
        #cylinder(alt+5,rExt+0.5,rExt+0.5,$fn=res);
    }
    translate([-cubox/2,-(rExt+0.5+2*esp),encz+espenc-120+70-encz+alt])
    cube([cubox,2*(rExt+0.5+2*esp),-(-120+70-encz)]);
    
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

    // Novo Cubo
    translate([-cubox/2,-cuboy/2,alt+encz+espenc]){
        difference(){
            cube([cubox,cuboy,cuboz]);
            #translate([esp,esp,4*esp])cube([cubox-2*esp,cuboy-2*esp,cuboz-8*esp]);
            
            #translate([esp,2*esp,4*esp])cube([cubox-2*esp,cuboy-2*esp,cuboz-8*esp]);
            #translate([esp,0,4*esp])cube([cubox-2*esp,cuboy-2*esp,cuboz-8*esp]);
            
            #translate([0,cuboy/2,cuboz/2])
            #rotate([0,90,0])
            #cylinder(esp,rBob,rBob,$fn=res);
            
            #translate([cubox-esp,cuboy/2,cuboz/2])
            #rotate([0,90,0])
            #cylinder(esp,rBob,rBob,$fn=res);
        }
    }
}