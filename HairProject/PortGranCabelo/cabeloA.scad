// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;
folga1=0.125;

esp=5;
compriObilongo=20;
largObi=5.85;

basePortax=56;
basePortay=2.85;
basePortaz=15;
PortaR=5.7/2;
PortaAlt=basePortay;
entrePorta=(52.7+41.25)/2;

haste1x=30;
haste1z=30;

haste2x=10;
haste2z=10;

haste3x=10;
haste3z=60+20;

haste4x=10;
haste4z=10;

portax=18;
portaz=8;

entreFuros=(8.6+12.9)/2;
rFuro=2.1/2;
rFuro2=4.1/2;

vao=0.5;

entrePard=58-22-6*folga1;

// ----- ----- ----- Declaração de Funções ----- ----- ----- //

// ----- ----- ----- MAIN ----- ----- ----- //
translate([0,0,basePortaz])
difference(){
    translate([0,0,0]){
        cube([haste2x,esp,haste1z]);
        //translate([-basePortax/2+haste2x/2,-esp-(3/2)*basePortay,0])cube([basePortax,esp+(6.5/2)*basePortay,esp]);
        translate([0,-esp-(3/2)*basePortay,0])cube([haste2x,esp+(3/2)*basePortay,haste1z]);
        translate([0,0,haste1z])cube([haste2x,esp,haste2z]);
        translate([0,0,haste1z+haste2z])cube([haste3x,esp,haste3z]);
        translate([0,0,haste1z+haste2z+haste3z])cube([haste2x,esp,haste2z]);
        translate([haste2x-haste3x,0,haste1z+haste2z])cube([haste4x,esp,haste4z]);
        translate([haste2x-haste3x+haste4x/2-portax/2,-esp,haste1z+haste2z+haste4z-portaz])cube([portax,esp,portaz]);
        translate([haste2x-haste3x+haste4x/2-portax/2,0,haste1z+haste2z+haste4z-portaz])cube([portax,esp,portaz]);//
        translate([haste2x-haste3x+haste4x/2-portax/2,-2*esp,haste1z+haste2z+haste4z-portaz])cube([portax,esp,portaz]);
        translate([haste2x-haste3x,0,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz])cube([haste4x,esp,haste4z+haste2z+compriObilongo-portaz]);
        translate([haste2x-haste3x,-esp,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz])cube([haste4x,esp,haste4z+haste2z+compriObilongo-portaz]);
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
    #cylinder(3*esp,rFuro,rFuro,$fn=res);
    
    #translate([entreFuros/2,-2*esp,haste1z+haste2z+haste3z-haste4z-20])
    #translate([haste2x-haste4x/2,0,portaz/2])
    #rotate([-90,0,0])
    #cylinder(3*esp,rFuro,rFuro,$fn=res);
    
    #translate([-entreFuros/2,0,haste1z+haste2z+haste3z-haste4z-20])
    #translate([haste2x-haste4x/2,0,portaz/2])
    #rotate([-90,0,0])
    #cylinder(3*esp,rFuro2+folga1,rFuro2+folga1,$fn=6);
    
    #translate([entreFuros/2,0,haste1z+haste2z+haste3z-haste4z-20])
    #translate([haste2x-haste4x/2,0,portaz/2])
    #rotate([-90,0,0])
    #cylinder(3*esp,rFuro2+folga1,rFuro2+folga1,$fn=6);
    
    //Furo Obilongo
    #hull(){
        #translate([haste2x-haste4x/2,-2*esp,haste1z+haste2z+haste3z-haste4z-20+(3/2)*portaz])
        #rotate([-90,0,0])
        #cylinder(4*esp,largObi/2,largObi/2,$fn=res);
        
        #translate([0,0,haste4z+compriObilongo-2*portaz+haste2z])
        #translate([haste2x-haste4x/2,-2*esp,haste1z+haste2z+haste3z-haste4z-20+(3/2)*portaz])
        #rotate([-90,0,0])
        #cylinder(4*esp,largObi/2+folga1,largObi/2+folga1,$fn=res);
    }
    
    #translate([haste2x-haste4x/2,-esp,0])
    #rotate([0,0,45])
    #translate([-vao/2,-vao/2,0])
    #cube([vao,vao,haste1z+2*haste2z+haste3z]);
}

// Encaixe
translate([haste2x-haste4x/2,-basePortax/2-esp,0])
rotate([0,0,90])
translate([-(haste2x-haste4x/2-basePortax/2),esp,0])
difference(){
    translate([haste2x-haste4x/2-basePortax/2,-esp-basePortay/2,0])cube([basePortax,basePortay,basePortaz]);
    
    #translate([haste2x-haste4x/2-entrePorta/2,-esp+basePortay/2,basePortaz/2])
    #rotate([90,0,0])
    #cylinder(PortaAlt,PortaR,PortaR);
    
    #translate([haste2x-haste4x/2+entrePorta/2,-esp+basePortay/2,basePortaz/2])
    #rotate([90,0,0])
    #cylinder(PortaAlt,PortaR,PortaR);
}

// Sustentação 1 
poliedro1Points = [[      0,       -esp-basePortax/2,         basePortaz],  //0
                   [      0,       -esp+basePortax/2,         basePortaz],  //1
                   [haste2x,       -esp+basePortax/2,         basePortaz],  //2
                   [haste2x,       -esp-basePortax/2,         basePortaz],  //3
                   [      0, -(esp+(3/2)*basePortay), basePortaz+haste1z],  //4
                   [      0,                       0, basePortaz+haste1z],  //5
                   [haste2x,                       0, basePortaz+haste1z],  //6
                   [haste2x, -(esp+(3/2)*basePortay), basePortaz+haste1z]]; //7
  
poliedro1Faces = [[0,1,2,3],  // baixo
                  [4,5,1,0],  // frente
                  [7,6,5,4],  // cima
                  [5,6,2,1],  // direita
                  [6,7,3,2],  // trazeira
                  [7,4,0,3]]; // esquerda
  
polyhedron( poliedro1Points, poliedro1Faces );

// Sustentação 2
poliedro2Points = [[      0, -esp-entrePard/2,          0],  //0
                   [      0, -esp+entrePard/2,          0],  //1
                   [haste2x, -esp+entrePard/2,          0],  //2
                   [haste2x, -esp-entrePard/2,          0],  //3
                   [      0, -esp-entrePard/2, basePortaz],  //4
                   [      0, -esp+entrePard/2, basePortaz],  //5
                   [haste2x, -esp+entrePard/2, basePortaz],  //6
                   [haste2x, -esp-entrePard/2, basePortaz]]; //7
  
poliedro2Faces = [[0,1,2,3],  // baixo
                  [4,5,1,0],  // frente
                  [7,6,5,4],  // cima
                  [5,6,2,1],  // direita
                  [6,7,3,2],  // trazeira
                  [7,4,0,3]]; // esquerda
  
polyhedron( poliedro2Points, poliedro2Faces );
