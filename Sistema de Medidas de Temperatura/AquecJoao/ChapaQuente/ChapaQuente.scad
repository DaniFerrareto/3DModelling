res=100;
h=(1.5/4.1)*(4.65-2.3);
hh=0.6;
translate([2,2,-hh])cube([18,18,hh]);
difference(){
    cube([22,22,4]);
    #translate([0,11,3.15/2])rotate([0,90,0])cylinder(22,3.15/2,3.15/2,$fn=res);
    
    #translate([11,11,2])cylinder(20,3/2,3/2,$fn=res);
}
