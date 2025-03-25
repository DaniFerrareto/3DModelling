//Concha de suporte superior
difference(){
translate([23,20,54.5-55])rotate(a=[0,90,0])cylinder(h=18, r=7 );   
#translate([23,20,54.5-55])rotate(a=[0,90,0])cylinder(h=18, r=4.5 );
#translate([23,13,46.5-55])cube([18,15,8.5]);
}
difference(){
translate([23,5.5,0])cube([18,10,3]);
#translate([32.5,10,0])cylinder(h=3, r=3.1 );
}
difference(){
translate([23,25,0])cube([18,10,3]);
#translate([32.5,30,0])cylinder(h=3, r=3.1 );
}