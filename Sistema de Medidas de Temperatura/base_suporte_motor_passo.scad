a=71.60;
difference(){
    cube([a,50,5]);
    #translate([18.4+6/2,(50-6-20)/2,0])cylinder(5,6/2,6/2,$fn=150);
    #translate([18.4+6/2,(50-6-20)/2+6+20,0])cylinder(5,6/2,6/2,$fn=150);
}