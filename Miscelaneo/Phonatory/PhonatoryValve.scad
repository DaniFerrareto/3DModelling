res=30;

difference(){
    cylinder(28.25,22,22,$fn=res);
    #cylinder(28.25,20,20,$fn=res);
}

difference(){
    translate([0,0,26.25])cylinder(2,24,24,$fn=res);
    #translate([0,0,26.25])cylinder(2,22,22,$fn=res);
}

difference(){
    translate([0,0,3])cylinder(28.25+1,17,17,$fn=res);
    #translate([0,0,3])cylinder(28.25+1,15,15,$fn=res);
}
difference(){
    translate([0,0,3])cylinder(2,22,22,$fn=res);
    #translate([0,0,3])cylinder(2,15,15,$fn=res);
}

difference(){
    translate([0,0,3-0.5])cylinder(2,5,5,$fn=res);
    #translate([0,0,3-0.5])cylinder(2,3,3,$fn=res);
}

rotate([0,0,0])translate([4,-1,3])cube([16-4,2,1]);
rotate([0,0,60])translate([4,-1,3])cube([16-4,2,1]);
rotate([0,0,2*60])translate([4,-1,3])cube([16-4,2,1]);
rotate([0,0,3*60])translate([4,-1,3])cube([16-4,2,1]);
rotate([0,0,4*60])translate([4,-1,3])cube([16-4,2,1]);
rotate([0,0,5*60])translate([4,-1,3])cube([16-4,2,1]);

rotate([0,0,30])translate([16,-1,3])cube([21-16,2,28.25-4]);
rotate([0,0,30+45])translate([16,-1,3])cube([21-16,2,28.25-4]);
rotate([0,0,30+2*45])translate([16,-1,3])cube([21-16,2,28.25-4]);
rotate([0,0,30+3*45])translate([16,-1,3])cube([21-16,2,28.25-4]);
rotate([0,0,30+4*45])translate([16,-1,3])cube([21-16,2,28.25-4]);
rotate([0,0,30+5*45])translate([16,-1,3])cube([21-16,2,28.25-4]);
rotate([0,0,30+6*45])translate([16,-1,3])cube([21-16,2,28.25-4]);
rotate([0,0,30+7*45])translate([16,-1,3])cube([21-16,2,28.25-4]);
