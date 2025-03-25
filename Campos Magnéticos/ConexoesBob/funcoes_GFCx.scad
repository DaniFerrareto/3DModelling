//////////////////////////////////////////////////
module funcao_2d_array_cilindros(r,d,h,nx,ny,geo,res,nome="Conjunto 1"){
    //----- FUNÇÃO ARRAY 2D DE CILÍNDROS -----//
    /*
    Forneça: 
        Raio dos cilíndros: r
        Distância entre os centros de cada cilíndro: d
        Altura dos cilíndros: h
        Quantidade de cilíndros em ambas as direções: nx, ny
        Resolução dos cilíndros: res
    Selecione a geometria:
        Retangular: geo=1
        Hexagonal: geo=2
    Dê um nome para seu conjunto de cilíndros: nome
    */
    if (d<2*r){
        text("Error!");
        translate([0,-15,0])text("Verify your specified dimensions.");
    }else{
        // Olhe na aba console
        echo("Nome: ", nome);
        echo();
        echo("Quantidade de Cilíndros (nx*ny):");
        echo(nx*ny);
        echo();
    
        if(geo==1){
            for(j=[0:1:ny-1]){
                for(i=[0:1:nx-1]){
                    translate([i*d,j*d,0])cylinder(h,r,r,$fn=res);
                }
            }
            echo("Para essa geometria retangular, as dimensões são ([x=(nx-1)*d+2*r,y=(ny-1)*d+2*r,z=h]):");
            echo("x=",(nx-1)*d+2*r,"y=",(ny-1)*d+2*r,"z=",h);
            echo();
        }else if(geo==2){
            for(j=[0:1:ny-1]){
                for(i=[0:1:nx-1]){
                    translate([i*d+(j%2)*d*cos(60),j*d*sin(60),0])cylinder(h,r,r,$fn=res);
                }
            }
            echo("Para essa geometria hexagonal, as dimensões são ([x=(nx-1+cos(60))*d+2*r,y=(ny-1)*d*sin(60)+2*r,z=h]):");
            echo("x=",(nx-1+cos(60))*d+2*r,"y=",(ny-1)*d*sin(60)+2*r,"z=",h);
            echo();
        }else{
            text("Error!");
            translate([0,-15,0])text("Please, choose a valid geometry number.");
        }
    }
}

//////////////////////////////////////////////////
rr=0.1; //Espaço de sobra
module funcao_caixa(a,b,c,d,h,encaixe,nome="Caixa 1"){
    //----- FUNÇÃO CAIXA E TAMPA RETANGULAR -----//
    /*
    Forneça: 
        Dimensões do objeto a ser encaixotado: a,b,c (Leve em conta que as dimensões a,b,c precisam ter um tamanho um pouco maior do que as reais dimensões do objeto, no mínimo 0.5 mm maiores) 
        Espessura da caixa e da tampa: d
        Altura da tampa: h
    Selecione:
        Encaixe por fora: encaixe=true 
        Encaixe por dentro: encaixe=false
    Dê um nome para sua caixa e tampa: nome
    */
    echo("Nome: ", nome);
    echo();

    if(encaixe){
    /*---Encaixe por fora---*/
        /*---Caixa---*/
        difference(){
            cube([a+2*d,b+2*d,c+d]);
            #translate([d,d,d])cube([a,b,c]);
        }
        /*---Tampa---*/
        translate([a+2*d+2,0,0])difference(){
            cube([a+4*d+2*rr,b+4*d+2*rr,h]);
            #translate([d,d,d])cube([a+2*d+2*rr,b+2*d+2*rr,h-d]);
        }
        echo("Caso encaixe por fora, as dimensões da caixa são ([x=a+4*d+2*rr,y=b+4*d+2*rr,z=c+2*d]):");
        echo("x=",a+4*d+2*rr,"y=",b+4*d+2*rr,"z=",c+2*d);
        echo();
    }else{
    /*---Encaixe por dentro---*/
        /*---Caixa---*/
        difference(){
            cube([a+2*d,b+2*d,c+2*d]);
            #translate([d,d,d])cube([a,b,c+d]);
        }
        /*---Tampa---*/
        translate([a+2*d+2,0,0])
        cube([a+2*d,b+2*d,d]);
        translate([a+2*d+2,0,0])
        difference(){
            translate([d+rr,d+rr,d])cube([a-2*rr,b-2*rr,d]);
            #translate([2*d+rr,2*d+rr,d])cube([a-2*rr-2*d,b-2*rr-2*d,d]);
        }
        echo("Caso encaixe por dentro, as dimensões da caixa são ([x=a+2*d,y=b+2*d,z=c+3*d] ):");
        echo("x=",a+2*d,"y=",b+2*d,"z=",c+3*d);
        echo();
    }
}

