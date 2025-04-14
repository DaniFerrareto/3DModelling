//----------Suporte do Canhão de Ar Quente----------//

//-----Dimensões do Rabo de Andorinha-----//
/*
ff=0.2;
linear_extrude(1)polygon(points=[[100,60],[100,40],[80-ff,40],[85-ff,25+ff],[15+ff,25+ff],[20+ff,40],[ 0,40],[0,60]]); 
linear_extrude(1)polygon(points=[[  0, 0],[100, 0],[100  ,40],[80   ,40   ],[85   ,25   ],[15   ,25],[20,40],[0,40]]);
*/

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

module pino(res){
    folga=0.1;
    cylinder(4-folga,5,5,$fn=res);
    cylinder(7,2.5,2.5,$fn=res);
    translate([0,0,7])
    difference(){
        cylinder(6,5,5,$fn=res);
        #translate([0,0,2])cylinder(4,2.5,2.5,$fn=res);
    };
}

//-----Base Óptica-----//
difference(){
    cube([4*d+15,4*d+15,9]);
    #translate([15/2,15/2,0])funcao_2d_array_cilindros(r,d,h,nx,ny,geo,res);
}

//-----Rabo de Andorinha Eixo Y-----//
//-----Translação no Eixo X (d mm)-----//
translate([d,0,0]){
            
    //-----Rabo de Andorinha Baixo (Eixo Y)-----//
    difference(){
        translate([0,0,0]){
            translate([7.725,4*d+5.15+10,-17.5])rotate([90,0,0])linear_extrude(4*d+5.15+10)polygon(points=[[15-shift+(20-(d*0.75))/2,30],[35+shift-(20-(d*0.75))/2,30],[        35+shift-(20-(d*0.75))/2,40],[27.5+shift*0.75,40],[30+shift*0.75,35],[20-shift*0.75,35],[22.5-shift*0.75,40],[15-shift+(20-(d*0.75))/2,40]]);
            translate([aux/2-shift-(d*0.75)/2,0,0])translate([0,0,9])cube([d*0.75+2*shift,4*d+5.15+10,4]);
        }
        #translate([d+5+5.15/2,5+5.15/2+d,0])funcao_2d_array_cilindros(r,d,h+20,1,4,geo,res);
        #translate([d+5+5.15/2,5+5.15/2+d,18-7])funcao_2d_array_cilindros(11/2,d,h+20,1,4,geo,res);
    };
    
    //-----Rabo de Andorinha Cima (Eixo Y)-----//
    difference(){
        translate([0,0,0]){
            translate([aux/2-shift-(d*0.75)/2,4*d+5.15+10-o_ext2,25])cube([o_ext,2*shift2+d*0.75,42-25]);
            translate([7.725,4*d+5.15+10,-17.5])rotate([90,0,0])linear_extrude(o_ext2)polygon(points=[[35+shift-(20-(d*0.75))/2,45],[35+shift-(20-(d*0.75))/2,40],[27.5-        gg+shift*0.75,40],[30-gg+shift*0.75,35+gg],[20+gg-shift*0.75,35+gg],[22.5+gg-shift*0.75,40],[15-shift+(20-(d*0.75))/2,40],[15-shift+(20-(d*0.75))/2,45]]);
        }
        #translate([-17.3,0,0])translate([50-5,4*d+5.15+10-o_ext2+3,0])cube([10,4,37]);
        #translate([-17.3,0,0])translate([50-5.5/2,4*d+5.15+10-o_ext2,0])cube([5.5,4,37]);
    }
    
    //-----Fuso/Rosca do Rabo de Andorinha (Eixo Y)-----//
    difference(){
        translate([aux/2-shift-(d*0.75)/2,0,9])cube([d*0.75+2*shift,d*0.25,38-9]);
        #translate([(2*d+5.15+10)/2,5,30])rotate([90,0,0])cylinder(5,hip,hip,$fn=6);
        #translate([(2*d+5.15+10)/2,d*0.75,30])rotate([90,0,0])cylinder(d*0.75,r,r,$fn=res);
    }
};

