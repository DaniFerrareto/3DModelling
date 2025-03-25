//-----Rosqueador-----//

//-----Declaração de Variáveis-----//
res =100;

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

//-----Rosqueador-----//
difference(){
    translate([0,0,0]){
        cylinder(11.65,36/2,36/2,$fn=res);
        cylinder(19.15,25.5/2,25.5/2,$fn=res);
    };
    #cylinder(19.15,7.6/2,7.6/2,$fn=res);
    #translate([0,0,19.15 - (19.15-11.65)/2])rotate([90,0,0])cylinder(25.5/2,3.6/2,3.6/2,$fn=res);
    #translate([-(36/2+1)-(36/2+1)*sin(30),-(36/2+1)*sin(60),0])funcao_2d_array_cilindros(3,36/2+1,19.15,3,3,2,res);
};