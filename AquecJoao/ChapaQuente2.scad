// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //

res=100;
h=(1.5/4.1)*(4.65-2.3);
hh=0.6;

chapax=23;
chapay=23;
chapaz=1.3;

chapa2x=23;
chapa2y=12.5;
chapa2z=3;

rFuro=2.15/2;
entreFuros=(16.7+22.4)/2;

rPT100=3.15/2;


// ----- ----- ----- MAIN ----- ----- ----- //



//translate([2,2,-hh])cube([18,18,hh]);

difference(){
    translate([0,0,0]){
        cube([chapax,chapay,chapaz]);
        translate([0,chapay/2-chapa2y/2,chapaz])cube([chapa2x,chapa2y,chapa2z]);
    }
    #translate([0,chapay/2,rPT100])rotate([0,90,0])cylinder(chapax,rPT100,rPT100,$fn=res);
    #translate([chapax/2,chapay/2,rPT100])cylinder(20,3/2,3/2,$fn=res);
    #translate([chapax/2,chapay/2,0]){
        #translate([entreFuros/2,entreFuros/2,0])cylinder(chapaz,rFuro,rFuro,$fn=res);
        #translate([entreFuros/2,-entreFuros/2,0])cylinder(chapaz,rFuro,rFuro,$fn=res);
        #translate([-entreFuros/2,entreFuros/2,0])cylinder(chapaz,rFuro,rFuro,$fn=res);
        #translate([-entreFuros/2,-entreFuros/2,0])cylinder(chapaz,rFuro,rFuro,$fn=res);
    }
}




/*difference(){
    cube([22,22,4]);
    #translate([0,11,3.15/2])rotate([0,90,0])cylinder(22,3.15/2,3.15/2,$fn=res);
    
    #translate([11,11,2])cylinder(20,3/2,3/2,$fn=res);
}*/
