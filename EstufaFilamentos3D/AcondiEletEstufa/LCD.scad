// ----- ----- Declaração de Variáveis  ----- ----- //

$fn=100;
bx=98.15+2;
by=60.2+2;
bz=14;
esp=3;

capa=9;

ateInterrup=100;
altAtebase=30;

furo=3.6/2;
rrealfio=4.35;
dist=(2.35+11)/2;

transx=10.1;
transy=9.45;
transz=2.1;

// ----- ----- Declaração de Bibliotecas ----- ----- //
use <funcoes_GFCx.scad>

// ----- ----- Declaração de Funções ----- ----- //

module arruela(esp){
    $fn=100;
    difference(){
        cylinder(esp,25/2,25/2);
        #cylinder(esp,7/2,7/2);
    }
}

// ----- ----- ----- MAIN ----- ----- ----- //
difference(){
    union(){
        translate([0,0,bz+esp])cube([bx+2*esp,capa+esp,+esp]);
        translate([0,esp+by-capa,bz+esp])cube([bx+2*esp,capa+esp,+esp]);
        funcao_caixa(a=bx,b=by,c=bz,d=esp,h=1,encaixe=1,simounao=0,nome="Caixa 1");
    }
    #translate([0,esp,esp])cube([bx+2*esp,by,bz]);
    #translate([esp+furo,esp+furo,bz+esp])cylinder(esp,furo+1,furo+1);
    #translate([esp-furo+bx,esp+furo,bz+esp])cylinder(esp,furo+1,furo+1);
    #translate([esp-furo+bx,esp-furo+by,bz+esp])cylinder(esp,furo+1,furo+1);
    #translate([esp+furo,esp-furo+by,bz+esp])cylinder(esp,furo+1,furo+1);
}

difference(){
    union(){
        translate([-25/2,by/2,0])arruela(esp);
        translate([bx+2*esp+25/2,by/2,0])arruela(esp);
        translate([-25/2,by/2-25/2,0])cube([25/2,25,esp]);
        translate([bx+2*esp,by/2-25/2,0])cube([25/2,25,esp]);
    }
    #translate([-25/2,by/2,0])cylinder(esp,7/2,7/2);
    #translate([bx+2*esp+25/2,by/2,0])cylinder(esp,7/2,7/2);
}