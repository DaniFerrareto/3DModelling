res=100;

difference(){
    cylinder(24.55,22.3/2,22.3/2,$fn=res);
    #cylinder(24.55,16.8/2+1.8,16.8/2+1.8,$fn=res);
}

difference(){
    translate([0,0,24.55-2])cylinder(2,25.3/2,25.3/2,$fn=res);
    #translate([0,0,24.55-2])cylinder(2,22.3/2,22.3/2,$fn=res);
}

difference(){
    translate([0,0,0])cylinder(25.65-16.35+2,16.8/2+1.8,16.8/2+1.8,$fn=res);
    #translate([0,0,0])cylinder(25.65-16.35+2,16.8/2,16.8/2,$fn=res);
}

difference(){
    translate([0,0,25.65-16.35])cylinder(25.65-(25.65-16.35),16.8/2,16.8/2,$fn=res);
    #translate([0,0,25.65-16.35])cylinder(25.65-(25.65-16.35),16.8/2-0.75,16.8/2-0.75,$fn=res);
}

translate([0,0,0])cylinder(25.65-23.5,16.8/2+1.8,16.8/2+1.8,$fn=res);
translate([-1,-9.775,0])cube([2,2*9.775,25.65-16.35]);

rotate([0,0,])translate([16.8/2-0.2,-0.5,3])cube([2.2,1,25.65-9.65]);
rotate([0,0,2*45])translate([16.8/2-0.2,-0.5,3])cube([2.2,1,25.65-9.65]);
rotate([0,0,4*45])translate([16.8/2-0.2,-0.5,3])cube([2.2,1,25.65-9.65]);
rotate([0,0,6*45])translate([16.8/2-0.2,-0.5,3])cube([2.2,1,25.65-9.65]);