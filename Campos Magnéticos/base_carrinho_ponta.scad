//base
difference(){
cube([50,30.1,6]);
#translate([1.7+4,0.6+4,0])cylinder(h=8, r=4);
#translate([50-1.45-4,0.6+4,0])cylinder(h=8, r=4);
#translate([1.8+4,30.1-0.5-4,0])cylinder(h=8, r=4);
#translate([50-1.45-4,30.1-0.5-4,0])cylinder(h=8, r=4);
}
b=4;
c=5;
w=7.2;
//apoio inferior com aberturas
difference(){translate([32.5-w,20-c,18-b])
    // cubo principal
        cube([20,8,20], center=true);
    // abertura interior
    #translate([32.5-w,20-c,18-b])
        cube([17.2,4.2,20], center=true);
    // abertura para o prego
   #translate([32.5-w,24-c,21-b])rotate(a=[90,0,0])
        cylinder(h=8, r=3.1 );}
//