// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;
folga1=0.125;
folga10=0.5;

amais=2; //0 ou 2

pcbx=41.8;
pcby=34.4;
pcbz=1.6;

//pcbx=41.8;
pcbx1=66.5;
pcbx2=68.65;
pcby1=2.9;
pcby2=4.65;
pcby3=53.55-14.95;
pcby4=53.55-13.3;
pcby5=53.55;
//pcbz=1.6;
//pcbr=3.45/2;
//pcbalt=1.6;
//pbcentre=(35+28.8)/2;
//pcbfuro1=3.1+pcbr;

espParede=2;
basex=pcbx+2*folga10;
basey=pcby+2*folga10;
basez=2*espParede;
baseARDx=pcbx2+2*folga10;
baseARDy=pcby5+2*folga10;
baseARDz=2.4;

pcbr=(35-28.8)/4-folga1;
pcbalt=2*espParede;
pbcentre=(35+28.8)/2;
pcbfuro1=3.1+(35-28.8)/4;
pcbfuro2=pcby-2-(35-28.8)/4;

/*
conectMotorx=12.4;
conectMotory=7;
conectMotorz=5.5;
tMx=28.2;
tMy=-0.65;

conectAlix=10.5;
conectAliy=2.35;
conectAliz=14.15+10.5-pcbz;
tAx=3.5;
tAy=1.4;

conectDRVx=20.9;
conectDRVy=15.3;
conectDRVz=14.25;
tDRVx=7.25;
tDRVy=6.55;

conectDisspx=9;
conectDisspy=9;
conectDisspz=4.55;
tDsx=2;
tDsy=2.75;
tDsz=conectDRVz;

conectEDSx=2.35;
conectEDSy=7.2;
conectEDSz=2.6;
tEDSx=2.55;
tEDSy=pcby-14.3-conectEDSy;

//conectEDSx=2.35;
//conectEDSy=7.2;
//conectEDSz=2.6;
//tEDSx=2.55;
//tEDSy=pcby-14.3-conectEDSy;

conectStepx=9.1;
conectStepy=9.85;
conectStepz=5.7;
tSx=pcbx-conectStepx-0.6;
tSy=pcby-12.8-conectStepy;

conectStep123x=1.45;
conectStep123y=3.25;
conectStep123z=1.25;
tS1x=tSx+conectStepx/2-(3*conectStep123x+2)/2;
tS1y=tSy+conectStepy/2-conectStep123y/2;
tS2x=tS1x+1+conectStep123x;
tS2y=tSy+conectStepy/2-conectStep123y/2;
tS3x=tS2x+1+conectStep123x;
tS3y=tSy+conectStepy/2-conectStep123y/2;

fio06=0.6;
fioz=5.75;
*/

peDx=3;
peDy=3;
peDz=14.15+10.5-pcbz+pcbz+amais+espParede+14.15/2;
fixbasey=11;

// ----- ----- ----- Declaração de Funções ----- ----- ----- //
use <funcWcmcuStepperMotor.scad>
// Replica do Modulo do Motor de Passo
//translate([espParede+folga10,espParede+folga10,espParede])funcWcmcuStepperMotor(res,amais);
use <funcBaseEL3DArduinoUNO.scad>
// Replica do Modulo do Motor de Passo
//translate([20+basex+2*espParede+2*folga1,0,0])
//translate([espParede+folga10,espParede+folga10,espParede])funcBaseEL3DArduinoUNO(res);
use <funcoes_GFCx.scad>
//funcao_2d_array_cilindros(r,d,h,nx,ny,geo,res,nome="Conjunto 1")

// ----- ----- ----- MAIN ----- ----- ----- //

