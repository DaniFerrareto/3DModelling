// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;

base0raio=20/2;
base0altura=6-2;

base1raio=21.7/2;
base1altura=2;

base2raio=20/2;
base2altura=4;

base3raio1=15.5/2;
base3raio2=11.5/2;
base3altura=21.5;

base4raio1=11.5/2;
base4raio2=8.4/2;
base4altura=3;

base5raio=8.4/2;
base5altura=7;

base6raio=10.75/2;
base6altura=0.5;

base7raio1=5.5;
base7raio2=3;
base7altura=3.5;

argolasraio=10;
argolasaltura=3.5;
entreArgolas=2*base0raio-2*argolasaltura;

notargolas1raio=15.5/2;
notargolas1altura=1.5;
notargolas2raio=12.5/2;
notargolas2altura=2;

aux0=(base0raio*base0raio)-((entreArgolas*entreArgolas)/4);
aux1=sqrt(aux0);
aux2=(argolasraio*argolasraio)-(aux1*aux1);
cilinderDepressionOffset=argolasraio-sqrt(aux2);
cilinderDepressionEncaixe=sqrt(aux1);

use <FusoEstranho.scad>
translate([0,0,base1altura+base2altura])FusoEstranho();
// ----- ----- ----- Main ----- ----- ----- //

        
// Bases
translate([0,0,base1altura+base2altura])cylinder(base3altura,base3raio1,base3raio2,$fn=res);
translate([0,0,base1altura+base2altura+base3altura])cylinder(base4altura,base4raio1,base4raio2,$fn=res);
translate([0,0,base1altura+base2altura+base3altura+base4altura])cylinder(base5altura,base5raio,base5raio,$fn=res);
translate([0,0,base1altura+base2altura+base3altura+base4altura+base5altura])cylinder(base6altura,base6raio,base6raio,$fn=res);
translate([0,0,base1altura+base2altura+base3altura+base4altura+base5altura+base6altura])cylinder(base7altura,base7raio1,base7raio2,$fn=res);

difference(){
    translate([0,0,-base0altura])cylinder(base0altura,base0raio,base0raio,$fn=res);
    #translate([-argolasraio,-entreArgolas/2,-base0altura-2*argolasraio])
    #cube([2*argolasraio,entreArgolas,base0altura+2*argolasraio]);
  
    #translate([0,-entreArgolas/2-argolasaltura+notargolas1altura,-base0altura-notargolas2raio])
    #rotate([90,0,0])
    #cylinder(notargolas1altura,notargolas1raio,notargolas1raio,$fn=res);
    #translate([0,entreArgolas/2+argolasaltura-notargolas1altura,-base0altura-notargolas2raio])
    #rotate([-90,0,0])
    #cylinder(notargolas1altura,notargolas1raio,notargolas1raio,$fn=res);
    
    #translate([0,-entreArgolas/2,-base0altura-notargolas2raio])
    #rotate([90,0,0])
    #cylinder(notargolas2altura,notargolas2raio,notargolas2raio,$fn=res);
    #translate([0,entreArgolas/2,-base0altura-notargolas2raio])
    #rotate([-90,0,0])
    #cylinder(notargolas2altura,notargolas2raio,notargolas2raio,$fn=res);
}

difference(){
    translate([0,0,0]){
        cylinder(base1altura,base1raio,base1raio,$fn=res);
        translate([0,0,base1altura])cylinder(base2altura,base2raio,base2raio,$fn=res);
    }
    #translate([0,0,-argolasraio])
    #translate([0,0,cilinderDepressionOffset])
    #rotate([90,0,0])
    #cylinder(entreArgolas,argolasraio,argolasraio,$fn=res,center=true);
}

// Argolas
difference(){
    translate([0,0,0]){
        translate([0,-entreArgolas/2,-base0altura-notargolas2raio])
        rotate([90,0,0])
        cylinder(argolasaltura,argolasraio,argolasraio,$fn=res);
        translate([0,entreArgolas/2,-base0altura-notargolas2raio])
        rotate([-90,0,0])
        cylinder(argolasaltura,argolasraio,argolasraio,$fn=res);
    }
    
    #translate([0,-entreArgolas/2-argolasaltura+notargolas1altura,-base0altura-notargolas2raio])
    #rotate([90,0,0])
    #cylinder(notargolas1altura,notargolas1raio,notargolas1raio,$fn=res);
    #translate([0,entreArgolas/2+argolasaltura-notargolas1altura,-base0altura-notargolas2raio])
    #rotate([-90,0,0])
    #cylinder(notargolas1altura,notargolas1raio,notargolas1raio,$fn=res);
    
    #translate([0,-entreArgolas/2,-base0altura-notargolas2raio])
    #rotate([90,0,0])
    #cylinder(notargolas2altura,notargolas2raio,notargolas2raio,$fn=res);
    #translate([0,entreArgolas/2,-base0altura-notargolas2raio])
    #rotate([-90,0,0])
    #cylinder(notargolas2altura,notargolas2raio,notargolas2raio,$fn=res);
}


