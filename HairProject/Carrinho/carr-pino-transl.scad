  translate([0,0,0]){
  translate([50,-50,50])rotate([90,0,0]) difference(){cylinder(h=10,r=7, center=true,$fn=100);
     #translate([0,0,3])cylinder(h=10,r=3.8, center=true,$fn=100);
  }; 
 translate([50,-44,50])rotate([90,0,0]) cylinder(h=4.5,r=2.5, center=true,$fn=100);
   translate([50,-40.5,50])rotate([90,0,0]) cylinder(h=2.5,r=5, center=true,$fn=100);
  };
  
