res=100;
r_splh=1;
alt=100;

difference(){
    translate([0,0,0]){
        cylinder(1,20,20,$fn=res);
        cylinder(5,15,15,$fn=res);
    }
    #translate([0,0,-15])
    #cylinder(alt,r_splh,r_splh,$fn=res);
}