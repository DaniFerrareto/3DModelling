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

// Peça de Cobre
color("#B87333")
difference(){
    translate([-rFuro-folga1-folginhacobre,-rFuro-folga1-folginhacobre,0])cube([cux+2*folginhacobre,cuy+2*folginhacobre,cuz]);
    #funcao_2d_array_cilindros(rFuro+folga1,eFMO,cuz,nxfuroscobre,nyfuroscobre,1,res,"Mesa Óptica");
}

// Fixação no Cobre
difference(){
    translate([-rFuro-folga1-folginhacobre,-rFuro-folga1-folginhacobre,cuz])cube([cux+2*folginhacobre,2.5*(cuy+2*folginhacobre),zcu]);
    translate([0,0,cuz])translate([2*folginhacobre,2*folginhacobre,zcu/2])
    translate([-rFuro-folga1-folginhacobre,-rFuro-folga1-folginhacobre+2.5*(cuy+2*folginhacobre)-zcu,cuz])
    rotate([-90,0,0])
    cube([cux-2*folginhacobre,zcu/2,zcu-4*folginhacobre]);
    #translate([0,0,cuz])
    #funcao_2d_array_cilindros(rFuro+folga1,eFMO,zcu,nxfuroscobre,nyfuroscobre,1,res,"Mesa Óptica");
    #translate([2*folginhacobre-folga2,2*folginhacobre-folga2,zcu/2])
    #translate([-rFuro-folga1-folginhacobre,-rFuro-folga1-folginhacobre+2.5*(cuy+2*folginhacobre)-zcu,cuz])
    #rotate([-90,0,0])
    #cube([cux-2*folginhacobre+2*folga2,zcu/2,zcu-4*folginhacobre+2*folga2]);
}

// Suporte a Base da Câmara para a Fixação no Cobre
translate([-rFuro-folga1-folginhacobre,-rFuro-folga1-folginhacobre+2.5*(cuy+2*folginhacobre)-zcu,cuz])
rotate([-90,0,0])
cube([cux+2*folginhacobre,cuz,zcu]);
translate([2*folginhacobre,2*folginhacobre,zcu/2])
translate([-rFuro-folga1-folginhacobre,-rFuro-folga1-folginhacobre+2.5*(cuy+2*folginhacobre)-zcu,cuz])
rotate([-90,0,0])
cube([cux-2*folginhacobre,zcu/2,zcu-4*folginhacobre]);

translate([0,1.5*(cuy+2*folginhacobre),0]){
    // Cilindro Longo
    translate([eFMO*(1.5),eFMO,cuz+zcu])
    cylinder(altCil,rCil,rCil,$fn=res);

    // Cone Base do Cilindro Longo
    translate([eFMO*(1.5),eFMO,cuz+zcu])
    cylinder(altCone,rCone,1,$fn=res);

    // Braço de Lego
    translate([eFMO*(1.5),eFMO,cuz+zcu+altCil+5])
    difference(){
        translate([0,0,0]){
            cylinder(altmao,rCil+maoAmais,rCil+maoAmais,$fn=res);
            translate([0,-cubebracoy/2,0])cube([cubebracox,cubebracoy,cubebracoz]);
        }
        #cylinder(altmao,rCil,rCil,$fn=res);
        #translate([0,cubebracoy/2-cubebracoy*(aux_scale/2),cubebracoz/2-cubebracoz*(aux_scale/2)])
        #translate([0,-cubebracoy/2,0])
        #cube([cubebracox,cubebracoy*aux_scale,cubebracoz*aux_scale]);
        #translate([0,0,altmao2/2])
        #rotate([90,0,0])
        #cylinder(2*20,5/2,5/2,$fn=res);
        #translate([-altmao/2,altmao/2,altmao2/2-altmao/2])
        #rotate([0,0,-90])
        #rotate([90,0,0])
        #cube([altmao,altmao,2*20]);
    }

    // Giro
    translate([2*cubebracox+5,0,0])
    translate([eFMO*(1.5),eFMO,cuz+zcu+altCil+5])
    rotate([0,0,180])
    difference(){
        translate([0,0,0]){
            cylinder(altmao2,rCil+maoAmais,rCil+maoAmais,$fn=res);
            translate([0,cubebracoy/2-cubebracoy*(aux_scale/2),cubebracoz/2-cubebracoz*(aux_scale/2)])
            translate([0,-cubebracoy/2,0])
            cube([cubebracox,cubebracoy*aux_scale,cubebracoz*aux_scale]);
        }
        #difference(){
            #cylinder(altK,rKext,rKext,$fn=res);
            #cylinder(altK,rKint,rKint,$fn=res);
        }
        #cylinder(altmao2,rpivot+folga2,rpivot+folga2,$fn=res);
    }

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

// Bastão Retrátil
translate([0,-30,0])
funcBastaoRetratil(peca=3,alt=20);
