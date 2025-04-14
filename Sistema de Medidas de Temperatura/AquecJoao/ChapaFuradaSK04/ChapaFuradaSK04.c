res=100;
h=(1.5/4.1)*(4.65-2.3);
hh=0.6;

difference(){
    cube([22,22,5]);
    #translate([0,11,3.15/2+hh-0.2])rotate([0,90,0])cylinder(22,3.15/2,3.15/2,$fn=res);
    
    //#translate([2+3.3/2,2+3.3/2,0])cylinder(5,1.5,1.5,$fn=res);
    #translate([22-2-3.3/2,22-2-3.3/2,0])cylinder(5,1.5,1.5,$fn=res);
    #translate([22-2-3.3/2,2+3.3/2,0])cylinder(5,1.5,1.5,$fn=res);
    //#translate([2+3.3/2,22-2-3.3/2,0])cylinder(5,1.5,1.5,$fn=res);
    
    #translate([0,0,0])cube([22,22,hh]);
    
    //#translate([11,11,2])cylinder(20,3/2,3/2,$fn=res);
}

translate([-2-3.3+0.4,11-43.7/2,0]){
    difference(){
        cube([5,43.7,5]);
        #translate([0,43.7/2,3.15/2+hh-0.2])rotate([0,90,0])cylinder(20,3.15/2,3.15/2,$fn=res);
        
        #translate([2.5,5.6-2.3/2,0])cylinder(5,2.3/2,2.3/2,$fn=res);
        #translate([2.5,5.6-2.3/2+32.45+2.3,0])cylinder(5,2.3/2,2.3/2,$fn=res);
        #translate([2.5,5.6-2.3/2,5-h])cylinder(h,2.3/2,4.65/2,$fn=res);
        #translate([2.5,5.6-2.3/2+32.45+2.3,5-h])cylinder(h,2.3/2,4.65/2,$fn=res);
        
        translate([0,-(11-43.7/2)-3,0])cube([5,43.7+2*(11-43.7/2)+6,hh]);
        
        //#translate([2.5,43.7/2,2])cylinder(20,3/2,3/2,$fn=res);
    }
}
