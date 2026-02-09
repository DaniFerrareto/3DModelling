rotate([90,0,0]) linear_extrude(150) {polygon(points=[[0,0],[100,0],[100,40],[80,40],[85,25],[15,25],[20,40],[0,40]]);
  };
  
   translate([0,-150,0]) difference() {
      cube([100,25,100]);
   #translate([50,10,50])rotate([90,0,0]) cylinder(h=30,r=4.1, center=true); 
 #translate([50,-0,50])rotate([90,0,0]) cylinder(h=10,r=15/2,$fn=6, center=true); 
      
#translate([50-9.5/2,13-0.5,100-3.5-4.5]) rotate([30,0,0])  cube([9.5,15,1.1]);
      
  };
