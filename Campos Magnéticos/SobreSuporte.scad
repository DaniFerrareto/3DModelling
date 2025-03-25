difference(){
translate([0,0,0])cube([57.5,57.5,13]);
#translate([1.5,1.5,0])cube([54.5,54.5,10]);
#translate([28.75,28.75,10])cylinder(h=3, r1=10.45,r2=10.45, $fn=100);
}

difference(){
translate([28.75,28.75,13])cylinder(h=15, r1=12.45,r2=12.45, $fn=100);
#translate([28.75,28.75,13])cylinder(h=15, r1=10.45,r2=10.45, $fn=100);
}
