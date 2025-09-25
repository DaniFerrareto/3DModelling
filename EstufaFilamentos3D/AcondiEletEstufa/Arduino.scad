// ----- ----- Declaração de Variáveis  ----- ----- //

$fn=100;
bx=68.5;
by=53.5;
bz=14;
esp=3;

capa=9;
rfio=5/2;

ateInterrup=100;
altAtebase=30;

furo=3.45/2;
rrealfio=4.35/2-0.125;
dist=(2.35+11)/2;

transx1=12.45;
transy1=0.5;
transx2=0.4;
transy2=5.85;
transx3=0.6;
transy3=15.75;
transx4=13.55;
transy4=0.65;

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


translate([0,2,0])
difference(){
    union(){
        cube([bx,by,esp]);
    }
    #translate([furo+transx1,furo+transy1,0])cylinder(esp,1,1);
    #translate([bx-furo-transx3,by-furo-transy3,0])cylinder(esp,1,1);
    #translate([bx-furo-transx2,furo+transy2,0])cylinder(esp,1,1);
    #translate([furo+transx4,by-furo-transy4,0])cylinder(esp,1,1);
}


//#translate([0,0,-bz])funcao_2d_array_cilindros(r=rfio,d=dist,h=bz,nx=13,ny=21,geo=2,res=100,nome="Conjunto 1");

translate([1*dist*cos(60),1*dist*sin(60),-3*esp])cylinder(4*esp,rrealfio,rrealfio);
translate([9*dist,2*dist*sin(60),-3*esp])cylinder(4*esp,rrealfio,rrealfio);
translate([dist*cos(60),9*dist*sin(60),-3*esp])cylinder(4*esp,rrealfio,rrealfio);
translate([9*dist,8*dist*sin(60),-3*esp])cylinder(4*esp,rrealfio,rrealfio);