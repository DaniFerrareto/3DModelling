module Cubo(){
    difference(){
        cube([50,50,50]);
        #translate([2.5,2.5,2.5])cube(45);
        #translate([25,25,0])cylinder(h=2.5,r1=15,r2=15);
        #translate([25,25,47.5])cylinder(h=2.5,r1=15,r2=15);
        rotate([90,0,0])translate([25,25,-2.5])cylinder(h=2.5,r1=15,r2=15);
        rotate([90,0,0])translate([25,25,-50])cylinder(h=2.5,r1=15,r2=15);
        rotate([0,90,0])translate([-25,25,])cylinder(h=2.5,r1=15,r2=15);
        rotate([0,90,0])translate([-25,25,47.5])cylinder(h=2.5,r1=15,r2=15);
    }
}