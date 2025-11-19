// ----- ----- Declaração de Variáveis ----- ----- //
folga=0.150;

px=9.15;
py=3.15;
pz1=16.3;
pz2=22.3;

esp=2;

// ----- ----- Declaração de Variáveis ----- ----- //

// ----- ----- MAIN ----- ----- //
difference(){
    translate([-esp,-esp,0])
    cube([px+2*folga+2*esp,py+2*folga+2*esp,pz1+2*folga]);
    #cube([px+2*folga,py+2*folga,pz1+2*folga]);
//translate([10,0,0])cube([px,py,pz2]);
}

translate([-esp,0,0])
rotate([0,-90,0])
cube([px+2*folga,py+2*folga,pz1+2*folga]);