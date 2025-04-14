use <funcoes_GFCx.scad>

andorinha(50,25,10,15,5,10,0.2,1);
translate([0,10,0])andorinha(50,25,10,15,5,10,0.2,2);
translate([0,45,0])rotate([90,0,0])andorinha(50,25,10,15,5,10,0.2,1);
translate([0,45+40,10+0.1])rotate([-90,0,0])andorinha(50,25,10,15,5,10,0.2,1);
translate([0,50,0])translate([0,10,-5-0.2])rotate([90,0,0])andorinha(50,25,10,15,5,10,0.2,2);
translate([0,55,10-0.1])translate([0,10,5])rotate([-90,0,0])andorinha(50,25,10,15,5,10,0.2,2);
translate([0,-12,0])linear_extrude(1)text("folga 0.2");

translate([60,0,0]){
    andorinha(50,25,10,15,5,10,0.2,1);
    translate([0,10,0])andorinha(50,25,10,15,5,10,0.1,2);
    translate([0,45,0])rotate([90,0,0])andorinha(50,25,10,15,5,10,0.1,1);
    translate([0,45+40,10+0.05])rotate([-90,0,0])andorinha(50,25,10,15,5,10,0.1,1);
    translate([0,50,0])translate([0,10,-5-0.05])rotate([90,0,0])andorinha(50,25,10,15,5,10,0.1,2);
    translate([0,55,10-0.05])translate([0,10,5])rotate([-90,0,0])andorinha(50,25,10,15,5,10,0.1,2);
    translate([0,-12,0])linear_extrude(1)text("folga 0.1");
}