//-----Rabo de Andorinha (Eixo X)-----//
difference(){
    translate([0,0,0]){
        //-----Suporte do Suporte Cilíndrico-----//
        translate([4*d+5+7-0.11-2*o_ext2,4*d+5.15+10-(5/2)*o_ext2,48])cube([o_ext2,5*o_ext2+0.7,20]);
        //-----Suporte Parafuso do Suporte Cilíndrico-----//
        translate([4*d+5+7-0.11-2*o_ext2,4*d+5.15+10-(5/2)*o_ext2+200-40,58-15])cube([o_ext2,22,20]);
        translate([-(aux/2-shift-(d*0.75)/2)+4-(4*d+5.15+10-o_ext)/2,4*d+5.15+10-o_ext2,0])
        translate([0,0,38])
        rotate([0,0,90])
        rotate([90,0,0]) // Muitas translações e rotações
        {   
            //-----Rabo de Andorinha Cima (Eixo X)-----//
            translate([-(15-shift2+(20-(d*0.75))/2),-30,(4*d+5.15+10-o_ext2)/2])linear_extrude(o_ext2-0.15)polygon(points=[[35+shift2-(20-(d*0.75))/2,45],[35+shift2-(20        -(d*0.75))/2,40],[27.5-gg+shift2*0.75,40],[30-gg+shift2*0.75,35+gg],[20+gg-shift2*0.75,35+gg],[22.5+gg-shift2*0.75,40],[15-shift2+(20-(d*0.75))/2,40],[15-        shift2+(20-(d*0.75))/2,45]]);
           //-----Rabo de Andorinha Baixo (Eixo X)-----// 
            translate([-(15-shift2+(20-(d*0.75))/2),-30,0])linear_extrude(4*d+5.15+10)polygon(points=[[15-shift2+(20-(d*0.75))/2,30],[35+shift2-(20-(d*0.75))/2,30],[35+        shift2-(20-(d*0.75))/2,40],[27.5+shift2*0.75,40],[30+shift2*0.75,35],[20-shift2*0.75,35],[22.5-shift2*0.75,40],[15-shift2+(20-(d*0.75))/2,40]]);
        };
    };
    #translate([4*d+5.15+10-o_ext2/2-28.3,-4.5+4*d+5-0.45+10-o_ext2/2,38+5])cube([4,10,20]);
    #translate([4*d+5.15+10-o_ext2/2+3-28.3,-4.5/2+ 4*d+5-0.45+10-o_ext2/2,38+5])cube([4,5.5,20]);
    #translate([4*d+5+7-0.11-2*o_ext2-(90-o_ext2)/2-10,4*d+5.15+10+(3/2)*o_ext2,50])
    #rotate([0,90,0])
    #translate([0,45,45])
    #rotate([90,0,0])// Muitas translações e rotações
    #cylinder(35,r,r,$fn=res);
    #translate([4*d+5+7-0.11-2*o_ext2-(90-o_ext2)/2+10,4*d+5.15+10+(3/2)*o_ext2,50])
    #rotate([0,90,0])
    #translate([0,45,45])
    #rotate([90,0,0])// Muitas translações e rotações
    #cylinder(35,r,r,$fn=res);
    #translate([12.5,200-15.47,48+2])rotate([0,90,0])cylinder(90,28.35/2,26.35/2,$fn=res);
};

//-----Fuso/Rosca do Rabo de Andorinha (Eixo X)-----//
difference(){
    translate([4*d+0.15+10,4*d+5.15+10-o_ext2,38])cube([d*0.25,o_ext2,28]);
    #translate([4*d+5.15+10+1.3,4*d+5.15+10-o_ext2/2,38+12+5])rotate([0,-90,0])cylinder(5,hip,hip,$fn=6);
    #translate([4*d+5.15+10+1.3,4*d+5.15+10-o_ext2/2,38+12+5])rotate([0,-90,0])cylinder(d*0.75,r,r,$fn=res);
};

//-----Suporte Cilíndrico-----//
translate([4*d+5+7-0.11-2*o_ext2-(90-o_ext2)/2,4*d+5.15+10+(3/2)*o_ext2+15,48+2])rotate([0,90,0])difference(){
    translate([0,0,0]){
        cylinder(90,28.35/2+4,26.35/2+4,$fn=res);
    }
    #cylinder(90,28.35/2,26.35/2,$fn=res);
    #translate([0,45,45-10])rotate([90,0,0])cylinder(45,r,r,$fn=res);
    #translate([0,45,45+10])rotate([90,0,0])cylinder(45,r,r,$fn=res);
    #translate([0,-5,0])cube([40,10,90]);
}

//-----Pinos-----//
translate([d+(2*d+5.15+10)/2,13+4*d+5.15+10-o_ext2-6,30])
rotate([90,0,0])pino(res);
translate([3*d-6.3,4*d+5.15+10-o_ext2/2,38+12+5])rotate([0,90,0])pino(res);