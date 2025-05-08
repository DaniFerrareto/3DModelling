// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;
folga1=0.125;

cubox=50-35;
cuboy=50;
cuboz=60;
rBob=15;
esp=2.5;

rInt=10.45;
rExt=12.45;
alt=15;

supr=18;
supalt=5;

// Estamos nos referindo aqui ao encaixe do interior
encx=54.5;
ency=54.5;
encz=10;
espenc=2;

// ----- ----- ----- Declaração de Funções ----- ----- ----- //
use <funcoes_GFCx.scad>
use <funcSuporteDoCuboBaixo_v2.scad>

// ----- ----- ----- MAIN ----- ----- ----- //
r_splh=1;
altu=100;
altbolacha=5;
altstepbolacha=1;

difference(){
    translate([0,0,0]){
        cylinder(altstepbolacha,(cubox-2*esp)/2+esp-folga1,(cubox-2*esp)/2+esp-folga1,$fn=res);
        cylinder(altbolacha,(cubox-2*esp)/2-folga1,(cubox-2*esp)/2-folga1,$fn=res);
    }
    #cylinder(altbolacha,r_splh,r_splh,$fn=res);
}