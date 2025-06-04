// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //

res=10;
folga1=0.125;
folga2=0.175;
eFMO=25.2; //entreFurosMesaOptica
rFuro=6/2;

folginhacobre=1;
nxfuroscobre=4;
nyfuroscobre=3;

cux=(nxfuroscobre-1)*eFMO+2*rFuro+2*folga1;
cuy=(nyfuroscobre-1)*eFMO+2*rFuro+2*folga1;
cuz=28.4;
zcu=10;

cux_compare=1;
cuy_compare=1;
cuz_compare=1;

Ly=70;
//Lx=20;
Lx=cux+2*folginhacobre;
pex=20;
//pex=cux+2*folginhacobre;

rCil=20/2;
altCil=170;
tyCil=rCil+5; //'t' vem de translação, e 'y' vem de estar no eixo y
txCil=30; //'t' vem de translação, e 'y' vem de estar no eixo y

rCone=25;
altCone=rCone+20;

abertura=60; //é um ângulo dado em graus
maoAmais=2.5;
altmao=10;
altmao2=10;
altmao3=35;

cubebracox=55;
cubebracoy=rCil;
cubebracoz=altmao;
aux_scale=0.6;

rKint=rCil-1;
rKext=rCil;
altK=altmao2/2;

rpivot=2.5;
altpivot=altmao2;

rCint1=1;
rCint2=1;
rCext1=1;
rCext2=1;
altC=altmao2/2; // 'C' é de Canhão
entreDistCanhao=10;

altpeq=3;

// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //

//use <threads-library-by-cuiso-daniel-v7.scad>
use <threads-library-by-cuiso-v1.scad>

// ----- ----- ----- MAIN ----- ----- ----- //
module funcBastaoRetratil(peca=2,alt,r=20/2,esp=3,res=100,folga=0.125){
    if(peca==3){
        // Peça Maior
        difference(){
            cylinder(alt,r-folga,r-folga,$fn=res);
            #cylinder(alt,r-esp+folga,r-esp+folga,$fn=res);
            #translate([0,0,alt-5])
            #rotate([90,0,0])
            #cylinder(2*alt,5/2,5/2,$fn=res);
        }
        
        //Peça menor
        translate([0,0,alt-10])
        difference(){
            cylinder(alt,r-esp,r-esp,$fn=res);
            #cylinder(alt,r-2*esp,r-2*esp,$fn=res);
        }
        translate([0,0,2*alt-10])cylinder(altpeq,r-esp,r-esp,$fn=res);
        translate([0,0,2*alt-10+altpeq])
        difference(){
            cylinder(d=10, h=7, $fn = res); 
            #thread_for_nut(diameter=6, length=7, usrclearance=0.1); 
        }
        
        //Parafuso
        translate([r*1.25+9+4.5,0,0]){
            thread_for_screw(diameter=6, length=10); 
            cylinder(d=9+4.5, h=3, $fn=6);
        }
    }else if(peca==0){
        // Peça Maior
        difference(){
            cylinder(alt,r-folga,r-folga,$fn=res);
            #cylinder(alt,r-esp+folga,r-esp+folga,$fn=res);
            #translate([0,0,alt-5])
            #rotate([90,0,0])
            #cylinder(2*alt,5/2,5/2,$fn=res);
        }
    }else if(peca==1){
        //Peça menor
        translate([0,0,alt-10])
        difference(){
            cylinder(alt,r-esp,r-esp,$fn=res);
            #cylinder(alt,r-2*esp,r-2*esp,$fn=res);
        }
        translate([0,0,2*alt-10])cylinder(altpeq,r-esp,r-esp,$fn=res);
        translate([0,0,2*alt-10+altpeq])
        difference(){
            cylinder(d=10, h=7, $fn = res); 
            #thread_for_nut(diameter=6, length=7, usrclearance=0.1); 
        }
    }else if(peca==2){
        //Parafuso
        translate([r*1.25+9+4.5,0,0]){
            thread_for_screw(diameter=6, length=10); 
            cylinder(d=9+4.5, h=3, $fn=6);
        }
    }
    echo("Altura máxima do chão até a parte de baixo do braço (Nota: Não se considera a altura que entra por baixo na peça de cima):");
    echo(2*alt-10+altpeq+7+5+3);
}

funcBastaoRetratil(peca=2,alt=200);