//funcao_2d_array_cilindros(r_splh,d_splh,10+splh_x/2-diff_splh_x/2+diff_splh_z,5,1,1,res,"Conjunto Sample Holder");
res=100;
r_splh=1;
alt=100;

difference(){
    translate([0,0,0]){
        cylinder(1,20,20,$fn=res);
        cylinder(5,12.45,12.45,$fn=res);
    }
    #translate([0,0,-15])
    #cylinder(alt,r_splh,r_splh,$fn=res);
}