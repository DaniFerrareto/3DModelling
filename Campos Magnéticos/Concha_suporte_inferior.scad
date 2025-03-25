
rotate([0,180,0])translate([0,0,-30])
union(){//apoio superior
   difference(){translate([32.5,20,40])
    // cubo principal
        cube([17,4,20], center=true);
    // aberturas para os pregos
 #translate([32.5,22,36])rotate(a=[90,0,0])
        cylinder(h=4, r=3.1, $fn=100);
 #translate([32.5,22,45])rotate(a=[90,0,0])
        cylinder(h=4, r=3.1, $fn=100);}
//
        
// Concha de suporte inferior
difference(){translate([23,20,54.5])rotate(a=[0,90,0])
        cylinder(h=18, r=7, $fn=100);
    
// Abertura interior    
#translate([23,20,54.5])rotate(a=[0,90,0])
        cylinder(h=18, r=4, $fn=100);
    
// corte de separação das conchas
#translate([23,12.5,54.5]) cube([18,14.5,7]);
}
//

// Retângulo ligado a concha inferior
{
// lado perto da origem
difference(){translate([23,5.5,51.5]) cube([18,10,3]);
    
    // abertura para o prego
#translate([32.5,10,51.5]) cylinder(h=3, r=3.1, $fn=100);
}
//

//lado longe da origem
difference(){translate([23,25,51.5]) cube([18,10,3]);
    
    // abertura para o prego
#translate([32.5,30.5,51.5]) cylinder(h=3, r=3.1, $fn=100);
}
}
//
}