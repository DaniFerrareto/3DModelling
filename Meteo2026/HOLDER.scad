union(){
        //Objeto original
        translate([-10,0,0])
        cube([10,10,10],center = true);
        
        //objeto a ser subtraído
        translate([-4,0,-5])
        rotate([0,00,180])
        cylinder(h = 10,r= 4, $fn = 3);

}

translate([-30,0,0])
difference(){
cylinder(h = 10,r =20,center = true);
cylinder(h = 12,r = 18,center = true);
}