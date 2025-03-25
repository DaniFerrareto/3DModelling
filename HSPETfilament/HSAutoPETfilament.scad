// ----- Declaração de Variáveis ----- //
res=10;
folga1=0.125;

basex=110;
menosAux=80;
base2x=110-menosAux;
basey=2*22.5;
basez=15;

hastex=30;
hastey=22.5;
hastez=10;

rfurao=8.3/2;
rfurim=7.5/2;
sobefurim=13-rfurim-rfurao;

entreFuros=13;

hastefuraox=2*rfurao;
hastefuraoy=19.5;
hastefuraoz=1.25*rfurao;

hastefurimx=2*rfurim;
hastefurimy=19.5;
hastefurimz=1.75*rfurim;

haste2x=14.5;
haste2y=19.5;
haste2z=rfurao+sobefurim+hastefurimz;

rFuro=9.5/2;
alt1=basex-menosAux;
alt2=haste2z+basez+hastez-basez/2;

rfuroElast=13.55/2;
altElast=1.75;

motorx=56;
motory=56;
motorz=52.7;
rmotor=38.1/2+1;
rMenorMotor=6/2;
eCil=(52.1+42.1)/2;
eCilMotorxy=(56-52.1)/2;
rMenorMotorReal=5/2;

rPino=6.35/2;
altPino=24+54.4-52.7;
menosRpino=6.35-5.15;
altRpino=17;
morePino=2;
maisAltPino=2;

// ----- Main ----- //

difference(){
    translate([0,0,0]){
        // Base
        cube([basex,basey,basez]);
        
        translate([0,0,-10-motorz])cube([base2x,basey,motorz]);

        // Hastes
        translate([basex-menosAux-hastex/2,basey/2-hastey/2,basez])
        cube([hastex,hastey,hastez]);

        translate([basex-menosAux-haste2x/2,basey/2-haste2y/2,basez+hastez])
        cube([haste2x,haste2y,haste2z]);

        difference(){
            translate([basex-menosAux+haste2x/2,basey/2-haste2y/2,basez+hastez+rfurao])
            cube([hastefuraox,hastefuraoy,haste2z-rfurao]);
            #translate([rfurao+basex-menosAux+haste2x/2,basey/2-haste2y/2,basez+hastez+rfurao])
            #rotate([-90,0,0]) #cylinder(hastefuraoy,rfurao,rfurao,$fn=res);
        }
        translate([0,0,sobefurim]){
            difference(){
                translate([basex-menosAux-haste2x/2-hastefurimx,basey/2-haste2y/2,basez+hastez+rfurao])
                cube([hastefurimx,hastefurimy,hastefurimz]);
                #translate([-rfurim+basex-menosAux-haste2x/2,basey/2-haste2y/2,basez+hastez+rfurao])
                #rotate([-90,0,0]) #cylinder(hastefurimy,rfurim,rfurim,$fn=res);
            }
        }
    }
    #translate([0,basey/2,basez/2]){
        // Furo Encaminha Fio
        #rotate([0,90,0])
        #cylinder(alt1,rFuro,rFuro,$fn=res);
        #translate([alt1,0,0])
        #sphere(rFuro,$fn=res);
        #translate([alt1,0,0])
        #cylinder(alt2,rFuro,rFuro,$fn=res);
        #translate([alt1,0,0])
        #cylinder(alt2,rFuro,rFuro,$fn=res);
    }
    #translate([0,basey/2,basez/2]){
        // Furo Encaminha Fio
        #rotate([0,90,0])
        #cylinder(alt1,rFuro,rFuro,$fn=res);
        #translate([alt1,0,0])
        #sphere(rFuro,$fn=res);
        #translate([alt1,0,0])
        #cylinder(alt2,rFuro,rFuro,$fn=res);
        #translate([alt1,0,0])
        #cylinder(alt2,rFuro,rFuro,$fn=res);
    }
    translate([0,0,-3*altElast]){
        #translate([alt1,0,alt2])
        #translate([0,basey/2,basez/2])
        #cylinder(altElast,rfuroElast,rfuroElast,$fn=res);
        #translate([alt1,0,alt2+2*altElast])
        #translate([0,basey/2,basez/2])
        #cylinder(altElast,rfuroElast,rfuroElast,$fn=res);
    }
}

// Suporte ao Motor de Passo
difference(){
    translate([basex,-(motory-basey)/2,0])cube([motorx,motory,basez]);
    #translate([basex+eCilMotorxy+rMenorMotorReal,-(motory-basey)/2+eCilMotorxy+rMenorMotorReal,0]){
        #translate([0,0,0])cylinder(basez,rMenorMotor,rMenorMotor,$fn=res);
        #translate([0,eCil,0])cylinder(basez,rMenorMotor,rMenorMotor,$fn=res);
        #translate([eCil,0,0])cylinder(basez,rMenorMotor,rMenorMotor,$fn=res);
        #translate([eCil,eCil,0])cylinder(basez,rMenorMotor,rMenorMotor,$fn=res);
    }
    #translate([basex,-(motory-basey)/2,0])translate([motorx/2,motory/2,0])cylinder(basez,rmotor,rmotor,$fn=res);
}

// Pino do Motor de Passo (Apague quando for imprimir)
difference(){
    translate([basex,-(motory-basey)/2,0])
    translate([motorx/2,motory/2,0])
    cylinder(altPino,rPino,rPino,$fn=res);

    #translate([basex-menosRpino,-(motory-basey)/2,0])
    #translate([motorx/2+rPino,motory/2-rPino,altPino-altRpino])
    #cube([2*rPino,2*rPino,altRpino]);
}

// Encaixe Pino do Motor de Passo
difference(){
    translate([basex,-(motory-basey)/2,altPino-altRpino])
    translate([motorx/2,motory/2,0])
    cylinder(altRpino+maisAltPino,rPino+folga1+morePino,rPino+folga1+morePino,$fn=res);
    difference(){
        translate([basex,-(motory-basey)/2,0])
        translate([motorx/2,motory/2,0])
        cylinder(altPino,rPino+folga1,rPino+folga1,$fn=res);

        #translate([basex-menosRpino+folga1,-(motory-basey)/2,0])
        #translate([motorx/2+rPino,motory/2-rPino,altPino-altRpino])
        #cube([2*rPino,2*rPino,altRpino]);
    }
}

