// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //

res=100;
folga=0.125; 

rrosca=8.5/2;
//altrosca=40.6;
altrosca=19.15;
rext=26.9/2;
esp=3.15;
esp2=3.3;

theta=146.6-90;
resf=17.55/2;

rmais=15/2;
rmenos=10.7/2;
altcil=46;
altcilAmaisCima=10;
altcilAmaisBaixo=10;
altcilamaisesf=7.75;
rmais_=(rmais-rmenos)*(altcilAmaisCima/altcil);
rmenos_=(rmais-rmenos)*(altcilAmaisBaixo/altcil);

rpin=5.8/2;

// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //


// ----- ----- ----- MAIN ----- ----- ----- //
difference(){
    translate([0,0,0]){
        hull(){
            cylinder(altrosca,rext,rext,$fn=res);
            difference(){
                translate([0,-rext,altrosca/2])
                rotate([theta,0,0])
                translate([0,0,-altcilAmaisBaixo])
                cylinder(altcil+altcilAmaisCima+altcilAmaisBaixo,rmais+rmais_,rmenos-rmenos_,$fn=res);
                #translate([-altrosca/2,-altrosca-rext*1.15-2*altrosca,0])cube([altrosca,altrosca+2*altrosca,3*altrosca]);
            }
        }
        translate([0,-rext,altrosca/2])
        rotate([theta,0,0]){
            translate([0,0,-altcilAmaisBaixo])cylinder(altcil+altcilAmaisCima+altcilAmaisBaixo,rmais+rmais_,rmenos-rmenos_,$fn=res);
            translate([0,0,altcil+altcilamaisesf])sphere(resf,$fn=res);
        }
    }
    #cylinder(altrosca-esp2,rext-esp,rext-esp,$fn=res);
    #translate([0,0,altrosca-esp2])cylinder(esp2+1,rrosca,rrosca,$fn=res);
    #translate([0,0,-altrosca])cylinder(altrosca,rext,rext,$fn=res);
    
    #translate([0,-rext,altrosca/2-2])
    #rotate([theta,0,0])
    #translate([0,0,-altcilAmaisBaixo])cylinder(altcil+altcilAmaisCima+altcilAmaisBaixo,rpin+folga,rpin+folga,$fn=res);
}

/*
#translate([0,-rext,altrosca/2-2])
#rotate([theta,0,0])
#translate([0,0,-altcilAmaisBaixo])cylinder(altcil+altcilAmaisCima+altcilAmaisBaixo,rpin+folga,rpin+folga,$fn=res);
*/



