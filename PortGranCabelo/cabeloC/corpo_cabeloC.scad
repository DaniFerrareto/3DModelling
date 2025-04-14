// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;
folga1=0.125;

esp=5;
compriObilongo=20;
largObi=6+folga1;

basePortax=56;
basePortay=2.85;
basePortaz=15;
PortaR=5.7/2;
PortaAlt=basePortay;
entrePorta=(52.7+41.25)/2;

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

entrePard=58-22-6*folga1;

// ----- ----- ----- Declaração de Funções ----- ----- ----- //

// ----- ----- ----- MAIN ----- ----- ----- //
translate([0,0,basePortaz])
difference(){
    translate([0,0,0]){
        cube([haste2x,esp,haste1z]);
        translate([0,-esp-(3/2)*basePortay,0])cube([haste2x,esp+(3/2)*basePortay,haste1z]);
        translate([0,0,haste1z])cube([haste2x,esp,haste2z]);
        translate([0,0,haste1z+haste2z])cube([haste3x,esp,haste3z]);
        translate([0,0,haste1z+haste2z+haste3z])cube([haste2x,esp,haste2z]);
        translate([haste2x-haste3x,0,haste1z+haste2z])cube([haste4x,esp,haste4z-portaz]);
        //translate([haste2x-haste3x+haste4x/2-portax/2,-esp,haste1z+haste2z+haste4z-portaz])cube([portax,esp,portaz]);
        //translate([haste2x-haste3x+haste4x/2-portax/2,0,haste1z+haste2z+haste4z-portaz])cube([portax,esp,portaz]);//
        //translate([haste2x-haste3x+haste4x/2-portax/2,-2*esp,haste1z+haste2z+haste4z-portaz])cube([portax,esp,portaz]);
        translate([haste2x-haste3x,0,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz])cube([haste4x,esp,haste4z+compriObilongo-portaz]);
        //translate([haste2x-haste3x,-esp,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz])cube([haste4x,esp,haste4z+compriObilongo-portaz+haste4z]);
        //translate([haste2x-haste3x+haste4x/2-portax/2,-esp,haste1z+haste2z+haste3z-haste4z-compriObilongo])cube([portax,esp,portaz]);
        //translate([haste2x-haste3x+haste4x/2-portax/2,-esp,haste1z+haste2z+haste3z-haste4z-compriObilongo])cube([portax,esp,portaz]);
        //translate([haste2x-haste3x+haste4x/2-portax/2,-2*esp,haste1z+haste2z+haste3z-haste4z-compriObilongo])cube([portax,esp,portaz]);
        // Reforço Curvo
        translate([haste3x,0,haste1z+haste2z])cube([haste3x,esp,haste3x]);//
        translate([haste3x,0,-haste2z+haste1z+haste2z+haste3z])cube([haste2z,esp,haste2z]);//
        translate([haste2x-haste3x-haste4x,0,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz])cube([haste4x,esp,haste4z+compriObilongo-portaz+haste4z]);//
        // Reforço nos Furos Obilongos
        // Em baixo:
        translate([haste2x,0,-compriObilongo+haste1z])cube([5,esp,-portaz+haste4z+compriObilongo+haste2z]);
        // Em cima:
        translate([haste2x-haste3x+haste4x,0,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz])cube([5,esp,haste4z+compriObilongo-portaz+haste4z]);
        translate([haste2x-haste3x-5,0,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz])cube([5,esp,haste4z+compriObilongo-portaz+haste4z]);
    }
    
    // Reforço Curvo
    //#translate([haste2x-haste3x-haste4x,esp,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz+compriObilongo-portaz])rotate([90,0,0])cylinder(esp,haste4z,haste4z,$fn=res);
    #translate([haste3x+haste2z,esp,-haste2z+haste1z+haste2z+haste3z])rotate([90,0,0])cylinder(esp,haste2z,haste2z,$fn=res);
    #translate([haste3x+haste3x,esp,haste3x+haste1z+haste2z])rotate([90,0,0])cylinder(esp,haste3x,haste3x,$fn=res);
    
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
    
    //Furo Obilongo de Cima
    #hull(){
        #translate([haste2x-haste4x/2,-2*esp,haste1z+haste2z*1.2+haste3z-haste4z-20+(3/2)*portaz])
        #rotate([-90,0,0])
        #cylinder(4*esp,largObi/2,largObi/2,$fn=res);
        
        #translate([0,0,haste4z+compriObilongo-2*portaz+haste2z*0.8])
        #translate([haste2x-haste4x/2,-2*esp,haste1z+haste2z+haste3z-haste4z-20+(3/2)*portaz])
        #rotate([-90,0,0])
        #cylinder(4*esp,largObi/2+folga1,largObi/2+folga1,$fn=res);
    }
    
    // Furo Obilongo de Baixo
    #hull(){
        #translate([haste2x-haste4x/2,-2*esp,haste1z+haste2z*0.8+haste3z-3*haste4z-3*20+(1)*portaz])
        #rotate([-90,0,0])
        #cylinder(4*esp,largObi/2,largObi/2,$fn=res);
        
        #translate([0,0,-(haste4z+compriObilongo-2*portaz+haste2z*0.8)])
        #translate([haste2x-haste4x/2,-2*esp,haste1z+haste2z+haste3z-3*haste4z-3*20+(1)*portaz])
        #rotate([-90,0,0])
        #cylinder(4*esp,largObi/2+folga1,largObi/2+folga1,$fn=res);
    }
    
    #translate([-4*folga1,0,-portaz-(haste4z+compriObilongo-2*portaz+haste2z)])
    #translate([haste2x-haste3x+haste4x/2-portax/2,-2*esp,haste1z+haste2z+haste4z-portaz])
    #cube([portax+8*folga1,2*esp,portaz+haste4z+compriObilongo-2*portaz+haste2z]);
    
    //#translate([haste2x-haste4x/2,-esp,0])
    //#rotate([0,0,45])
    //#translate([-vao/2,-vao/2,0])
    //#cube([vao,vao,haste1z+2*haste2z+haste3z]);
}

