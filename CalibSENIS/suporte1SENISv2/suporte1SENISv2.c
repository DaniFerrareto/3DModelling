res = 100;
aa=13.2;
rr=1; //raio parafuso fixação offset
sss=12;
ere = 6;
difference(){
    translate([0,0,0])cube([37.55+4,37.55+4,12.5]);
    #translate([2-0.175,2-0.175,0])cube([37.55+2*0.175,37.55+2*0.175,1]);    
    #translate([(37.55+4)/2,(37.55+4)/2,0])cylinder(5+9+5+12,6.4/2,6.4/2,$fn=res);
}

/////////////////////////////////////////////////////////////////////

translate([3+(37.55+4-36)/2,3,12.5+6]){
    difference(){ // Essas são as dimensões exatas do SENIS
        translate([0,0,0]){
            translate([0,0,-ere])linear_extrude(1+ere)polygon(points=[[0-1-1,0-1],[30+1+1,0-1],[30+1+1,92-61-11],[30-12+1+1,92-61],[30-12-6-1-1,92-61],[0-1-1,92-61-11]]);
            translate([0-1,0,-ere])linear_extrude(10+ere)polygon(points=[[-3,92-61-11],[-1,92-61-11],[11,92-61],[9,92-61]]);
            translate([0+1,0,-ere])linear_extrude(10+ere)polygon(points=[[33,92-61-11],[31,92-61-11],[19,92-61],[21,92-61]]);
            translate([5,19,0])cylinder(10,1.1+0.3,1.1-0.5,$fn=res);
            translate([25,19,0])cylinder(10,1.1+0.3,1.1-0.5,$fn=res);  
        }
        #translate([0,92-61-11/2,-ere])cube([30,30,10+ere]);
        #translate([-(3+(37.55+4-36)/2),-3,-13.5])translate([(37.55+4)/2,(37.55+4)/2,0])cylinder(5+9+5+12,6.4/2,6.4/2,$fn=res);
        #translate([0,0,8.3])translate([-(3+(37.55+4-36)/2),-3,-13.5])translate([(37.55+4)/2,(37.55+4)/2,0])cylinder(6.3,10.1/2+0.25,10.1/2+0.25,$fn=res);
    }

    translate([-3-1,-1,-ere])cube([2,92-61-11+1,10+ere]);
    translate([31+1,-1,-ere])cube([2,92-61-11+1,10+ere]);
    translate([-3-1,-3,-ere])cube([30+3+3+2,2,10+ere]);
}

// O tamanho do parafuso:
//15.4-5.9+8.8
//15.4-5.9=9.5
// tem que ser maior que 9.5


