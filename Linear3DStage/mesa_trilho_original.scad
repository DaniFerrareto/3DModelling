// ------------------------- // MESA TRILHO ORIGINAL // ------------------------- //

res=100;
difference(){
    cube([50,30,24]);
    #translate([0,0,7])cube([50,3,10]);
    #translate([0,30-3,7])cube([50,3,10]);
    #translate([(50-39.7)/2,(30-25.6)/2,24-11]){
        #translate([0,0,0])cylinder(11,3.3/2,3.3/2,$fn=res);
        #translate([39.7,25.6,0])cylinder(11,3.3/2,3.3/2,$fn=res);
        #translate([39.7,0,0])cylinder(11,3.3/2,3.3/2,$fn=res);
        #translate([0,25.6,0])cylinder(11,3.3/2,3.3/2,$fn=res);
    }
    #translate([0,30/2,24/2])rotate([0,90,0]){
        #translate([0,0,0])cylinder((50-16)/2,7,7,$fn=res);
        #translate([0,0,(50-16)/2+16])cylinder((50-16)/2,7,7,$fn=res);
        #translate([0,0,(50-16)/2])cylinder(16,6,6,$fn=res);
        #translate([0,19.5/2,0])cylinder(8,2.5/2,2.5/2,$fn=res);
        #translate([0,-19.5/2,0])cylinder(8,2.5/2,2.5/2,$fn=res);
        #translate([0,19.5/2,50-8])cylinder(8,2.5/2,2.5/2,$fn=res);
        #translate([0,-19.5/2,50-8])cylinder(8,2.5/2,2.5/2,$fn=res);
    }    
}