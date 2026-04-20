difference (){
    //objeto base
    translate([0, 0, 0])
         linear_extrude(height = 15, scale = 1.4, slices = 200)
             circle(r=25 , $fn= 100);
    
    //objeto a ser subtraido
    translate([0, 0, 2])
         linear_extrude(height = 15, scale = 1.4, slices = 200)
             circle(r=25 , $fn= 100);
    }
 
    

//base para passar a rosca
translate([20,0,0])
    cylinder(h = 15,r = 3,$fn = 100);
translate([-10,17.3,0])
    cylinder(h = 15, r = 3, $fn = 100);
translate([-10,-17.3,0])
    cylinder(h = 15,r= 3, $fn = 100);

//apoio para o suporte

union(){
////parametros base quadrangular
base_maior = 30;
base_menor = 15;
 
linear_extrude(height = 10, scale = 0.66,slices =4)
    square([base_maior,base_menor],center = true);
    

translate([-38,-5,32])
rotate([0,45,0])
    cube([45,10,10]); 


//último quadrado de cima que receberá o chanfro 
translate([-36,0,32])
    difference(){
        //Objeto original
        cube([10,10,14.14],center = true);
        
        //objeto a ser subtraído (essas são as medidas para o chanfro)
        translate([-4,0,-5])
        rotate([0,00,180])
        cylinder(h = 15,r= 4, $fn = 3);

};
}
    
    
//aqui criaremos o objeto que fará o rabo de andorinha    


/*translate([-60,0,0]){
    
    difference(){
        //Objeto original
        cube([10,10,14.14],center = true);
        
        //objeto a ser subtraído
        translate([-4,0,-5])
        rotate([0,00,180])
        cylinder(h = 15,r= 4, $fn = 3);

}

}*/