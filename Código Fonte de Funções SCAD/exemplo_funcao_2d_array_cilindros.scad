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

r=5;
d=11;
h=10;
nx=3;
ny=3;
geo=2;
res=50;

funcao_2d_array_cilindros(r,d,h,nx,ny,geo,res);