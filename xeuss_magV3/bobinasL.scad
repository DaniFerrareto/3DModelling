/*difference(){
rotate([0,90,0]) cylinder(h=1, r1=25,r2=25);
    rotate([0,90,0]) #cylinder(h=14.5, r1=12.5,r2=12.5);
}*/
difference(){
rotate([0,90,0]) translate([0,0,11])cylinder(h=1, r1=25,r2=25);
    rotate([0,90,0]) #cylinder(h=15.5, r1=12.5,r2=12.5);
}
difference(){
rotate([0,90,0]) cylinder(h=15.5, r1=15.2,r2=15.2);
    rotate([0,90,0]) #cylinder(h=15.5, r1=12.7,r2=12.7);
    #translate([12,-15,0]) cube([3.5,30,1]);
rotate(a=[10,0,0])#translate([12,0,-15]) cube([3.5,1,30]);
    rotate(a=[30,0,0])#translate([12,0,-15]) cube([3.5,1,30]);
    rotate(a=[50,0,0])#translate([12,0,-15]) cube([3.5,1,30]);
    rotate(a=[70,0,0])#translate([12,0,-15]) cube([3.5,1,30]);
    rotate(a=[90,0,0])#translate([12,0,-15]) cube([3.5,1,30]);
  rotate(a=[80,0,0]){
      rotate(a=[10,0,0])#translate([12,0,-15]) cube([3.5,1,30]);
    rotate(a=[30,0,0])#translate([12,0,-15]) cube([3.5,1,30]);
    rotate(a=[50,0,0])#translate([12,0,-15]) cube([3.5,1,30]);
    rotate(a=[70,0,0])#translate([12,0,-15]) cube([3.5,1,30]);
    rotate(a=[90,0,0])#translate([12,0,-15]) cube([3.5,1,30]);
  }
}