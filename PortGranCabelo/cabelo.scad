// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;
folga1=0.125;

esp=5;
compriObilongo=20;
largObi=5.85;

haste1x=30;
haste1z=30;

haste2x=60;
haste2z=10;

haste3x=10;
haste3z=60+20;

haste4x=10;
haste4z=10;

portax=18;
portaz=8;

entreFuros=(8.6+12.9)/2;
rFuro=2.1/2;

vao=0.5;

// ----- ----- ----- Declaração de Funções ----- ----- ----- //

// ----- ----- ----- MAIN ----- ----- ----- //
difference(){
    translate([0,0,0]){
        cube([haste1x,esp,haste1z]);
        translate([0,0,haste1z])cube([haste2x,esp,haste2z]);
        translate([0,0,haste1z+haste2z])cube([haste3x,esp,haste3z]);
        translate([0,0,haste1z+haste2z+haste3z])cube([haste2x,esp,haste2z]);
        translate([haste2x-haste3x,0,haste1z+haste2z])cube([haste4x,esp,haste4z]);
        translate([haste2x-haste3x+haste4x/2-portax/2,-esp,haste1z+haste2z+haste4z-portaz])cube([portax,esp,portaz]);
        translate([haste2x-haste3x+haste4x/2-portax/2,0,haste1z+haste2z+haste4z-portaz])cube([portax,esp,portaz]);//
        translate([haste2x-haste3x+haste4x/2-portax/2,-2*esp,haste1z+haste2z+haste4z-portaz])cube([portax,esp,portaz]);
        translate([haste2x-haste3x,0,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz])cube([haste4x,esp,haste4z+compriObilongo-portaz]);
        translate([haste2x-haste3x,-esp,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz])cube([haste4x,esp,haste4z+compriObilongo-portaz]);
        translate([haste2x-haste3x+haste4x/2-portax/2,-esp,haste1z+haste2z+haste3z-haste4z-compriObilongo])cube([portax,esp,portaz]);
        translate([haste2x-haste3x+haste4x/2-portax/2,-esp,haste1z+haste2z+haste3z-haste4z-compriObilongo])cube([portax,esp,portaz]);
        translate([haste2x-haste3x+haste4x/2-portax/2,-2*esp,haste1z+haste2z+haste3z-haste4z-compriObilongo])cube([portax,esp,portaz]);
    }
    
    // Furos do Porta
    #translate([-entreFuros/2,-2*esp,0])
    #translate([haste2x-haste4x/2,0,haste1z+haste2z+haste4z-portaz/2])
    #rotate([-90,0,0])
    #cylinder(3*esp,rFuro,rFuro,$fn=res);
    
    #translate([entreFuros/2,-2*esp,0])
    #translate([haste2x-haste4x/2,0,haste1z+haste2z+haste4z-portaz/2])
    #rotate([-90,0,0])
    #cylinder(3*esp,rFuro,rFuro,$fn=res);
    
    #translate([-entreFuros/2,-2*esp,haste1z+haste2z+haste3z-haste4z-20])
    #translate([haste2x-haste4x/2,0,portaz/2])
    #rotate([-90,0,0])
    #cylinder(2*esp,rFuro,rFuro,$fn=res);
    
    #translate([entreFuros/2,-2*esp,haste1z+haste2z+haste3z-haste4z-20])
    #translate([haste2x-haste4x/2,0,portaz/2])
    #rotate([-90,0,0])
    #cylinder(2*esp,rFuro,rFuro,$fn=res);
    
    //Furo Obilongo
    #hull(){
        #translate([haste2x-haste4x/2,-2*esp,haste1z+haste2z+haste3z-haste4z-20+(3/2)*portaz])
        #rotate([-90,0,0])
        #cylinder(4*esp,largObi/2,largObi/2,$fn=res);
        
        #translate([0,0,haste4z+compriObilongo-2*portaz])
        #translate([haste2x-haste4x/2,-2*esp,haste1z+haste2z+haste3z-haste4z-20+(3/2)*portaz])
        #rotate([-90,0,0])
        #cylinder(4*esp,largObi/2+folga1,largObi/2+folga1,$fn=res);
    }
    
    #translate([haste2x-haste4x/2,-esp,0])
    #rotate([0,0,45])
    #translate([-vao/2,-vao/2,0])
    #cube([vao,vao,haste1z+2*haste2z+haste3z]);
}