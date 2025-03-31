//-----FUNÇÃO ARRAY 2D DE CILÍNDROS-----//

// Forneça o raio dos cilíndros: r
// Forneça entre os centros de cada cilíndro: d
// Forneça a altura dos cilíndros: h
// Forneça a quantidade de cilíndros em ambas as direções: nx, ny
// Forneça a resolução dos cilíndros: res
// Selecione a geometria:
//      Retangular: 1
//      Hexagonal: 2

module funcao_2d_array_cilindros(r,d,h,nx,ny,geo,res){
    if (d<2*r){
        text("Error!");
        translate([0,-15,0])text("Verify your specified dimensions.");
    }else{
        if(geo==1){
            for(j=[0:1:ny-1]){
                for(i=[0:1:nx-1]){
                    translate([i*d,j*d,0])cylinder(h,r,r,$fn=res);
                }
            }
        }else if(geo==2){
            for(j=[0:1:ny-1]){
                for(i=[0:1:nx-1]){
                    translate([i*d+(j%2)*d*cos(60),j*d*sin(60),0])cylinder(h,r,r,$fn=res);
                }
            }
        }else{
            text("Error!");
            translate([0,-15,0])text("Please, choose a valid geometry number.");
        }
        
    }    
}

// A quantidade de cilíndros é dada por nx*ny
// Para um geometria retangular, as dimensões são dadas por [(nx-1)*d+2*r,(ny-1)*d+2*r,h]
// Para um geometria hexagonal, as dimensões são dadas por [(nx-1+cos(60))*d+2*r,(ny-1)*d*sin(60)+2*r,h]

r=3;
d=20+5.15;
h=9;
nx=3;
ny=3;
geo=1;
res=100;

aux=2*d+5.15+10;
aux2=40.7-24.2+111.70-16.7-5.15/2;
aux3=11/2;
aux4=(37.55+4)/2 - (16.35+5.1/2-13.2);

cc=25;
ff=37.5;
gg=0.15;

difference(){
    cube([2*d+5.15+10,2*d+5.15+10,9]);
    #translate([5+5.15/2,5+5.15/2,0])funcao_2d_array_cilindros(r,d,h,nx,ny,geo,res);
}
translate([7.725,42.16+10,-17.5])rotate([90,0,0])linear_extrude(d*0.75+20+10)polygon(points=[[15+(20-(d*0.75))/2,30],[35-(20-(d*0.75))/2,30],[35-(20-(d*0.75))/2,40],[27.5,40],[30,35],[20,35],[22.5,40],[15+(20-(d*0.75))/2,40]]);
translate([aux/2-(d*0.75)/2,aux/2-(d*0.75)/2-20,0])cube([d*0.75,d*0.75+20+10,13]);

h_alt=11/2;
hip=h_alt/(sin(60));
difference(){
    translate([aux/2-(d*0.75)/2,0,0])cube([d*0.75,d*0.25,38]);
    #translate([(2*d+5.15+10)/2,5,30])rotate([90,0,0])cylinder(5,hip,hip,$fn=6);
    #translate([(2*d+5.15+10)/2,d*0.75,30])rotate([90,0,0])cylinder(d*0.75,r,r,$fn=res);
}

translate([(2*d+5.15+10)/2,aux/2-(d*0.75)/2-d*0.75+5,30])translate([0,70,0]){
    translate([0,-50,0])rotate([90,0,0])difference(){
        translate([0,0,-1.5])cylinder(h=5,r=5,center=true,$fn=100);
        #translate([0,0,2])cylinder(h=10,r=2.5,center=true,$fn=100);
    }; 
    translate([0,-44,0])rotate([90,0,0])cylinder(h=4.5,r=2.5,center=true,$fn=100);
    translate([0,-40.5,0])rotate([90,0,0])cylinder(h=2.5,r=5,center=true,$fn=100);
};

translate([-40,0,0])difference(){
    translate([0,0,0]){
        cylinder(90,28.35/2+4,26.35/2+4,$fn=res);
        translate([-20-15,-4,0])cube([40+30,4,90]);
    }
    #cylinder(90,28.35/2,26.35/2,$fn=res);
    #translate([0,45,45])rotate([90,0,0])cylinder(90,aux3,aux3,$fn=res);
    #translate([-20,0,0])cube([40,20,90]);
    
    #translate([cc,45,45+ff])rotate([90,0,0])cylinder(90,3,3,$fn=res);
    #translate([-cc,45,45+ff])rotate([90,0,0])cylinder(90,3,3,$fn=res);
    #translate([cc,45,45-ff])rotate([90,0,0])cylinder(90,3,3,$fn=res);
    #translate([-cc,45,45-ff])rotate([90,0,0])cylinder(90,3,3,$fn=res);
}

translate([0,0,0])translate([-40,0,0])difference(){
    translate([0,0,0]){
        cylinder(90,28.35/2+4,26.35/2+4,$fn=res);
        translate([-20-15,0,0])cube([40+30,4,90]);
    }
    #cylinder(90,28.35/2,26.35/2,$fn=res);
    #translate([0,45,45])rotate([90,0,0])cylinder(90,aux3,aux3,$fn=res);
    #translate([-20,-20,0])cube([40,20,90]);
    
    #translate([cc,45,45+ff])rotate([90,0,0])cylinder(90,3,3,$fn=res);
    #translate([-cc,45,45+ff])rotate([90,0,0])cylinder(90,3,3,$fn=res);
    #translate([cc,45,45-ff])rotate([90,0,0])cylinder(90,3,3,$fn=res);
    #translate([-cc,45,45-ff])rotate([90,0,0])cylinder(90,3,3,$fn=res);
}

//rotate([90,0,0])linear_extrude(d*0.75)polygon(points=[[35-(20-(d*0.75))/2,45],[35-(20-(d*0.75))/2,40],[27.5-gg,40],[30-gg,35+gg],[20+gg,35+gg],[22.5+gg,40],[15+(20-(d*0.75))/2,40],[15+(20-(d*0.75))/2,45]]);
//rotate([90,0,0])linear_extrude(d*0.75)polygon(points=[[15+(20-(d*0.75))/2,30],[35-(20-(d*0.75))/2,30],[35-(20-(d*0.75))/2,40],[27.5,40],[30,35],[20,35],[22.5,40],[15+(20-(d*0.75))/2,40]]);

difference(){
    translate([0,0,0]){
        translate([aux/2-(d*0.75)/2,aux/2-(d*0.75)/2,25])cube([d*0.75,d*0.75,110-25]);
        translate([7.725,42.16,-17.5])rotate([90,0,0])linear_extrude(d*0.75)polygon(points=[[35-(20-(d*0.75))/2,45],[35-(20-(d*0.75))/2,40],[27.5-gg,40],[30-gg,35+gg],[20+gg,35+gg],[22.5+gg,40],[15+(20-(d*0.75))/2,40],[15+(20-(d*0.75))/2,45]]);
    }
    #translate([aux/2,aux/2+45,aux2+aux4])rotate([90,0,0])cylinder(90,28.35/2+4,26.35/2+4,$fn=res);
    #translate([aux/2,aux/2,22+aux4+35])cylinder(35,2,2,$fn=res);
    #translate([aux/2,aux/2,85.1+aux4])cylinder(7.5,aux3,aux3,$fn=res);
    #translate([-17.3,48.29,0])translate([50-5,-25+3,0])cube([10,4,50]);
    #translate([-17.3,48.29,0])translate([50-5.5/2,-25,0])cube([5.5,4,50]);
    #translate([-17.3,48.29,0])translate([50-5.5/2-5,-25,0])cube([5.5+10,4,22]);
}