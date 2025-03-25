//-----Rabo de Andorinha Cima (Eixo Y) / Rabo de Andorinha Baixo (Eixo X)-----//

//-----Declaração de Variáveis-----//
r=3;
d=25;
h=9;
nx=5;
ny=5;
geo=1;
res=10;
aux=2*d+15.15;
aux2=40.7-24.2+111.70-16.7-5.15/2;
aux3=11/2;
aux4=(37.55+4)/2 - (16.35+5.1/2-13.2);
cc=25;
ff=37.5;
gg=0.2;
shift=(17.5+2*d)/2;
shift2=(17.5)/2;
h_alt=11/2;
hip=h_alt/(sin(60));
o_ext=d*0.75+2*shift; // Segundo rabo de andorinha
o_ext2=2*shift2+d*0.75; //Primeiro rabo de andorinha

//-----Declaração de Funções-----//
module funcao_2d_array_cilindros(r,d,h,nx,ny,geo,res){
    //-----FUNÇÃO ARRAY 2D DE CILÍNDROS-----//
    /*
    Forneça:
        raio dos cilíndros: r
        distância entre os centros de cada cilíndro: d
        altura dos cilíndros: h
        quantidade de cilíndros em ambas as direções: nx, ny
        resolução dos cilíndros: res
    Selecione a geometria:
         Retangular: 1
         Hexagonal: 2
    
    Quantidade de cilíndros = nx*ny
    geo=1 => Dimensões: [(nx-1)*d+2*r,(ny-1)*d+2*r,h]
    geo=2 => Dimensões: [(nx-1+cos(60))*d+2*r,(ny-1)*d*sin(60)+2*r,h]
    */
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

//-----Rabo de Andorinha (Eixo X)-----//
difference(){
    translate([-(aux/2-shift-(d*0.75)/2)+4-(4*d+5.15+10-o_ext)/2,4*d+5.15+10-o_ext2,0])
    translate([0,0,38])
    rotate([0,0,90])
    rotate([90,0,0]) // Muitas translações e rotações
    {   
        //-----Rabo de Andorinha Baixo (Eixo X)-----// 
        translate([-(15-shift2+(20-(d*0.75))/2),-30,0])linear_extrude(4*d+5.15+10)polygon(points=[[15-shift2+(20-(d*0.75))/2,30],[        35+shift2-(20-(d*0.75))/2,30],[35+        shift2-(20-(d*0.75))/2,40],[27.5+shift2*0.75,40],[30+shift2*0.75,35],[20-shift2*        0.75,35],[22.5-shift2*0.75,40],[15-shift2+(20-(d*0.75))/2,40]]);
    };
};

hex_enc=(12.55/2)/(cos(30));
//-----Fuso/Rosca do Rabo de Andorinha (Eixo X)-----//
difference(){
    translate([4*d+0.15+10,4*d+5.15+10-o_ext2,38])cube([d*0.25,o_ext2,28+4]);
    #translate([4*d+5.15+10+1.3,4*d+5.15+10-o_ext2/2,38+12+5])rotate([0,-90,0])cylinder(5,hex_enc+0.5,hex_enc+0.5,$fn=6);
    #translate([4*d+5.15+10+1.3,4*d+5.15+10-o_ext2/2,38+12+5])rotate([0,-90,0])cylinder(d*0.75,r,r,$fn=res);
};

translate([41,97.5,30-3])cylinder(12+4,5,5,$fn=res);
translate([41+32,97.5,30-3])cylinder(12,5,5,$fn=res);