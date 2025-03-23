h_tri=1;
b_tri=0.6;
step=0.5; 

translate([10,0,0])
rotate([90,0,0])
linear_extrude(0.05)
polygon([[0,0],[h_tri,b_tri/2],[0,b_tri]]);

for(i=[0:step:10]){
    translate([i,0,0])cube([0.1,1,1]);
}

for(i=[0:step:360]){
    translate([0,0,(1/360)*i])
    rotate([0,0,i])
    translate([10,0,0])
    rotate([90,0,0])linear_extrude(0.05)polygon([[0,0],[h_tri,b_tri/2],[0,b_tri]]);
}

linear_extrude(0.05)polygon([[0,0],[h_tri,b_tri/2],[0,b_tri]]);
