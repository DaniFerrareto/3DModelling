//Cubo
{ translate([-10,-10,120]){
difference(){
    
    color("white") cube([50,50,50]);
    #translate([2.5,2.5,2.5])cube(45);
    #translate([25,25,0])cylinder(h=2.5, r1=15,r2=15);
    #translate([25,25,47.5])cylinder(h=2.5, r1=15,r2=15);
rotate([90,0,0]) #translate([25,25,-2.5])cylinder(h=2.5, r1=15,r2=15);
    rotate([90,0,0]) #translate([25,25,-50])cylinder(h=2.5, r1=15,r2=15);
    rotate([0,90,0]) #translate([-25,25,])cylinder(h=2.5, r1=15,r2=15);
    rotate([0,90,0]) #translate([-25,25,47.5])cylinder(h=2.5, r1=15,r2=15);
    
}

//Bobina no eixo -x
        translate([-45,25,25]){ 
{
//Separação de r = 55
difference(){
rotate([0,90,0]) color("PowderBlue")cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//separação de r = 55
difference(){
rotate([0,90,0]) translate([0,0,11])color("PowderBlue") cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 45
difference(){
rotate([0,90,0]) translate([0,0,22])color("PowderBlue") cylinder(h=1, r1=45,r2=45);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 35
difference(){
rotate([0,90,0]) translate([0,0,33])color("PowderBlue") cylinder(h=1, r1=35,r2=35);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 25
difference(){
rotate([0,90,0]) translate([0,0,44])color("PowderBlue") cylinder(h=1, r1=25,r2=25);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Furos
{
difference(){
rotate([0,90,0]) color("Chocolate") cylinder(h=48.5, r1=15,r2=15);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
    #translate([45,-15,0]) cube([3.5,30,1]);
rotate(a=[10,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[30,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[50,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[70,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[90,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
  rotate(a=[80,0,0]){
      rotate(a=[10,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[30,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[50,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[70,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[90,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
  }
}
}
}
}

//Bobina no eixo -y 
    rotate(a=[0,0,90]){translate([-45,-25,25]){ 
{
//Separação de r = 55
difference(){
rotate([0,90,0]) color("PowderBlue") cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//separação de r = 55
difference(){
rotate([0,90,0]) translate([0,0,11])color("PowderBlue") cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 45
difference(){
rotate([0,90,0]) translate([0,0,22])color("PowderBlue") cylinder(h=1, r1=45,r2=45);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 35
difference(){
rotate([0,90,0]) translate([0,0,33])color("PowderBlue") cylinder(h=1, r1=35,r2=35);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 25
difference(){
rotate([0,90,0]) translate([0,0,44])color("PowderBlue") cylinder(h=1, r1=25,r2=25);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Furos
{
difference(){
rotate([0,90,0]) color("Chocolate") cylinder(h=48.5, r1=15,r2=15);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
    #translate([45,-15,0]) cube([3.5,30,1]);
rotate(a=[10,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[30,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[50,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[70,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[90,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
  rotate(a=[80,0,0]){
      rotate(a=[10,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[30,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[50,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[70,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[90,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
  }
}}}}}



//Bobina no eixo x
    rotate(a=[0,0,180]){translate([-95,-25,25]){ 
{
//Separação de r = 55
difference(){
rotate([0,90,0]) color("PowderBlue") cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//separação de r = 55
difference(){
rotate([0,90,0]) translate([0,0,11])color("PowderBlue") cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 45
difference(){
rotate([0,90,0]) translate([0,0,22])color("PowderBlue") cylinder(h=1, r1=45,r2=45);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 35
difference(){
rotate([0,90,0]) translate([0,0,33])color("PowderBlue") cylinder(h=1, r1=35,r2=35);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 25
difference(){
rotate([0,90,0]) translate([0,0,44])color("PowderBlue") cylinder(h=1, r1=25,r2=25);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Furos
{
difference(){
rotate([0,90,0]) color("Chocolate") cylinder(h=48.5, r1=15,r2=15);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
    #translate([45,-15,0]) cube([3.5,30,1]);
rotate(a=[10,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[30,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[50,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[70,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[90,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
  rotate(a=[80,0,0]){
      rotate(a=[10,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[30,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[50,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[70,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[90,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
  }
}}}}}


//Bobina no eixo y
    rotate(a=[0,180,90]){translate([-95,-25,-25]){ 
{
//Separação de r = 55
difference(){
rotate([0,90,0]) color("PowderBlue") cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//separação de r = 55
difference(){
rotate([0,90,0]) translate([0,0,11])color("PowderBlue") cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 45
difference(){
rotate([0,90,0]) translate([0,0,22])color("PowderBlue") cylinder(h=1, r1=45,r2=45);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 35
difference(){
rotate([0,90,0]) translate([0,0,33])color("PowderBlue") cylinder(h=1, r1=35,r2=35);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 25
difference(){
rotate([0,90,0]) translate([0,0,44])color("PowderBlue") cylinder(h=1, r1=25,r2=25);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Furos
{
difference(){
rotate([0,90,0]) color("Chocolate") cylinder(h=48.5, r1=15,r2=15);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
    #translate([45,-15,0]) cube([3.5,30,1]);
rotate(a=[10,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[30,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[50,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[70,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[90,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
  rotate(a=[80,0,0]){
      rotate(a=[10,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[30,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[50,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[70,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
    rotate(a=[90,0,0])#translate([45,0,-15]) cube([3.5,1,30]);
  }
}}}}}}}

// Suporte
{ color("Gainsboro"){
difference(){
translate([-10,-10,120])
    cube([50,50,5]);
#translate([0,30,120])cylinder(h=5, r1=3,r2=3);
#translate([30,30,120])cylinder(h=5, r1=3,r2=3);
#translate([30,0,120])cylinder(h=5, r1=3,r2=3);
#translate([0,0,120])cylinder(h=5, r1=3,r2=3);
}
translate([-11,30,120])
    cube([1,11,12]);
translate([-11,-11,120])
    cube([1,11,12]);
translate([40,30,120])
    cube([1,11,12]);
translate([40,-10,120])
    cube([1,11,12]);
translate([-10,40,120])
    cube([10,1,12]);
translate([-10,-11,120])
    cube([10,1,12]);
translate([30,40,120])
    cube([11,1,12]);
translate([30,-11,120])
    cube([11,1,12]);


cylinder(h=120, r1=5, r2=5, center=false);
translate([0,0,-5])
    cylinder(h=5, r1=3, r2=3, center=false);
translate([0,0,120])
    cylinder(h=5, r1=3, r2=3, center=false);
    
translate([30,0,0])   
cylinder(h=120, r1=5, r2=5, center=false);
translate([30,0,-5])
    cylinder(h=5, r1=3, r2=3, center=false);
translate([30,0,120])
    cylinder(h=5, r1=3, r2=3, center=false);
    
    
translate([30,30,0])   
    cylinder(h=120, r1=5, r2=5, center=false);
translate([30,30,-5])
    cylinder(h=5, r1=3, r2=3, center=false);
translate([30,30,120])
    cylinder(h=5, r1=3, r2=3, center=false);


translate([0,30,0])   
cylinder(h=120, r1=5, r2=5, center=false);
translate([0,30,-5])
    cylinder(h=5, r1=3, r2=3, center=false);
translate([0,30,120])
    cylinder(h=5, r1=3, r2=3, center=false);
    
    
difference(){
translate([-20,-20,-5])
    cube([70,70,5]);
#translate([0,30,-5])cylinder(h=5, r1=3,r2=3);
#translate([30,30,-5])cylinder(h=5, r1=3,r2=3);
#translate([30,0,-5])cylinder(h=5, r1=3,r2=3);
#translate([0,0,-5])cylinder(h=5, r1=3,r2=3);
}}}