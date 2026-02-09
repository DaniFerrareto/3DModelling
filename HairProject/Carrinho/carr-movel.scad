//folga
  ff=0.2;
difference (){ rotate([90,0,0])translate([0,0,0])  linear_extrude(25) {polygon(points=[[100,60],[100,40],[80-ff,40],[85-ff,25+ff],[15+ff,25+ff],[20+ff,40],[0,40],[0,60]]);
  }; 
  
#translate([50-5,-25+3,0]) cube([10,4,60]);
  #translate([50-5.5/2,-25,0]) cube([5.5,4,60]);
  };
  
  difference(){
    translate([0,-25,60]) 
      cube([100,25,40]);

#translate([50-9.5/2,-30+4.5,107.5-5.5-2.5]) rotate([-30,0,0])cube([9.5,15,1.1]);

  };
 