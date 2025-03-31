Sres = 100;
aa=13.2;
rr=1; //raio parafuso fixação offset
sss=12;
ere = 6;

difference(){
    translate([0,0,0]){
        cube([37.55+4,37.55+4,12.5]);
        translate([(37.55+4)/2,0,2*12.5])rotate([-90,0,0])cylinder(37.55+4,9.1/2+0.15+4,9.1/2+0.15+4,$fn=res);
    }
    #translate([2-0.175,2-0.175,0])cube([37.55+2*0.175,37.55+2*0.175,1]);    
    #translate([(37.55+4)/2,(37.55+4)/2,-17])cylinder(5+9+5+12,6.4/2,6.4/2,$fn=res);
    #translate([(37.55+4)/2,0,2*12.5])rotate([-90,0,0])cylinder(37.55+4,9.1/2+0.15,9.1/2+0.15,$fn=res);
    #translate([3+(37.55+4-36)/2,3,12.5]){
        #translate([-(3+(37.55+4-36)/2),-3,0])
        #translate([(37.55+4)/2,(37.55+4)/2,0])
        #translate([0,0,-6.3])
        #cylinder(6.3,10.1/2+0.25,10.1/2+0.25,$fn=res);
    }
    #translate([0,13,0])
    #translate([3+(37.55+4-36)/2,3,12.5])
    #translate([-(3+(37.55+4-36)/2),-3,0])
    #translate([(37.55+4)/2,(37.55+4)/2,0])
    #translate([0,0,-4])
    #cylinder(4,7/2+0.15,7/2+0.15,$fn=res);
    #translate([0,-13,0])
    #translate([3+(37.55+4-36)/2,3,12.5])
    #translate([-(3+(37.55+4-36)/2),-3,0])
    #translate([(37.55+4)/2,(37.55+4)/2,0])
    #translate([0,0,-4])
    #cylinder(4,7/2+0.15,7/2+0.15,$fn=res);
}
translate([0,13,0])
translate([3+(37.55+4-36)/2,3,12.5])
translate([-(3+(37.55+4-36)/2),-3,0])
translate([(37.55+4)/2,(37.55+4)/2,0])
cylinder(6.3,7/2,7/2,$fn=res);
translate([0,-13,0])
translate([3+(37.55+4-36)/2,3,12.5])
translate([-(3+(37.55+4-36)/2),-3,0])
translate([(37.55+4)/2,(37.55+4)/2,0])
cylinder(6.3,7/2,7/2,$fn=res);


//cylinder(6.3+40,7/2+0.15,7/2+0.15,$fn=res);

// O tamanho do parafuso:
//15.4-5.9+8.8
//15.4-5.9=9.5
// tem que ser maior que 9.5

