//Bobina
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


//Furo
translate([0,0,0])
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
boxAmais=10;
raioAmais=0.7;
altGrip=0.6;
translate([48.5-altGrip,0,0]){
    difference(){
        rotate([0,90,0])cylinder(h=altGrip, r1=15+raioAmais,r2=15+raioAmais);
        #rotate([0,90,0])cylinder(h=3.5, r1=12.5,r2=12.5);
        #translate([0,-15-boxAmais/2,0]) cube([3.5,30+boxAmais,1]);
        #rotate(a=[10,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[30,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[50,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[70,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[90,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[80,0,0]){
            #rotate(a=[10,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[30,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[50,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[70,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[90,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        }
    }
}

rotate([0,180,0]){
    difference(){
        rotate([0,90,0])cylinder(h=3.5,r1=15,r2=15);
        #rotate([0,90,0])cylinder(h=3.5,r1=12.5,r2=12.5);
        #translate([0,-15-boxAmais/2,0]) cube([3.5,30+boxAmais,1]);
        #rotate(a=[10,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[30,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[50,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[70,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[90,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[80,0,0]){
            #rotate(a=[10,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[30,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[50,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[70,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[90,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        }
    }
}

rotate([0,90+90,0])translate([3.5-altGrip,0,0]){
    difference(){
        rotate([0,90,0])cylinder(h=altGrip, r1=15+raioAmais,r2=15+raioAmais);
        #rotate([0,90,0])cylinder(h=3.5, r1=12.5,r2=12.5);
        #translate([0,-15-boxAmais/2,0]) cube([3.5,30+boxAmais,1]);
        #rotate(a=[10,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[30,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[50,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[70,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[90,0,0])translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        #rotate(a=[80,0,0]){
            #rotate(a=[10,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[30,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[50,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[70,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
            #rotate(a=[90,0,0])#translate([0,0,-15-boxAmais/2]) cube([3.5,1,30+boxAmais]);
        }
    }
}

}