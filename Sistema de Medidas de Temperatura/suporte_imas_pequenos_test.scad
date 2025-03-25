res=100;

d=9.5;

difference(){
    translate([-3,0,0])cube([10+12+6,15,3]);
    #translate([22/2,15/2,0])cylinder(5,2,2,$fn=res);
}

difference(){
    translate([0,0,0]){
        translate([-3,0,0])cube([6+3+2,15,15]);
        translate([6+10-2,0,0])cube([6+3+2,15,15]);
        translate([-3,15/2,15])rotate([0,90,0])cylinder(22+6,15/2,15/2,$fn=res);
    };
    #translate([-3,15/2,15])rotate([0,90,0])cylinder(22+6,10/2,10/2,$fn=res);
    #translate([6+1,0,3])cube([10-2,15,30]);
}

translate([5+1,15/2,15])rotate([0,90,0])cylinder(1,10/2,10/2,$fn=res);
translate([6+10-1,15/2,15])rotate([0,90,0])cylinder(1,10/2,10/2,$fn=res);