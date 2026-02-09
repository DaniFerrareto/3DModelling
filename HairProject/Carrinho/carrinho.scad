rotate([90,0,0]) linear_extrude(150) {polygon(points=[[0,0],[100,0],[100,40],[80,40],[85,25],[15,25],[20,40],[0,40]]);
  };

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
  
  translate([0,-150,0]) difference() {
      cube([100,25,100]);
   #translate([50,10,50])rotate([90,0,0]) cylinder(h=30,r=4.1, center=true); 
 #translate([50,-0,50])rotate([90,0,0]) cylinder(h=10,r=15/2,$fn=6, center=true); 
      
#translate([50-9.5/2,13-0.5,100-3.5-4.5]) rotate([30,0,0])  cube([9.5,15,1.1]);
      
  };
  
  translate([0,0,0]){
  translate([50,-50,50])rotate([90,0,0]) difference(){cylinder(h=10,r=7, center=true,$fn=100);
     #translate([0,0,3])cylinder(h=10,r=4.5, center=true,$fn=100);
  }; 
 translate([50,-44,50])rotate([90,0,0]) cylinder(h=4.5,r=2.5, center=true,$fn=100);
   translate([50,-40.5,50])rotate([90,0,0]) cylinder(h=2.5,r=5, center=true,$fn=100);
  };
  
  
  
  

