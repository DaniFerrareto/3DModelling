// ----- ----- ----- Porta Sabonete ----- ----- ----- //

// ----- ----- Declaração de Variáveis ----- ----- //
$fn=100;

esp=5;

raio=1.5;

lado=25.3;

x=90;
y=65;

// ----- ----- MAIN ----- ----- //
difference(){
    difference(){
        cube([x+2*esp,y+2*esp,2*esp]);
        #translate([esp,esp,esp])cube([x,y,esp]);
    }
    #translate([1*lado,0,raio])rotate([-90,0,0])cylinder(y+2*esp,raio,raio);
    #translate([2*lado,0,raio])rotate([-90,0,0])cylinder(y+2*esp,raio,raio);
    #translate([3*lado,0,raio])rotate([-90,0,0])cylinder(y+2*esp,raio,raio);
    #translate([1*lado-raio,0,raio])rotate([-90,0,0])cube([2*raio,raio,y+2*esp]);
    #translate([2*lado-raio,0,raio])rotate([-90,0,0])cube([2*raio,raio,y+2*esp]);
    #translate([3*lado-raio,0,raio])rotate([-90,0,0])cube([2*raio,raio,y+2*esp]);
}