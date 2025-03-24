module FusoEstranho(){
    h_tri=16.35-15.5;
    b_tri=1.5;
    amais=1;
    step=1; 
    voltas=8;

    base3raio1=15.5/2;
    base3raio2=11.5/2;

    AuxFuso=base3raio1-base3raio2;

    for(i=[0:step:360*voltas]){
        translate([0,0,(amais+b_tri)*(1/360)*i])
        rotate([0,0,i])
        translate([base3raio1-(AuxFuso/(360*voltas))*i,0,0])
        rotate([90,0,0])
        linear_extrude(0.2)
        polygon([[0,0],[0,b_tri+1],[0,b_tri],[h_tri,b_tri],[h_tri,0]]);
    }  
}
