//suporte do cubo
difference(){
translate([-2,-2,0])cube([54,54,120]);
#translate([8,-2,70])cube([34,54,40]);
#translate([8,-2,10])cube([34,54,50]);
#translate([-2,8,10])cube([54,34,50]);
#translate([-2,8,70])cube([54,34,40]);
}
 difference(){translate([-25,-25,0])cube([100,100,15]);
#translate([-12.5,-12.5,0])cylinder(h=15, r=3.3);
#translate([62.5,62.5,0])cylinder(h=15, r=3.3);
#translate([62.5,-12.5,0])cylinder(h=15, r=3.3);
#translate([-12.5,62.5,0])cylinder(h=15, r=3.3);
 }
translate([-2,-2,115])
    cube([1.5,54,12]);
translate([50.5,-2,115])
    cube([1.5,54,12]);
translate([-2,50.5,115])
    cube([54,1.5,12]);
translate([-2,-2,115])
    cube([54,1.5,12]);

//base
rotate(a=[0,0,0])translate([-2,8,20])difference(){rotate(a=[90,30,0])translate([0,0,0])cylinder(10,10,10,$fn=3);
    #translate([0,-10,-5])cube([10,10,15]);
}
rotate(a=[0,0,90])translate([-2,2,20])difference(){rotate(a=[90,30,0])translate([0,0,0])cylinder(10,10,10,$fn=3);
    #translate([0,-10,-5])cube([10,10,15]);
}
translate([52,52,20])rotate(a=[0,0,270])difference(){rotate(a=[90,30,0])translate([0,0,0])cylinder(10,10,10,$fn=3);
    #translate([0,-10,-5])cube([10,10,15]);
}
translate([8,52,20])rotate(a=[0,0,270])difference(){rotate(a=[90,30,0])translate([0,0,0])cylinder(10,10,10,$fn=3);
    #translate([0,-10,-5])cube([10,10,15]);
}
rotate(a=[0,0,0])translate([-2,52,20])difference(){rotate(a=[90,30,0])translate([0,0,0])cylinder(10,10,10,$fn=3);
    #translate([0,-10,-5])cube([10,10,15]);
}
rotate(a=[0,0,90])translate([-2,-42,20])difference(){rotate(a=[90,30,0])translate([0,0,0])cylinder(10,10,10,$fn=3);
    #translate([0,-10,-5])cube([10,10,15]);
}
translate([52,-2,20])rotate(a=[0,0,180])difference(){rotate(a=[90,30,0])translate([0,0,0])cylinder(10,10,10,$fn=3);
    #translate([0,-10,-5])cube([10,10,15]);
}
translate([52,42,20])rotate(a=[0,0,180])difference(){rotate(a=[90,30,0])translate([0,0,0])cylinder(10,10,10,$fn=3);
    #translate([0,-10,-5])cube([10,10,15]);
}