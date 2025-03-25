a=16.50+2;
b=39.70+2;
c=10.00+2;
d=2;
e =13.05+2;
f = 2.85+2; 

difference(){
    cube([a+2*d,b+2*d,c+d+2+2]);
    #translate([d-2,d,d])cube([a+2,b,c+2+2]);
    #translate([d+1.5,d-2,d])cube([a-3,b+2,c]);
    #translate([0,b+2*d-2-1-2.80+1-(17.5+2),7.05+9.7-6-4-1])cube([2,17.5+2,6+4+1]);
    
    #translate([a+2*d-2,b+2*d-(6.2/2)-2.5,12])rotate([0,90,0])cylinder(2,3.1/2,3.1/2,$fn=100);
    #translate([a+2*d-2,b+2*d-(6.2/2)-10,12])rotate([0,90,0])cylinder(2,3.1/2,3.1/2,$fn=100);
    
    //#translate([2+1+3+(2.5/2),b+2*d-2-1-8-(2.5/2),-2])cylinder(4,2.5,2.5,$fn=100);
    //#translate([a+2*d-2-1-3-(2.5/2),b+2*d-2-1-8-(2.5/2),-2])cylinder(4,2.5,2.5,$fn=100);
    //#translate([2+1+3+(2.5/2),2+1+16.85+(2.5/2),-2])cylinder(4,2.5,2.5,$fn=100);
    //#translate([a+2*d-2-1-3-(2.5/2),2+1+16.85+(2.5/2),-2])cylinder(4,2.5,2.5,$fn=100);
    
    //#translate([2+1+3+(2.5/2),b+2*d-2-1-8-(2.5/2),-2])cylinder(2,4,4,$fn=100);
    //#translate([a+2*d-2-1-3-(2.5/2),b+2*d-2-1-8-(2.5/2),-2])cylinder(2,4,4,$fn=100);
    //#translate([2+1+3+(2.5/2),2+1+16.85+(2.5/2),-2])cylinder(2,4,4,$fn=100);
    //#translate([a+2*d-2-1-3-(2.5/2),2+1+16.85+(2.5/2),-2])cylinder(2,4,4,$fn=100);
}

//translate([a+2*d+2,0,0])cube([a+2*d,b+2*d,2]);
//difference(){
//    translate([a+2*d+2+2+0.5,2+0.5,2])cube([a+2*d-4-1,b+2*d-4-1,2]);
//    #translate([a+2*d+2+2+0.5+2,2+0.5+2,2])cube([a+2*d-4-1-4,b+2*d-4-1-4,2]);
//}

dd=3.25;
aa=15.8;
//AA=??;
//AA-aa=2*dd;
cc=dd+aa;//distância entre os centros dos furos
//1.70

translate([2+1+1.25+dd/2,b+2*d-2-1-1.7-dd/2,0])cylinder(c+d+2,dd/2+0.5,dd/2-0.5,$fn=100);
translate([2+1+1.25+dd/2,b+2*d-2-1-1.7-dd/2-cc,0])cylinder(c+d+2,dd/2+0.5,dd/2-0.5,$fn=100);

k=22;
translate([50,0,2])rotate([0,90,0])translate([-(a+2*d-2),-(b+2*d-14.25),0])difference(){
    translate([a+2*d-2,b+2*d-14.25-2,-k])cube([2,14.25+2,k+c+d+2+2]);
    #translate([a+2*d-2,b+2*d-(6.2/2)-2.5,-8.4-3])rotate([0,90,0])cylinder(2,4.5/2,4.5/2,$fn=100);
    #translate([a+2*d-2,b+2*d-(6.2/2)-2.5,12])rotate([0,90,0])cylinder(2,3.1/2,3.1/2,$fn=100);
    #translate([a+2*d-2,b+2*d-(6.2/2)-10,12])rotate([0,90,0])cylinder(2,3.1/2,3.1/2,$fn=100);
}
    
translate([-10,0,0])cube([10,b+2*d,2]);
translate([-10,0,0])cube([10,2,c+6]);
translate([-10,b+2*d-2,0])cube([10,2,c+6]);
    
difference(){
    translate([-10,0,0])cube([2,b+2*d,c+2+2+2]);
    #translate([-10,b+2*d-2-1-2.80+1-(17.5+2),7.05+9.7-6-4-1])cube([2,17.5+2,6+4+1]);
}