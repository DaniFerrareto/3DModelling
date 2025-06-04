// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //

res=100;
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
altCil=270;
tyCil=rCil+5; //'t' vem de translação, e 'y' vem de estar no eixo y
txCil=30; //'t' vem de translação, e 'y' vem de estar no eixo y

rCone=25;
altCone=rCone+20;

abertura=60; //é um ângulo dado em graus
maoAmais=3;
altmao=10;
altmao2=10;
altmao3=27.5;

cubebracox=200/2;
cubebracoy=rCil;
cubebracoz=altmao;
aux_scale=0.6;

esp=3;
rKint=rCil-esp;
rKext=rCil;
altK=altmao2/2;

rpivot=6;
altpivot=altmao2;

rCint1=1;
rCint2=1;
rCext1=1;
rCext2=1;
altC=altmao2/2; // 'C' é de Canhão
entreDistCanhao=10;

// ----- ----- ----- Declaração de Funções ----- ----- ----- //
use <funcoes_GFCx.scad>
use <funcBastaoRetratil.scad>

// ----- ----- ----- MAIN ----- ----- ----- //

translate([0,1.5*(cuy+2*folginhacobre),0]){
    // Canhão
    translate([2*cubebracox+5,0,0])
    translate([eFMO*(1.5),eFMO,cuz+zcu+altCil+5])
    rotate([0,0,180])
    difference(){
        translate([0,0,0]){
            cylinder(altmao3,rpivot,rpivot,$fn=res);
            //-----Suporte Cilíndrico-----//
            translate([0,90/2,altmao3])rotate([90,0,0])rotate([0,0,180])
            difference(){
                translate([0,0,0]){
                    cylinder(90,28.35/2+4,26.35/2+4,$fn=res);
                }
                #cylinder(90,28.35/2,26.35/2,$fn=res);
                #translate([0,-5,0])cube([40,10,90]);
            }
        }
        #translate([0,90/2,altmao3])rotate([90,0,0])rotate([0,0,180]){
            #cylinder(90,28.35/2,26.35/2,$fn=res);
            #translate([0,-5,0])cube([40,10,90]);
        }
    }
}
