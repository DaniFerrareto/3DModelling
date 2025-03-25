aa=13.2;
rr=1; //raio parafuso fixação offset
sss=12;
res=10;
difference(){
    translate([0,0,0])cube([39+4,39+4,5]);
    #translate([2-0.3,2-0.3,-4])cube([39+0.6,39+0.6,5]);    
    #translate([(37.55+4)/2,(39+4)/2,-9])cylinder(5+9,6.4/2,6.4/2,$fn=res);
}

difference(){
    translate([0,-aa,0])
        {    
        translate([0,16.35+5.1/2,10])rotate([0,90,0])cylinder(39+4,6.4/2+0.5+2,6.4/2+0.5+2,$fn=res);
        translate([0,16.35+5.1/2-6.4/2-0.5-2,5])cube([39+4,7.4+4,5]);
        translate([20.7+sss,19,10]) cylinder(10,5,5,$fn=res);        
        }
    
    #translate([0,16.35+5.1/2-aa,10])rotate([0,90,0])cylinder(39+4,6.35/2+0.2,6.35/2+0.2,$fn=res);
    #translate([sss+(39+4)/2-0.75,(39+4)/2-15-0.75,10])cylinder(10,3.65/2,3.65/2,$fn=res);    
};
translate([3.2*sss,5.5,0])rotate([0,0,90])rotate([0,-90,0]){
    difference(){
        translate([0,-aa,0])
            {    
            translate([0,16.35+5.1/2,10])rotate([0,90,0])cylinder(39+4,6.4/2+0.5+2,6.4/2+0.5+2,$fn=res);
            translate([0,16.35+5.1/2-6.4/2-0.5-2,5])cube([39+4,7.4+4,5]);
            translate([20.7-sss,19,10]) cylinder(10,5,5,$fn=res);        
            }
        
        #translate([0,16.35+5.1/2-aa,10])rotate([0,90,0])cylinder(39+4,6.35/2+0.2,6.35/2+0.2,$fn=res);
        #translate([-sss+(39+4)/2-0.75,(39+4)/2-15-0.75,10])cylinder(10,3.65/2,3.65/2,$fn=res);    
    };
}
