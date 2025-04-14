// ------------------------- // MESA TRILHO DANIEL // ------------------------- //

res=100;

cd=19.5/2; // cd: center distance for the tiny nut holes
ll=8;
diam_furo=2.5;
raio_rosca=6;
amais=cd-diam_furo/2-raio_rosca;
h_ros=50;


module fp(length,diam,center_distance){
    for(i=[0:1:3]){
        rotate([0,0,90*i])translate([0,center_distance,0])cylinder(length,diam/2,diam/2,$fn=res);
    }    
}

difference(){
    cylinder(50,cd+diam_furo/2+amais,cd+diam_furo/2+amais,$fn=res);
    rotate([0,0,0]){
        #translate([0,0,0])cylinder(h_ros,raio_rosca,raio_rosca,$fn=res);
        #fp(ll,diam_furo,cd);
        #translate([0,0,h_ros-ll])fp(ll,diam_furo,cd);
    }
}