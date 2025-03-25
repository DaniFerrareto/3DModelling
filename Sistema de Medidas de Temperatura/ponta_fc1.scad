difference(){
    cube([15,25+3,2]);
    #translate([15/2,25+2-5,0])cylinder(2,6.2/2,6.2/2,$fn=100);
}

translate([0,0,-10])cube([15,2,10]);

k=17.25-19.50+16-11+3.7;
n=12;
translate([-3.7/2+15/2+3,-n,-k])cube([3.7,n,3.7]);
