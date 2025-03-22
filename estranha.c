// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;

base0raio=9;
base0altura=4;

base1raio=10;
base1altura=1;

base2raio=9;
base2altura=3;

base3raio1=7;
base3raio2=6;
base3altura=30;

base4raio1=6;
base4raio2=5;
base4altura=3;

base5raio=5;
base5altura=7;

base6raio=5.5;
base6altura=1;

base7raio1=5.5;
base7raio2=3;
base7altura=4;

argolasraio=10;
argolasaltura=2;
entreArgolas=2*base0raio-2*argolasaltura;

notargolas1raio=9;
notargolas1altura=1;
notargolas2raio=8;
notargolas2altura=1;

aux0=(base0raio*base0raio)-((entreArgolas*entreArgolas)/4);
aux1=sqrt(aux0);
aux2=(argolasraio*argolasraio)-(aux1*aux1);
cilinderDepressionOffset=argolasraio-sqrt(aux2);
cilinderDepressionEncaixe=sqrt(aux1);


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
        translate([0,-entreArgolas/2,-base0altura-argolasraio])
        rotate([90,0,0])
        cylinder(argolasaltura,argolasraio,argolasraio,$fn=res);
        translate([0,entreArgolas/2,-base0altura-argolasraio])
        rotate([-90,0,0])
        cylinder(argolasaltura,argolasraio,argolasraio,$fn=res);
    }
    
    #translate([0,-entreArgolas/2-argolasaltura+notargolas1altura,-base0altura-argolasraio])
    #rotate([90,0,0])
    #cylinder(notargolas1altura,notargolas1raio,notargolas1raio,$fn=res);
    #translate([0,entreArgolas/2+argolasaltura-notargolas1altura,-base0altura-argolasraio])
    #rotate([-90,0,0])
    #cylinder(notargolas1altura,notargolas1raio,notargolas1raio,$fn=res);
    
    #translate([0,-entreArgolas/2,-base0altura-argolasraio])
    #rotate([90,0,0])
    #cylinder(notargolas2altura,notargolas2raio,notargolas2raio,$fn=res);
    #translate([0,entreArgolas/2,-base0altura-argolasraio])
    #rotate([-90,0,0])
    #cylinder(notargolas2altura,notargolas2raio,notargolas2raio,$fn=res);
}


