// ----- ----- ----- Bobina Multidiâmetro ----- ----- ----- //

// ----- ----- Declaração de Variáveis ----- ----- //
$fn=50;

rInt=30/2;
hInt=48.5;
esp=2.5;

r1=110.15/2;
h11=5.4;
h12=3;
r2=90.35/2;
h2=2;
r3=70.20/2;
h3=1;
r4=50.25/2;
h4=1;

rB1=107/2;
hB1=13;
rB2=90/2;
hB2=12;
rB3=70/2;
hB3=10;
rB4=50/2;
hB4=10;

altTotal=h11+h12+h2+h3+h4+hB1+hB2+hB3+hB4;

hPop=3.5;
rPop=2.5;
esp1=0.5;

esp5=5;
folga1=0.375;

S=2;
theta=(180/PI)*S/(rInt-esp);
quantas=12;
Theta=360/12;

// ----- ----- Declaração de Funções ----- ----- //
module branco(){
    color("white")
    difference(){
        union(){
            cylinder(altTotal,rInt,rInt);
            translate([0,0,0])
            cylinder(h11,r1,r1);
            translate([0,0,h11+hB1])
            cylinder(h12,r1,r1);
            translate([0,0,h11+hB1+h12+hB2])
            cylinder(h2,r2,r2);
            translate([0,0,h11+hB1+h12+hB2+h2+hB3])
            cylinder(h3,r3,r3);
            translate([0,0,h11+hB1+h12+hB2+h2+hB3+h3+hB4])
            cylinder(h4,r4,r4);
        }
        #cylinder(altTotal,rInt-esp,rInt-esp);
    }
}
module rosa(){
    color("pink")
    difference(){
        union(){
            translate([0,0,h11])
            cylinder(hB1,rB1,rB1);
            translate([0,0,h11+hB1+h12])
            cylinder(hB2,rB2,rB2);
            translate([0,0,h11+hB1+h12+hB2+h2])
            cylinder(hB3,rB3,rB3);
            translate([0,0,h11+hB1+h12+hB2+h2+hB3+h3])
            cylinder(hB4,rB4,rB4);
        }
        cylinder(altTotal,rInt,rInt);
    }
}

module pop(){
    translate([0,0,altTotal])
    for(i=[1:1:quantas]){
        rotate([0,0,i*Theta])
        rotate_extrude(angle=(theta-Theta))
        translate([rInt-esp,0,0]){
            square([esp,hPop]);
            translate([esp,hPop-esp1,0])square([esp1,esp1]);
        }
    }
}

// ----- ----- MAIN ----- ----- //
branco();
rosa();
pop();

color("orange")
translate([0,0,-esp5]){
    difference(){
        union(){
            cylinder(esp5,r1+esp5,r1+esp5);
            translate([0,0,esp5])difference(){
                cylinder(h11+hB1+h12,r1+esp5,r1+esp5);
                #cylinder(h11+hB1+h12,r1+folga1,r1+folga1);
            }
        }
        #translate([0,0,-altTotal/2])cylinder(altTotal,20,20);
    }
}