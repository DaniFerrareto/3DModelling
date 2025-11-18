//base
difference(){
cube([65,40,8]);
#translate([7.5,7.5,0])cylinder(h=8, r=3.1);
#translate([57.5,7.5,0])cylinder(h=8, r=3.1);
#translate([7.5,32.5,0])cylinder(h=8, r=3.1);
#translate([57.5,32.5,0])cylinder(h=8, r=3.1);
}

//apoio inferior com aberturas
difference(){translate([32.5,20,18])
    // cubo principal
        cube([20,8,20], center=true);
    // abertura interior
    #translate([32.5,20,18])
        cube([17.2,4.2,20], center=true);
    // abertura para o prego
   #translate([32.5,24,21])rotate(a=[90,0,0])
        cylinder(h=8, r=3.1 );}
//
        
//apoio superior
   difference(){translate([32.5,20,40])
    // cubo principal
        cube([17,4,20], center=true);
    // aberturas para os pregos
 #translate([32.5,22,36])rotate(a=[90,0,0])
        cylinder(h=4, r=3.1 );
 #translate([32.5,22,45])rotate(a=[90,0,0])
        cylinder(h=4, r=3.1 );}
//
        
// Concha de suporte inferior
difference(){translate([23,20,54.5])rotate(a=[0,90,0])
        cylinder(h=18, r=6.5 );
    
// Abertura interior    
#translate([23,20,54.5])rotate(a=[0,90,0])
        cylinder(h=18, r=4.5 );
    
// corte de separação das conchas
#translate([23,13.5,54.5]) cube([18,13,6.5]);
}
//

// Retângulo ligado a concha inferior
{
// lado perto da origem
difference(){translate([23,5.5,51.5]) cube([18,10,3]);
    
    // abertura para o prego
#translate([32.5,10,51.5]) cylinder(h=3, r=3.1 );
}
//

//lado longe da origem
difference(){translate([23,25,51.5]) cube([18,10,3]);
    
    // abertura para o prego
#translate([32.5,30.5,51.5]) cylinder(h=3, r=3.1 );
}
}
//



//Concha de suporte superior
difference(){translate([23,20,54.5])rotate(a=[0,90,0])
        cylinder(h=18, r=6.5 );
    
// Abertura interior    
#translate([23,20,54.5])rotate(a=[0,90,0])
        cylinder(h=18, r=4.5 );
    
// corte de separação das conchas
#translate([23,13,48.5]) cube([18,13,6.5]);
}
//

// Retângulo ligado a concha superior
{
// lado perto da origem
difference(){translate([23,5.5,55]) cube([18,10,3]);
    
    // abertura para o prego
#translate([32.5,10,55]) cylinder(h=3, r=3.1 );
}
//

//lado longe da origem
difference(){translate([23,25,55]) cube([18,10,3]);
    
    // abertura para o prego
#translate([32.5,30,55]) cylinder(h=3, r=3.1 );
}
}
//