// Suporte de Baixo (Controle de X)
// Base
difference(){
    translate([-folga1,-folga1,0])
    cube([basex+2*espParede+2*folga1,basey+2*espParede+2*folga1,basez+espParede]);
    #translate([espParede,espParede,espParede])cube([basex,basey,basez]);
}
// Encaixe Cilíndrico
translate([espParede+folga10,espParede+folga10,espParede]){
    translate([pcbfuro1,pcbfuro2,0])cylinder(pcbalt,pcbr,pcbr,$fn=res);
    translate([pcbfuro1+pbcentre,pcbfuro2,0])cylinder(pcbalt,pcbr,pcbr,$fn=res);
}
// Sustentação
translate([-peDx-folga1,-folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([-peDx-folga1,-peDy-folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([-folga1,-peDy-folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([-folga1,-folga1,peDz-peDx])cube([peDx,peDx,peDx]);
//-------------------------------------------------------------------------------------------------------
translate([-peDx-folga1,basey+2*espParede-peDy+folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([-peDx-folga1,basey+2*espParede+folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([0-folga1,basey+2*espParede+folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([0-folga1,basey+2*espParede-peDy+folga1,peDz-peDx])cube([peDx,peDx,peDx]);
//-------------------------------------------------------------------------------------------------------
translate([basex+2*espParede+folga1,-folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([basex+2*espParede+folga1,-peDy-folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([-peDx+basex+2*espParede+folga1,-peDy-folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([-peDx+basex+2*espParede+folga1,-folga1,peDz-peDx])cube([peDx,peDx,peDx]);
//-------------------------------------------------------------------------------------------------------
translate([basex+2*espParede+folga1,basey+2*espParede-peDy+folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([basex+2*espParede+folga1,basey+2*espParede+folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([basex+2*espParede-peDx+folga1,basey+2*espParede+folga1,0])cube([peDx,peDy,peDz+espParede]);
translate([basex+2*espParede-peDx+folga1,basey+2*espParede-peDy+folga1,peDz-peDx])cube([peDx,peDx,peDx]);

/*// Suporte de Meio (Controle de Y)
// Base
translate([0,0,peDz])
difference(){
    cube([basex+2*espParede,basey+2*espParede,basez+espParede]);
    #translate([espParede,espParede,espParede])cube([basex,basey,basez]);
}
// Encaixe Cilíndrico
translate([0,0,peDz])
translate([espParede+folga10,espParede+folga10,espParede]){
    translate([pcbfuro1,pcbfuro2,0])cylinder(pcbalt,pcbr,pcbr,$fn=res);
    translate([pcbfuro1+pbcentre,pcbfuro2,0])cylinder(pcbalt,pcbr,pcbr,$fn=res);
}
// Sustentação
translate([0,0,peDz+espParede]){
    translate([-peDx-folga1,-folga1,0])cube([peDx,peDy,peDz]);
    translate([-peDx-folga1,-peDy-folga1,0])cube([peDx,peDy,peDz]);
    translate([-folga1,-peDy-folga1,0])cube([peDx,peDy,peDz]);
    translate([-folga1,-folga1,peDz-peDx-espParede])cube([peDx,peDx,peDx]);
    //-------------------------------------------------------------------------------------------------------
    translate([-peDx-folga1,basey+2*espParede-peDy+folga1,0])cube([peDx,peDy,peDz]);
    translate([-peDx-folga1,basey+2*espParede+folga1,0])cube([peDx,peDy,peDz]);
    translate([0-folga1,basey+2*espParede+folga1,0])cube([peDx,peDy,peDz]);
    translate([0-folga1,basey+2*espParede-peDy+folga1,peDz-peDx-espParede])cube([peDx,peDx,peDx]);
    //-------------------------------------------------------------------------------------------------------
    translate([basex+2*espParede+folga1,-folga1,0])cube([peDx,peDy,peDz]);
    translate([basex+2*espParede+folga1,-peDy-folga1,0])cube([peDx,peDy,peDz]);
    translate([-peDx+basex+2*espParede+folga1,-peDy-folga1,0])cube([peDx,peDy,peDz]);
    translate([-peDx+basex+2*espParede+folga1,-folga1,peDz-peDx-espParede])cube([peDx,peDx,peDx]);
    //-------------------------------------------------------------------------------------------------------
    translate([basex+2*espParede+folga1,basey+2*espParede-peDy+folga1,0])cube([peDx,peDy,peDz]);
    translate([basex+2*espParede+folga1,basey+2*espParede+folga1,0])cube([peDx,peDy,peDz]);
    translate([basex+2*espParede-peDx+folga1,basey+2*espParede+folga1,0])cube([peDx,peDy,peDz]);
    translate([basex+2*espParede-peDx+folga1,basey+2*espParede-peDy+folga1,peDz-peDx-espParede])cube([peDx,peDx,peDx]);
}
*/
/*
// Suporte de Cima (Controle de Z)
// Base
translate([0,0,2*peDz])
difference(){
    cube([basex+2*espParede,basey+2*espParede,basez+espParede]);
    #translate([espParede,espParede,espParede])cube([basex,basey,basez]);
}
// Encaixe Cilíndrico
translate([0,0,2*peDz])
translate([espParede+folga10,espParede+folga10,espParede]){
    translate([pcbfuro1,pcbfuro2,0])cylinder(pcbalt,pcbr,pcbr,$fn=res);
    translate([pcbfuro1+pbcentre,pcbfuro2,0])cylinder(pcbalt,pcbr,pcbr,$fn=res);
}
*/

echo(2*peDz+basez+espParede);

difference(){
    translate([0,0,0]){
        translate([peDx,-fixbasey-folga1,0])cube([basex-espParede,fixbasey,2*espParede]);
        translate([peDx,basey+2*espParede+2*folga1-folga1,0])cube([basex-espParede,fixbasey,2*espParede]);
    }
    #translate([peDx+(basex-espParede)/2-25.25/2,-folga1-fixbasey/2,0])
    #funcao_2d_array_cilindros(6/2+folga1,25.25,2*espParede,2,3,1,res,"EncaixeBaseCil");
}

// Encaixe Andorinha entre Arduino e os Módulos dos Motores de Passo
translate([peDx+basex+2*espParede+folga1,peDy-folga1,0])
rotate([0,0,-90])
andorinha(2*peDy,30,peDy*(1.4/2),2*peDy,(2/3)*peDy,peDz+espParede,folga1,1);
translate([peDx+basex+2*espParede+folga1,basey+2*espParede-peDy+folga1+2*peDy,0])
rotate([0,0,-90])
andorinha(2*peDy,30,peDy*(1.4/2),2*peDy,(2/3)*peDy,peDz+espParede,folga1,1);

/*
translate([2*peDy+peDx+basex+2*espParede+folga1,peDy-2*peDy,0])
translate([0,0,baseARDx+2*espParede+2*folga1])
rotate([0,90,0])funcBaseEL3DArduinoUNO(res);*/