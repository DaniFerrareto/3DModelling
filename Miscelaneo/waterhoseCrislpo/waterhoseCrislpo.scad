// ----- ----- Water Hose (Crislpo) ----- ----- //

// ----- Declaracao de Variaveis ----- //

$fn=50;
folga1=0.150;

altPont=6.55;
lat=19.3;
comp1=18;

espAlt=1.5;
esp2Lat=3.8;
esp2Comp=3.1;
lacunComp=11.8;

/*
Sistema de Equacoes
\begin{align}
    \begin{cases}
        h + x = r
        \frac{l^2}{4} + x^2 = r^2
    \end{cases}
\end{align}
Resolvendo
\begin{align}
    r = \frac{h}{2} + \frac{l^2}{8h}
\end{align}
*/

l=7.1;
h=1.1;
r = (h/2) + l*l/(8*h);
espcirc=1.4;

ang=110;

altTri=11.35;
compTri=65;

angrot = 9.90486; //arctan(altTri/compTri)
hipaux = compTri*compTri + altTri*altTri;
hip=sqrt(hipaux);

oFF=10;

encesp=5.4-1.85;
encrInt=8.2/2;
//encrExt=altTri=11.35;

l2=3.15;
h2=3.15-1.85;
r2 = (h2/2) + l2*l2/(8*h2);

// ----- Declaracao de Bibliotecas ----- //

// ----- Declaracao de Funcoes ----- //

module curvinha(){
    translate([0,(3/4)*esp2Comp,altTri+oFF])rotate([90,0,0])rotate([0,0,-90])
    rotate_extrude(angle=-70){
        translate([oFF,0,0])square([altTri,(3/4)*esp2Comp]);
    }
}

module curvinha2(){
    translate([0,(3/4)*esp2Comp,altTri+oFF])rotate([90,0,0])rotate([0,0,-90])
    rotate_extrude(angle=-70){
        translate([oFF,0,0])square([espAlt,lat]);
    }
}

module enc(mud){
    difference(){
        translate([0,0,-r2+h2])sphere(r2);
        #rotate([90,0,0])translate([0,0,-encesp])cylinder(encesp,encrInt,encrInt);
    }
    rotate([90,0,0])
    difference(){
        translate([-altTri/2,-mud,0])cube([altTri,mud,encesp]);
        #cylinder(encesp,encrInt,encrInt);
    }
}

// ----- MAIN ----- //

translate([0,0,altTri+oFF])
rotate([0,70,0])
translate([-comp1,0,-altPont-oFF])
difference(){
    cube([comp1,lat,altPont]);
    #translate([esp2Comp,esp2Comp,0])cube([comp1-esp2Comp,lat-2*esp2Comp,altPont-espAlt]);
    #translate([esp2Comp,esp2Lat,altPont-espAlt])cube([lacunComp,lat-2*esp2Lat,espAlt]);
}


difference(){
    cube([compTri,lat,altTri]);
    #translate([0,0,altTri+1])rotate([0,angrot,0])cube([hip,lat,altTri]);
    #translate([0,(3/4)*esp2Comp,altTri-1])rotate([0,angrot,0])translate([0,0,-altTri])cube([hip,lat-(3/2)*esp2Comp,altTri]);
}

difference(){
    union(){
        curvinha();
        translate([0,lat-(3/4)*esp2Comp,0]){
            curvinha();
            curvinha2();
        }
    }
    #translate([0,0,altTri+oFF])
    #rotate([0,70,0])
    #translate([-comp1,0,-2*altPont-oFF])
    #cube([3*comp1,lat+1,altPont]);
}

translate([-5.5,0,6.5])
rotate([0,25+180,0]){
    translate([0,lat-(3/4)*esp2Comp,0])enc(6);
    translate([0,(3/4)*esp2Comp,0])rotate([0,0,180])enc(6);
}