//////////////////////////////////////////////////
module furo_parafuso(M,L,res,cabeca,passante){
    //----- FUNÇÃO FURO DO PARAFUSO MILIMÉTRICO -----//
    // Acesse a tabela de valores e os desenhos em:
    // https://www.mitsubishicarbide.net/contents/mht/pt/html/product/technical_information/information/hexagon_socket.html
    // Tabela:
    /*
    Dimensões
    nominais
    da rosca d	M3	M4	M5	M6	M8	M10	M12	M14	M16	M18	M20	M22	M24	M27	M30
    d1	3	4	5	6	8	10	12	14	16	18	20	22	24	27	30
    d'	3.4	4.5	5.5	6.6	9	11	14	16	18	20	22	24	26	30	33
    D	5.5	7	8.5	10	13	16	18	21	24	27	30	33	36	40	45
    D'	6.5	8	9.5	11	14	17.5	20	23	26	29	32	35	39	43	48
    H	3	4	5	6	8	10	12	14	16	18	20	22	24	27	30
    H'	2.7	3.6	4.6	5.5	7.4	9.2	11	12.8	14.5	16.5	18.5	20.5	22.5	25	28
    H"	3.3	4.4	5.4	6.5	8.6	10.8	13	15.2	17.5	19.5	21.5	23.5	25.5	29	32
    */
    /*
    Forneça:
        Milímetro do parafuso: M (M3,M4,M5,M6,M8,M10,M12,M14,M16,M18,M20,M22,M24,M27,M30)
        Comprimento: L
        Resolução Circular: res
            
    Selecione a peça que deseja gerar: 
        Com cabeça: cabeca=1
        Sem cabeça: cabeca=0
        Furo passante: passante=1
        Furo com rosca: passante=0
    */
    lista_D_linha=[0,0,0,6.5,8,9.5,11,0,14,0,17.5,0,20,0,23,0,26,0,29,0,32,0,35,0,39,0,0,43,0,0,48];
    lista_H_linha=[0,0,0,3.3,4.4,5.4,6.5,0,8.6,0,10.8,0,13,0,15.2,0,17.5,0,19.5,0,21.5,0,23.5,0,25.5,0,0,29,0,0,32];
    lista_d_passante=[0,0,0,3.4,4.5,5.5,6.6,0,9,0,11,0,14,0,16,0,18,0,20,0,22,0,24,0,26,0,0,30,0,0,33];   
    lista_d_rosca=[0,0,0,3/1.5,4/1.5,5/1.5,6/1.5,0,8/1.5,0,10/1.5,0,12/1.5,0,14/1.5,0,16/1.5,0,18/1.5,0,20/1.5,0,22/1.5,0,24/1.5,0,0,27/1.5,0,0,30/1.5];
    
    bool3=(M==3);
    bool4=(M==4);
    bool5=(M==5);
    bool6=(M==6);
    bool8=(M==8);
    bool10=(M==10);
    bool12=(M==12);
    bool14=(M==14);
    bool16=(M==16);
    bool18=(M==18);
    bool20=(M==20);
    bool22=(M==22);
    bool24=(M==24);
    bool27=(M==27);
    bool30=(M==30);
    
    bool34=bool3||bool4;
    bool56=bool5||bool6;
    bool810=bool8||bool10;
    bool1214=bool12||bool14;
    bool1618=bool16||bool18;
    bool2022=bool20||bool22;
    bool2427=bool24||bool27;
    
    bool3456=bool34||bool56;
    bool8101214=bool810||bool1214;
    bool16182022=bool1618||bool2022;
    
    bool34568101214 = bool3456 || bool8101214;
    bool3456810121416182022 = bool34568101214 || bool16182022; 
   
    bool34568101214161820222427 = bool3456810121416182022 || bool2427;
    
    bool3456810121416182022242730 = bool34568101214161820222427 || bool30;
    
    teste_bool = bool3456810121416182022242730;
    
    if (teste_bool){
        if (cabeca==1){
            if (passante==1){
                cylinder(lista_H_linha[M],lista_D_linha[M]/2,lista_D_linha[M]/2,$fn=res);
                translate([0,0,lista_H_linha[M]])cylinder(L,lista_d_passante[M]/2,lista_d_passante[M]/2,$fn=res);
            }else if (passante==0){
                cylinder(lista_H_linha[M],lista_D_linha[M]/2,lista_D_linha[M]/2,$fn=res);
                translate([0,0,lista_H_linha[M]])cylinder(L,lista_d_rosca[M]/2,lista_d_rosca[M]/2,$fn=res);               
            }else{}
        }
        if (cabeca==0){
            if(passante==1){
                cylinder(L,lista_d_passante[M]/2,lista_d_passante[M]/2,$fn=res); 
            }else if(passante==0){
                cylinder(L,lista_d_rosca[M]/2,lista_d_rosca[M]/2,$fn=res); 
            }else{}
        }
    }else{
        text("Error!");
        translate([0,-15,0])text("Please, choose a valid M number.");
    }
}

