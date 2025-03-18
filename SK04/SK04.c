res=100;
h=(1.5/4.1)*(4.65-2.3);


difference(){
    cube([5,43.7,5]);
    #translate([0,43.7/2,3.15/2-0.2])rotate([0,90,0])cylinder(20,3.15/2,3.15/2,$fn=res);
    
    #translate([2.5,5.6-2.3/2,0])cylinder(20,2.3/2,2.3/2,$fn=res);
    #translate([2.5,5.6-2.3/2+32.45+2.3,0])cylinder(20,2.3/2,2.3/2,$fn=res);
    #translate([2.5,5.6-2.3/2,5-h])cylinder(h,2.3/2,4.65/2,$fn=res);
    #translate([2.5,5.6-2.3/2+32.45+2.3,5-h])cylinder(h,2.3/2,4.65/2,$fn=res);
    
    #translate([2.5,43.7/2,2])cylinder(20,3/2,3/2,$fn=res);
}
