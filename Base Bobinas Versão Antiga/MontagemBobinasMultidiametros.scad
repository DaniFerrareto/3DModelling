//Cubo
difference(){
    
    cube([50,50,50]);
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
rotate([0,90,0]) cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//separação de r = 55
difference(){
rotate([0,90,0]) translate([0,0,11])cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 45
difference(){
rotate([0,90,0]) translate([0,0,22])cylinder(h=1, r1=45,r2=45);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 35
difference(){
rotate([0,90,0]) translate([0,0,33])cylinder(h=1, r1=35,r2=35);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 25
difference(){
rotate([0,90,0]) translate([0,0,44])cylinder(h=1, r1=25,r2=25);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Furos
{
difference(){
rotate([0,90,0]) cylinder(h=48.5, r1=15,r2=15);
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
rotate([0,90,0]) cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//separação de r = 55
difference(){
rotate([0,90,0]) translate([0,0,11])cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 45
difference(){
rotate([0,90,0]) translate([0,0,22])cylinder(h=1, r1=45,r2=45);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 35
difference(){
rotate([0,90,0]) translate([0,0,33])cylinder(h=1, r1=35,r2=35);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 25
difference(){
rotate([0,90,0]) translate([0,0,44])cylinder(h=1, r1=25,r2=25);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Furos
{
difference(){
rotate([0,90,0]) cylinder(h=48.5, r1=15,r2=15);
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
rotate([0,90,0]) cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//separação de r = 55
difference(){
rotate([0,90,0]) translate([0,0,11])cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 45
difference(){
rotate([0,90,0]) translate([0,0,22])cylinder(h=1, r1=45,r2=45);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 35
difference(){
rotate([0,90,0]) translate([0,0,33])cylinder(h=1, r1=35,r2=35);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 25
difference(){
rotate([0,90,0]) translate([0,0,44])cylinder(h=1, r1=25,r2=25);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Furos
{
difference(){
rotate([0,90,0]) cylinder(h=48.5, r1=15,r2=15);
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
rotate([0,90,0]) cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//separação de r = 55
difference(){
rotate([0,90,0]) translate([0,0,11])cylinder(h=1, r1=55,r2=55);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 45
difference(){
rotate([0,90,0]) translate([0,0,22])cylinder(h=1, r1=45,r2=45);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 35
difference(){
rotate([0,90,0]) translate([0,0,33])cylinder(h=1, r1=35,r2=35);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Separação de r = 25
difference(){
rotate([0,90,0]) translate([0,0,44])cylinder(h=1, r1=25,r2=25);
    rotate([0,90,0]) #cylinder(h=48.5, r1=12.5,r2=12.5);
}


//Furos
{
difference(){
rotate([0,90,0]) cylinder(h=48.5, r1=15,r2=15);
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