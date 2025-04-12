// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;
folga=0.125;

rCone=20;
theta=70;
altCone=rCone/tan(theta);
esp=1;
x_esp=esp/sin(theta);
y_esp=esp/sin(90-theta);
menos=5.5;

bx=2.5*esp;
by=1;
aux=(rCone-esp/2)^2+(altCone-esp/2)^2;
bz=sqrt(aux);

// ----- ----- ----- Declaração de Funções ----- ----- ----- //

// ----- ----- ----- MAIN ----- ----- ----- //
difference(){
    cylinder(altCone,rCone,0,$fn=res);
    #cylinder(altCone-x_esp,rCone-y_esp,0,$fn=res);
    #translate([-(menos/2)*sin(theta),0,(menos/2)*cos(theta)])
    #translate([rCone-y_esp/2,0,0])
    #rotate([0,-theta,0])
    #translate([-bx/2,-by/2,0])
    #cube([bx,by,bz-menos]);
}