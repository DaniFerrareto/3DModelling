// ----- ----- Declaração de Variáveis  ----- ----- //

$fn=100;
bx=33.6;
by=26.3;
bz=14;
esp=3;

rfio=5/2;
capa=9;

ateInterrup=100;
altAtebase=30;

furo=3.3/2;
rrealfio=4.35/2-0.125;
dist=(2.35+11)/2;

transx=0.75;
transy=0.9;

transx_=10.1;
transy_=9.45;
transz_=2.1;

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
/*
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
}*/



translate([0,-1.5,0])
difference(){
    union(){
        cube([bx,by,esp]);
    }
    #translate([furo+transx,furo+transy,0])cylinder(esp,1,1);
    #translate([bx-furo-transx,by-furo-transy,0])cylinder(esp,1,1);
    #translate([bx-furo-transx,furo+transy,0])cylinder(esp,1,1);
    #translate([furo+transx,by-furo-transy,0])cylinder(esp,1,1);
}

//#translate([0,0,-bz])funcao_2d_array_cilindros(r=rfio,d=dist,h=bz,nx=13,ny=21,geo=2,res=100,nome="Conjunto 1");

translate([2*dist*cos(60),0,-3*esp])cylinder(4*esp,rrealfio,rrealfio);
translate([4*dist,0*dist*sin(60),-3*esp])cylinder(4*esp,rrealfio,rrealfio);
translate([2*dist*cos(60),4*dist*sin(60),-3*esp])cylinder(4*esp,rrealfio,rrealfio);
translate([4*dist,4*dist*sin(60),-3*esp])cylinder(4*esp,rrealfio,rrealfio);