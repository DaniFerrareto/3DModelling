// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;
folga1=0.125;

amais=0; //0 ou 2

pcbx=41.8;
pcby=34.4;
pcbz=1.6;
pcbr=(35-28.8)/4;
pcbalt=1.6;
pbcentre=(35+28.8)/2;
pcbfuro1=3.1+pcbr;
pcbfuro2=pcby-2-pcbr;

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

// ----- ----- ----- MAIN ----- ----- ----- //
difference(){
    cube([pcbx,pcby,pcbz+amais]);
    #translate([pcbfuro1,pcbfuro2,0])cylinder(pcbalt+amais,pcbr,pcbr,$fn=res);
    #translate([pcbfuro1+pbcentre,pcbfuro2,0])cylinder(pcbalt+amais,pcbr,pcbr,$fn=res);
}

translate([tMx,tMy,pcbz+amais])cube([conectMotorx,conectMotory,conectMotorz]);
translate([tAx,tAy,pcbz+amais])cube([conectAlix,conectAliy,conectAliz]);
translate([tDRVx,tDRVy,pcbz+amais])cube([conectDRVx,conectDRVy,conectDRVz]);
translate([tDRVx+tDsx,tDRVy+tDsy,tDsz+pcbz+amais])cube([conectDisspx,conectDisspy,conectDisspz]);
translate([tEDSx,tEDSy,pcbz+amais])cube([conectEDSx,conectEDSy,conectEDSz]);
translate([tSx,tSy,pcbz+amais])cube([conectStepx,conectStepy,conectStepz]);
translate([tS1x,tS1y,conectStepz+pcbz+amais])cube([conectStep123x,conectStep123y,conectStep123z]);
translate([tS2x,tS2y,conectStepz+pcbz+amais])cube([conectStep123x,conectStep123y,conectStep123z]);
translate([tS3x,tS3y,conectStepz+pcbz+amais])cube([conectStep123x,conectStep123y,conectStep123z]);
translate([tEDSx+conectEDSx/2-fio06/2,tEDSy+(conectEDSy/3)/2-fio06/2,conectEDSz+pcbz+amais])cube([fio06,fio06,fioz]);
translate([tEDSx+conectEDSx/2-fio06/2,tEDSy+(conectEDSy/3)/2-fio06/2+conectEDSy/3,conectEDSz+pcbz+amais])cube([fio06,fio06,fioz]);
translate([tEDSx+conectEDSx/2-fio06/2,tEDSy+(conectEDSy/3)/2-fio06/2+conectEDSy/3+conectEDSy/3,conectEDSz+pcbz+amais])cube([fio06,fio06,fioz]);