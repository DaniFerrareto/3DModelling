difference(){
    difference (){
    //objeto base
        translate([0, 0, 0])
            linear_extrude(height = 15, scale = 1.4, slices = 200)
                circle(r=25 , $fn= 100);
    
    //objeto a ser subtraido
        translate([0, 0, 2])
            linear_extrude(height = 15, scale = 1.4, slices = 200)
                circle(r=25 , $fn= 100);
    };
    translate([0,0,-2])
    cylinder(h = 6,r = 15,$fn = 100);
    
}


//base para passar a rosca
translate([20,0,0])
    cylinder(h = 15,r = 3,$fn = 100);
translate([-10,17.3,0])
    cylinder(h = 15, r = 3, $fn = 100);
translate([-10,-17.3,0])
    cylinder(h = 15,r= 3, $fn = 100);