difference(){
    translate([haste2x-haste4x/2-basePortax/2,-esp-basePortay/2,0])cube([basePortax,basePortay,basePortaz]);
    
    #translate([haste2x-haste4x/2-entrePorta/2,-esp+basePortay/2,basePortaz/2])
    #rotate([90,0,0])
    #cylinder(PortaAlt,PortaR,PortaR,$fn=res);
   
    #translate([haste2x-haste4x/2+entrePorta/2,-esp+basePortay/2,basePortaz/2])
    #rotate([90,0,0])
    #cylinder(PortaAlt,PortaR,PortaR,$fn=res);
    //entrePorta
}


// Sustentação 1 
poliedro1Points = [[                       haste2x, -(esp+(3/2)*basePortay),         basePortaz],  //0
                   [haste2x-haste4x/2+basePortax/2, -(esp+(3/2)*basePortay),         basePortaz],  //1
                   [haste2x-haste4x/2+basePortax/2,                     esp,         basePortaz],  //2
                   [                       haste2x,                     esp,         basePortaz],  //3
                   [                       haste2x, -(esp+(3/2)*basePortay), basePortaz+haste1z],  //4
                   [                       haste2x,                     esp, basePortaz+haste1z]]; //5
 
poliedro1Faces = [[0,1,2,3],  // baixo
                    [0,1,4],  // frente
                              // cima
                  [1,4,5,2],  // direita
                    [5,3,2],  // trazeira
                  [5,4,0,3]]; // esquerda

translate([haste2x,-(esp+(3/2)*basePortay),basePortaz])cube([-haste4x/2+basePortax/2,esp+(esp+(3/2)*basePortay),10]);

// Sustentação 2
translate([basePortax/2-entrePard/2,0,0])
translate([haste2x-haste4x/2-basePortax/2,-esp-(3/2)*basePortay,0])
cube([entrePard,esp+esp+(3/2)*basePortay,basePortaz]);

// Furo Obilongo de Baixo
//translate([haste2x-haste3x,-esp,haste1z+haste2z+haste3z-haste4z-compriObilongo+portaz-3*haste4z-3*20+portaz+10])cube([haste4x,esp,haste4z+compriObilongo-portaz+haste4z]);
