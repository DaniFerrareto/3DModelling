translate([0,2,-10])rotate([90,0,0])difference(){
    cube([15,29+5+3,2]);
    #translate([15/2,29+2,0])cylinder(2,6.2/2,6.2/2,$fn=100);
}

translate([0,0,-10])cube([15,2,10]);

k=17.25-19.50+16-11+3.7;
n=12;
translate([-3.7/2+15/2+3,-n,-k])cube([3.7,n,3.7]);