//////////////////////////////////////////////////
module parafuso(M,L,res,cabeca){
    //----- FUNÇÃO PARAFUSO MILIMÉTRICO -----//
    // Acesse a tabela de valores e os desenhos em:
    // https://www.mitsubishicarbide.net/contents/mht/pt/html/product/technical_information/information/hexagon_socket.html
    // Tabela:
    /*
    Dimensões
    nominais
    da rosca d	M3	M4	M5	M6	M8	M10	M12	M14	M16	M18	M20	M22	M24	M27	M30
    d1	3	4	5	6	8	10	12	14	16	18	20	22	24	27	30
    d'	3.4	4.5	5.5	6.6	9	11	14	16	18	20	22	24	26	30	33
    D	5.5	7	8.5	10	13	16	18	21	24	27	30	33	36	40	45
    D'	6.5	8	9.5	11	14	17.5	20	23	26	29	32	35	39	43	48
    H	3	4	5	6	8	10	12	14	16	18	20	22	24	27	30
    H'	2.7	3.6	4.6	5.5	7.4	9.2	11	12.8	14.5	16.5	18.5	20.5	22.5	25	28
    H"	3.3	4.4	5.4	6.5	8.6	10.8	13	15.2	17.5	19.5	21.5	23.5	25.5	29	32
    */
    /*
    Forneça:
        Milímetro do parafuso: M (M3,M4,M5,M6,M8,M10,M12,M14,M16,M18,M20,M22,M24,M27,M30)
        Comprimento: L
        Resolução Circular: res
            
    Selecione: a peça que deseja gerar: 
        Com cabeça: cabeca=1
        Sem cabeça: cabeca=0
    */
    lista_D=[0,0,0,5.5,7,8.5,10,0,13,0,16,0,18,0,21,0,24,0,27,0,30,0,33,0,36,0,0,40,0,0,45];    
    
    bool3=(M==3);
    bool4=(M==4);
    bool5=(M==5);
    bool6=(M==6);
    bool8=(M==8);
    bool10=(M==10);
    bool12=(M==12);
    bool14=(M==14);
    bool16=(M==16);
    bool18=(M==18);
    bool20=(M==20);
    bool22=(M==22);
    bool24=(M==24);
    bool27=(M==27);
    bool30=(M==30);
    
    bool34=bool3||bool4;
    bool56=bool5||bool6;
    bool810=bool8||bool10;
    bool1214=bool12||bool14;
    bool1618=bool16||bool18;
    bool2022=bool20||bool22;
    bool2427=bool24||bool27;
    
    bool3456=bool34||bool56;
    bool8101214=bool810||bool1214;
    bool16182022=bool1618||bool2022;
    
    bool34568101214 = bool3456 || bool8101214;
    bool3456810121416182022 = bool34568101214 || bool16182022; 
   
    bool34568101214161820222427 = bool3456810121416182022 || bool2427;
    
    bool3456810121416182022242730 = bool34568101214161820222427 || bool30;
    
    teste_bool = bool3456810121416182022242730;
    
    if (teste_bool){
        if (cabeca==1){
            cylinder(M,lista_D[M]/2,lista_D[M]/2,$fn=res);
            translate([0,0,M])cylinder(L,M/2,M/2,$fn=res); 
        }
        if (cabeca==0){
            cylinder(L,M/2,M/2,$fn=res); 
        }
    }else{
        text("Error!");
        translate([0,-15,0])text("Please, choose a valid M number.");
    }
}

//////////////////////////////////////////////////
module andorinha(L,theta,b,H,h,E,F,peca){
    //----- FUNÇÃO RABO DE ANDORINHA -----//
    /*
    Forneça:
        Largura: L
        Ângulação do rabo de andorinha: theta (recomendado: 20°)
        Largura das bordas: b
        Altura Total: H
        Altura entre a parte côncava e a convexa do rabo de andorinha: h
        Extrusão: E
        Folga: F (recomedado: 0.2)
    
    Selecione a peça que deseja gerar: 
        Ambas: peca=0
        Côncava: peca=1
        Convexa: peca=2
    */
    x=(h+F)*tan(theta);
    hh=(H-h-F)/2;
    if ((peca==0)||(peca==2)){
        linear_extrude(E)polygon(points=[[L,H],[L,H-hh],[L-b-F,H-hh  ],[L-b+x-F,H-hh-h],[b-x+F,H-hh-h],[b+F,H-hh],[0,H-hh  ],[0,H     ]]); 
    }
    if ((peca==0)||(peca==1)){
        linear_extrude(E)polygon(points=[[0,0],[L,0   ],[L    ,hh+h+F],[L-b    ,hh+h+F],[L-b+x,hh    ],[b-x,hh  ],[b,hh+h+F],[0,hh+h+F]]);
    } 
}

//////////////////////////////////////////////////
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