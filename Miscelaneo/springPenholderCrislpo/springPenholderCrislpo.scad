// ----- ----- Spring Penholder ----- ----- //

// ----- Declaracao de Variaveis ----- //
$fn=100;
res=0.2;
esp1=3;

ringdiam = 40;  // Diameter of the ring
ringx = 10;  // Thickness of the ring
ringy = 15;     // Height of each ring
num_rings = 5;       // Number of rings

// ----- Declaracao de Bibliotecas ----- //

// ----- Declaracao de Funcoes ----- //

// ----- MAIN ----- //

rotate_extrude(){
    translate([res+ringdiam,0,0])square([ringx,2*ringy+esp1]);
}
cylinder(esp1,ringdiam,ringdiam);


melhor=3;
cima=1/melhor;
roda=10/melhor;

for(i=[0:1:120*melhor]){
    hull(){
        rotate([0,0,i*roda])
        translate([res+ringdiam,0,i*cima])
        rotate([90,0,0])cube([ringx,ringy,0.01]);
        rotate([0,0,(i+1)*roda])
        translate([res+ringdiam,0,(i+1)*cima])
        rotate([90,0,0])cube([ringx,ringy,0.01]);
    }
}