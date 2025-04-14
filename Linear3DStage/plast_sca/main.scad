// ------------------------- // ESTÁGIO LINEAR 3D // ------------------------- //

//----- DECLARAÇÃO DE VARIÁVEIS -----//

//Resolution:
res=10;

//Backlash:
folga1=0.1;
folga2=0.2;
folga3=0.3;
folga4=0.4;
folga5=0.5;

//Testes de Folga:
fff=0.15;

//Travel:
travel_x=180;
travel_y=180;
travel_z=180;

//Fixa Eixo Y e Eixo Z:
diamA_fixYZ=4.5;
diamB_fixYZ=3.5;

//Stepper Motor Dimensions:
motor_base_x = 42;
motor_base_y = 42;
motor_altura_z = 39.5;
e_para_x = 37;
e_para_y = 37;
borda_para_x = 2;
borda_para_y = 2;
base_eixo_limite = 82-motor_altura_z-5; // Note que 82-motor_altura_z-5 = 37.5
base_diam_eixo =22+2*fff;
cc = 31/2; //diferença entre os parafusos de fixação

//Rosca:
cd=19.5/2;
ll=8;
diam_furo=3;
raio_rosca=6;
h_ros=50;
amais=cd-diam_furo/2-raio_rosca;
t=fff; //teste do encaixe cilindrico, Nota pro Daniel: faça o teste antes de criar a peça

//Tread-XYZ Dimensions:
encaixe_trilho=cd+diam_furo/2+amais;
//compri_trilho_x=180;//
compri_trilho_x=5+2*folga1+motor_base_x+5;
compri_trilho_y=motor_base_y+3+5+folga2;//
compri_trilho_z=180;//
//larg_trilho_x=10+2*folga1+42;//
larg_trilho_x=motor_altura_z+3+5+base_eixo_limite+5+folga1+travel_y;
larg_trilho_y=10+2*folga1+42;//
larg_trilho_z=10+2*folga1+42;//
alt_trilho=42-15+folga2;
alt_sobra=3;
sobra_diam=30;
cc_sobra_parafusM3=9;
//cccc=2.75;
cccc=cc_sobra_parafusM3-(cd/(sqrt(2)));

//Fuso:
despa=10; //distância entre segunda parede e acoplador
dda=5; // dentro do acoplador
d_ia=6; // diâmetro interno do acoplador para o fuso 
l_fuso_x=travel_x+15+despa;
l_fuso_y=travel_y+15+despa;
l_fuso_z=travel_z-2;

//Rosca:
fixinha=(1/sqrt(2))*(encaixe_trilho+t+2.5-1);

//Dimensões do Rabo de Andorinha:
//largura =shift+20;
//angulo = 20;
//bordas = 10;
//altura = 3*(5+folga2);
//meia_altura = 10;
//extrusao=50;
//andorinha(largura,angulo,bordas,altura,meia_altura,extrusao,folga2,0);
//andorinha(L,theta,b,H,h,E,F,peca)

//lateral suporte motor
//hh=50;
//a=71.60;
//b=35.90;

//----- CHAMADA DE BIBLIOTECAS -----//
use <funcoes_GFCx.scad>
use <threads-library-by-cuiso-v1.scad>
/*
Duas funções a serem usadas:
    thread_for_screw(diameter=10, length=20); 
    thread_for_nut(diameter=10, length=6, usrclearance=0.1);
*/

//----- DECLARAÇÃO DE FUNÇÕES -----//

module fp(length,diam,center_distance){
    // ----- FP ----- //
    for(i=[0:1:3]){
        rotate([0,0,90*i])
        translate([0,center_distance,0])
        cylinder(length,diam/2,diam/2,$fn=res);
    }    
}
    
module rosca_mesa_trilho(cd=19.5/2,ll=8,diam_furo=3,raio_rosca=6,h_ros=50,res=100){
    // ----- MESA TRILHO DANIEL ----- //
    amais=cd-diam_furo/2-raio_rosca;
    difference(){
        cylinder(h_ros,cd+diam_furo/2+amais,cd+diam_furo/2+amais,$fn=res);
        #thread_for_nut(diameter=2*raio_rosca, length=h_ros, usrclearance=0.1);
        #fp(ll,diam_furo,cd);
        #translate([0,0,h_ros-ll])fp(ll,diam_furo,cd);
    }
}


//---------- EIXO Y ---------//
translate([0,5,5])rotate([90,0,0])linear_extrude(5)polygon([[0,0],[motor_altura_z+3+folga1,0],[motor_altura_z+3+folga1,motor_base_y+3+folga2]]);
translate([0,5+2*folga1+motor_base_x,0])translate([0,5,5])rotate([90,0,0])linear_extrude(5)polygon([[0,0],[motor_altura_z+3+folga1,0],[motor_altura_z+3+folga1,motor_base_y+3+folga2]]);
cube([motor_altura_z+3+folga1+5,5+2*folga1+motor_base_x+5,5]);
translate([motor_altura_z+3+folga1+5,0,0])cube([base_eixo_limite+5,5+2*folga1+motor_base_x+5,5]);

//translate([0,0,-5])cube([motor_altura_z+3+folga1+5+base_eixo_limite+5+travel_y,5+2*folga1+motor_base_x+5,5]);

difference(){
    translate([motor_altura_z+3+folga1,0,0])
    cube([5,5+2*folga1+motor_base_x+5,motor_base_y+3+folga2+5]);
    #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,-90,0])
    #cylinder(5,base_diam_eixo/2,base_diam_eixo/2,$fn=res);
    
    #translate([0,-cc,-cc])
    #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,-90,0]){
        #translate([0,0,0])cylinder(5,3.5/2,3.5/2,$fn=res);     
        #translate([cc+cc,0,0])cylinder(5,3.5/2,3.5/2,$fn=res);         
        #translate([cc+cc,cc+cc,0])cylinder(5,3.5/2,3.5/2,$fn=res);
        #translate([0,cc+cc,0])cylinder(5,3.5/2,3.5/2,$fn=res);
    };
};

translate([motor_altura_z+3+folga1,0,0])cube([5+base_eixo_limite+5,5,motor_base_y/2+folga2]);
translate([motor_altura_z+3+folga1,2*folga1+motor_base_x+5,0])cube([5+base_eixo_limite+5,5,motor_base_y/2+folga2]);

difference(){
    translate([5+base_eixo_limite,0,0])
    translate([motor_altura_z+3+folga1,0,0])
    cube([5,5+2*folga1+motor_base_x+5,motor_base_y+3+folga2+5]);
    #translate([base_eixo_limite+5,-cc,-cc])
    #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,-90,0]){
        #translate([0,0,0])cylinder(5,4,4,$fn=res);     
        #translate([0,cc+cc,0])cylinder(5,4,4,$fn=res);
    };
    #translate([base_eixo_limite+5,0,0])
    #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,-90,0])
    #cylinder(5,base_diam_eixo/2,base_diam_eixo/2,$fn=res);
}

//andorinha(L,theta,b,H,h,E,F,peca)

translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1,0,0])
rotate([90,0,90])
andorinha(5+2*folga1+motor_base_x+5,25,10,15,5,travel_y,0.1,1);

translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,0,0])
rotate([90,0,90])
andorinha(5+2*folga1+motor_base_x+5,25,10,15,5,compri_trilho_y,0.1,2);


difference(){
    translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,0,15]){
        cube([compri_trilho_y,larg_trilho_y,alt_trilho+5+3]);
        translate([0,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5-15])
        rotate([0,-90,0])
        cylinder(alt_sobra,encaixe_trilho+t+5,encaixe_trilho+t+5,$fn=res);
        translate([compri_trilho_y+0.01+alt_sobra,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5-15])
        rotate([0,-90,0])
        cylinder(alt_sobra,encaixe_trilho+t+5,encaixe_trilho+t+5,$fn=res);
    }
    
    #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,90,0])
    #cylinder(compri_trilho_y+0.01,encaixe_trilho+t,encaixe_trilho+t,$fn=res);
    
    #translate([20-alt_sobra,-fixinha,-fixinha])
    #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,-90,0]){
        #translate([0,0,0])furo_parafuso(4,20,res,0,0);    
        #translate([2*fixinha,0,0])furo_parafuso(4,20,res,0,0);        
        #translate([2*fixinha,2*fixinha,0])furo_parafuso(4,20,res,0,0);
        #translate([0,2*fixinha,0])furo_parafuso(4,20,res,0,0);
    };
    
    #translate([20-alt_sobra,-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc])
    #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,-90,0])
    #translate([cc_sobra_parafusM3-cccc,cc_sobra_parafusM3-cccc,0])
    #rotate([0,0,45])
    #translate([-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc,0]){
        #translate([0,0,0])furo_parafuso(5,20,res,0,0);    
        #translate([2*(cc_sobra_parafusM3-cccc),0,0])furo_parafuso(5,20,res,0,0);        
        #translate([2*(cc_sobra_parafusM3-cccc),2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
        #translate([0,2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
    };
    
    #translate([-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,90,0])
    #cylinder(alt_sobra,raio_rosca+1,raio_rosca+1,$fn=res);
    
    #translate([compri_trilho_y+0.01+alt_sobra,0,0])
    #translate([0,-fixinha,-fixinha])
    #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,-90,0]){
        #translate([0,0,0])furo_parafuso(4,20,res,0,0);    
        #translate([2*fixinha,0,0])furo_parafuso(4,20,res,0,0);        
        #translate([2*fixinha,2*fixinha,0])furo_parafuso(4,20,res,0,0);
        #translate([0,2*fixinha,0])furo_parafuso(4,20,res,0,0);
    };
    
    #translate([compri_trilho_y+0.01+alt_sobra,0,0])
    #translate([0,-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc])
    #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,-90,0])
    #translate([cc_sobra_parafusM3-cccc,cc_sobra_parafusM3-cccc,0])
    #rotate([0,0,45])
    #translate([-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc,0]){
        #translate([0,0,0])furo_parafuso(5,20,res,0,0);    
        #translate([2*(cc_sobra_parafusM3-cccc),0,0])furo_parafuso(5,20,res,0,0);        
        #translate([2*(cc_sobra_parafusM3-cccc),2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
        #translate([0,2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
    };
    
    #translate([compri_trilho_y+0.01+alt_sobra,0,0])
    #translate([-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    #rotate([0,90,0])
    #cylinder(alt_sobra,raio_rosca+1,raio_rosca+1,$fn=res);
}

translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1,0,motor_base_y+3+5+folga2])
cube([compri_trilho_y-10-folga1,5,5+0.7]);
translate([0,larg_trilho_y-5,0])
translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1,0,motor_base_y+3+5+folga2])
cube([compri_trilho_y-10-folga1,5,5+0.7]);
translate([compri_trilho_y-10-folga1,0,0])
translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1,0,motor_base_y+3+5+folga2])
rotate([0,0,90])
cube([larg_trilho_y,5,5+0.7]);

//translate([alt_sobra-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
//rotate([0,90,0])
//rosca_mesa_trilho(h_ros=compri_trilho_y,res=res);

/*
translate([base_eixo_limite+5+folga5,0,0])
translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
rotate([0,90,0])
{
    thread_for_screw(diameter=12, length=l_fuso_y);
    translate([0,0,-dda])cylinder(dda,d_ia/2,d_ia/2,$fn=100);
}
*/










//---------- FIXA EIXO Y E EIXO Z ---------//
difference(){
    translate([0,0,0]){
        translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1,-2,motor_base_y+3+5+folga2-25])
        cube([compri_trilho_y-10-folga1,2,25+0.7+20+15]);
        translate([2+motor_altura_z+3+5+base_eixo_limite+5+folga1+30-2,-2,motor_base_y+3+5+folga2-10-15])
        cube([10+folga1,2,10+15]);

        translate([0,larg_trilho_y+2,0]){
            translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1,-2,motor_base_y+3+5+folga2-25])
            cube([compri_trilho_y-10-folga1,2,25+0.7+20+15]);
            translate([2+motor_altura_z+3+5+base_eixo_limite+5+folga1+30-2,-2,motor_base_y+3+5+folga2-10-15])
            cube([10+folga1,2,10+15]);
        }

        translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30-2,-2,motor_base_y+3+5+folga2-10])
        cube([2,2+10,10]);
        translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30-2,larg_trilho_y-10,motor_base_y+3+5+folga2-10])
        cube([2,2+10,10]);
        
        translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30-2,-2,motor_base_y+3+5+folga2])
        cube([2+10-0.1,2+10,2]);
        translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30-2,larg_trilho_y-10,motor_base_y+3+5+folga2])
        cube([2+10-0.1,2+10,2]);

        translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1,-2,motor_base_y+3+5+folga2-10])
        cube([2,2+10,25+0.7]);
        translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1,larg_trilho_y-10,motor_base_y+3+5+folga2-10])
        cube([2,2+10,25+0.7]);
        translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1,0,motor_base_y+3+5+folga2-10+15])
        cube([2,larg_trilho_y,10+0.7]);
    }

    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+4])
    #rotate([90,0,0])
    #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+(compri_trilho_y-10-folga1)*(2/3),0,motor_base_y+3+5+folga2-10+4])
    #rotate([90,0,0])
    #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+4-15])
    #rotate([90,0,0])
    #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+(compri_trilho_y-10-folga1)*(2/3),0,motor_base_y+3+5+folga2-10+4-15])
    #rotate([90,0,0])
    #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+25+0.7-4])
    #rotate([90,0,0])
    #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1-4,0,motor_base_y+3+5+folga2-10+25+0.7-4])
    #rotate([90,0,0])
    #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+25+0.7-4+20])
    #rotate([90,0,0])
    #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1-4,0,motor_base_y+3+5+folga2-10+25+0.7-4+20])
    #rotate([90,0,0])
    #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);

    #translate([0,larg_trilho_y+2,0]){
        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+4])
        #rotate([90,0,0])
        #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+(compri_trilho_y-10-folga1)*(2/3),0,motor_base_y+3+5+folga2-10+4])
        #rotate([90,0,0])
        #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+4-15])
        #rotate([90,0,0])
        #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+(compri_trilho_y-10-folga1)*(2/3),0,motor_base_y+3+5+folga2-10+4-15])
        #rotate([90,0,0])
        #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+25+0.7-4])
        #rotate([90,0,0])
        #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1-4,0,motor_base_y+3+5+folga2-10+25+0.7-4])
        #rotate([90,0,0])
        #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+25+0.7-4+20])
        #rotate([90,0,0])
        #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1-4,0,motor_base_y+3+5+folga2-10+25+0.7-4+20])
        #rotate([90,0,0])
        #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
    }
    
    #translate([0,5,5])
    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30,0,motor_base_y+3+5+folga2-10])
    #rotate([0,-90,0]){
        #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
        #translate([0,larg_trilho_y-10,0])
        #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
        #translate([0,0,-2-compri_trilho_y]){
            #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
            #translate([0,larg_trilho_y-10,0])
            #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
        }
    }

    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1,12.5,motor_base_y+3+5+folga2+5+5.35])
    #rotate([0,90,0])
    #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1,larg_trilho_y-10-2.5,motor_base_y+3+5+folga2+5+5.35])
    #rotate([0,90,0])
    #cylinder(2,diamA_fixYZ/2,diamA_fixYZ/2,$fn=res);
}










//---------- EIXO Z ---------//
translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30,0,0])
translate([0,0,travel_y+base_eixo_limite+ motor_altura_z+3+folga1+10+motor_base_y+3+5+30+alt_sobra+0.01+3])
rotate([0,90,0]){
    // CÓPIA DO EIXO Y //
    translate([0,5,5])rotate([90,0,0])linear_extrude(5)polygon([[0,0],[motor_altura_z+3+folga1,0],[motor_altura_z+3+folga1,motor_base_y+3+folga2]]);
    translate([0,5+2*folga1+motor_base_x,0])translate([0,5,5])rotate([90,0,0])linear_extrude(5)polygon([[0,0],[motor_altura_z+3+folga1,0],[motor_altura_z+3+folga1,motor_base_y+3+folga2]]);
    cube([motor_altura_z+3+folga1+5,5+2*folga1+motor_base_x+5,5]);
    translate([motor_altura_z+3+folga1+5,0,0])cube([base_eixo_limite+5,5+2*folga1+motor_base_x+5,5]);

    difference(){
        translate([motor_altura_z+3+folga1,0,0])
        cube([5,5+2*folga1+motor_base_x+5,motor_base_y+3+folga2+5]);
        #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0])
        #cylinder(5,base_diam_eixo/2,base_diam_eixo/2,$fn=res);
        
        #translate([0,-cc,-cc])
        #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0]){
            #translate([0,0,0])cylinder(5,2,2,$fn=res);     
            #translate([cc+cc,0,0])cylinder(5,2,2,$fn=res);         
            #translate([cc+cc,cc+cc,0])cylinder(5,2,2,$fn=res);
            #translate([0,cc+cc,0])cylinder(5,2,2,$fn=res);
        };
    };

    translate([motor_altura_z+3+folga1,0,0])cube([5+base_eixo_limite+5,5,motor_base_y/2+folga2]);
    translate([motor_altura_z+3+folga1,2*folga1+motor_base_x+5,0])cube([5+base_eixo_limite+5,5,motor_base_y/2+folga2]);

    difference(){
        translate([5+base_eixo_limite,0,0])
        translate([motor_altura_z+3+folga1,0,0])
        cube([5,5+2*folga1+motor_base_x+5,motor_base_y+3+folga2+5]);
        #translate([base_eixo_limite+5,-cc,-cc])
        #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0]){
            #translate([0,0,0])cylinder(5,4,4,$fn=res);     
            #translate([0,cc+cc,0])cylinder(5,4,4,$fn=res);
        };
        #translate([base_eixo_limite+5,0,0])
        #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0])
        #cylinder(5,base_diam_eixo/2,base_diam_eixo/2,$fn=res);
    }

    //andorinha(L,theta,b,H,h,E,F,peca)

    translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1,0,0])
    rotate([90,0,90])
    andorinha(5+2*folga1+motor_base_x+5,25,10,15,5,travel_z,0.2,1);

    translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,0,0])
    rotate([90,0,90])
    andorinha(5+2*folga1+motor_base_x+5,25,10,15,5,travel_z,0.2,2);


    difference(){
        translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,0,15]){
            cube([compri_trilho_z,larg_trilho_z,alt_trilho+5+3]);
            translate([0,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5-15])
            rotate([0,-90,0])
            cylinder(alt_sobra,encaixe_trilho+t+5,encaixe_trilho+t+5,$fn=res);
            translate([travel_z+0.01+alt_sobra,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5-15])
            rotate([0,-90,0])
            cylinder(alt_sobra,encaixe_trilho+t+5,encaixe_trilho+t+5,$fn=res);
        }
        
        #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,90,0])
        #cylinder(travel_z+0.01,encaixe_trilho+t,encaixe_trilho+t,$fn=res);
        
        #translate([20-alt_sobra,-fixinha,-fixinha])
        #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0]){
            #translate([0,0,0])furo_parafuso(4,20,res,0,0);    
            #translate([2*fixinha,0,0])furo_parafuso(4,20,res,0,0);        
            #translate([2*fixinha,2*fixinha,0])furo_parafuso(4,20,res,0,0);
            #translate([0,2*fixinha,0])furo_parafuso(4,20,res,0,0);
        };
        
        #translate([20-alt_sobra,-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc])
        #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0])
        #translate([cc_sobra_parafusM3-cccc,cc_sobra_parafusM3-cccc,0])
        #rotate([0,0,45])
        #translate([-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc,0]){
            #translate([0,0,0])furo_parafuso(5,20,res,0,0);    
            #translate([2*(cc_sobra_parafusM3-cccc),0,0])furo_parafuso(5,20,res,0,0);        
            #translate([2*(cc_sobra_parafusM3-cccc),2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
            #translate([0,2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
        };
        
        #translate([-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,90,0])
        #cylinder(alt_sobra,raio_rosca+1,raio_rosca+1,$fn=res);
        
        #translate([travel_z+0.01+alt_sobra,0,0])
        #translate([0,-fixinha,-fixinha])
        #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0]){
            #translate([0,0,0])furo_parafuso(4,20,res,0,0);    
            #translate([2*fixinha,0,0])furo_parafuso(4,20,res,0,0);        
            #translate([2*fixinha,2*fixinha,0])furo_parafuso(4,20,res,0,0);
            #translate([0,2*fixinha,0])furo_parafuso(4,20,res,0,0);
        };
        
        #translate([travel_z+0.01+alt_sobra,0,0])
        #translate([0,-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc])
        #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0])
        #translate([cc_sobra_parafusM3-cccc,cc_sobra_parafusM3-cccc,0])
        #rotate([0,0,45])
        #translate([-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc,0]){
            #translate([0,0,0])furo_parafuso(5,20,res,0,0);    
            #translate([2*(cc_sobra_parafusM3-cccc),0,0])furo_parafuso(5,20,res,0,0);        
            #translate([2*(cc_sobra_parafusM3-cccc),2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
            #translate([0,2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
        };
        
        #translate([travel_z+0.01+alt_sobra,0,0])
        #translate([-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,90,0])
        #cylinder(alt_sobra,raio_rosca+1,raio_rosca+1,$fn=res);
    }
    //translate([alt_sobra-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    //rotate([0,90,0])
    //rosca_mesa_trilho(h_ros=travel_z,res=res);
    
    /*
    translate([base_eixo_limite+5+folga5,0,0])
    translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    rotate([0,90,0])
    {
        thread_for_screw(diameter=12, length=l_fuso_z);
        translate([0,0,-dda])cylinder(dda,d_ia/2,d_ia/2,$fn=100);
    }
    */
}










//---------- EIXO X ---------//
translate([(motor_altura_z+3+5+base_eixo_limite+5+folga1+travel_y)/2-(5+2*folga1+motor_base_x+5)/2,(5+2*folga1+motor_base_x+5)+motor_altura_z+3+5+base_eixo_limite+5+folga1+30,-(motor_base_y+3+5+folga2)])
rotate([0,0,-90]){
    // CÓPIA DO EIXO Y //
    translate([0,5,5])rotate([90,0,0])linear_extrude(5)polygon([[0,0],[motor_altura_z+3+folga1,0],[motor_altura_z+3+folga1,motor_base_y+3+folga2]]);
    translate([0,5+2*folga1+motor_base_x,0])translate([0,5,5])rotate([90,0,0])linear_extrude(5)polygon([[0,0],[motor_altura_z+3+folga1,0],[motor_altura_z+3+folga1,motor_base_y+3+folga2]]);
    cube([motor_altura_z+3+folga1+5,5+2*folga1+motor_base_x+5,5]);
    translate([motor_altura_z+3+folga1+5,0,0])cube([base_eixo_limite+5,5+2*folga1+motor_base_x+5,5]);

    translate([0,-larg_trilho_x/2+(5+2*folga1+motor_base_x+5)/2,-5])cube([motor_altura_z+3+folga1+5+base_eixo_limite+5+travel_x,larg_trilho_x,5]);

    difference(){
        translate([motor_altura_z+3+folga1,0,0])
        cube([5,5+2*folga1+motor_base_x+5,motor_base_y+3+folga2+5]);
        #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0])
        #cylinder(5,base_diam_eixo/2,base_diam_eixo/2,$fn=res);
        
        #translate([0,-cc,-cc])
        #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0]){
            #translate([0,0,0])cylinder(5,3.5/2,3.5/2,$fn=res);     
            #translate([cc+cc,0,0])cylinder(5,3.5/2,3.5/2,$fn=res);         
            #translate([cc+cc,cc+cc,0])cylinder(5,3.5/2,3.5/2,$fn=res);
            #translate([0,cc+cc,0])cylinder(5,3.5/2,3.5/2,$fn=res);
        };
    };

    translate([motor_altura_z+3+folga1,0,0])cube([5+base_eixo_limite+5,5,motor_base_y/2+folga2]);
    translate([motor_altura_z+3+folga1,2*folga1+motor_base_x+5,0])cube([5+base_eixo_limite+5,5,motor_base_y/2+folga2]);

    difference(){
        translate([5+base_eixo_limite,0,0])
        translate([motor_altura_z+3+folga1,0,0])
        cube([5,5+2*folga1+motor_base_x+5,motor_base_y+3+folga2+5]);
        #translate([base_eixo_limite+5,-cc,-cc])
        #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0]){
            #translate([0,0,0])cylinder(5,4,4,$fn=res);     
            #translate([0,cc+cc,0])cylinder(5,4,4,$fn=res);
        };
        #translate([base_eixo_limite+5,0,0])
        #translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0])
        #cylinder(5,base_diam_eixo/2,base_diam_eixo/2,$fn=res);
    }

    //andorinha(L,theta,b,H,h,E,F,peca)

    translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1,-larg_trilho_x/2+(5+2*folga1+motor_base_x+5)/2,0])
    rotate([90,0,90])
    andorinha(larg_trilho_x,25,10,15,5,travel_x,0.2,1);

    translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,-larg_trilho_x/2+(5+2*folga1+motor_base_x+5)/2,0])
    rotate([90,0,90])
    andorinha(larg_trilho_x,25,10,15,5,compri_trilho_x,0.2,2);


    difference(){
        translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,0,15]){
            translate([0,-larg_trilho_x/2+(5+2*folga1+motor_base_x+5)/2,0])
            cube([compri_trilho_x,larg_trilho_x,alt_trilho+5+3]);
            translate([0,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5-15])
            rotate([0,-90,0])
            cylinder(alt_sobra,encaixe_trilho+t+5,encaixe_trilho+t+5,$fn=res);
            translate([compri_trilho_x+0.01+alt_sobra,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5-15])
            rotate([0,-90,0])
            cylinder(alt_sobra,encaixe_trilho+t+5,encaixe_trilho+t+5,$fn=res);
        }
        
        #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,90,0])
        #cylinder(compri_trilho_x+0.01,encaixe_trilho+t,encaixe_trilho+t,$fn=res);
        
        #translate([20-alt_sobra,-fixinha,-fixinha])
        #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0]){
            #translate([0,0,0])furo_parafuso(4,20,res,0,0);    
            #translate([2*fixinha,0,0])furo_parafuso(4,20,res,0,0);        
            #translate([2*fixinha,2*fixinha,0])furo_parafuso(4,20,res,0,0);
            #translate([0,2*fixinha,0])furo_parafuso(4,20,res,0,0);
        };
        
        #translate([20-alt_sobra,-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc])
        #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0])
        #translate([cc_sobra_parafusM3-cccc,cc_sobra_parafusM3-cccc,0])
        #rotate([0,0,45])
        #translate([-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc,0]){
            #translate([0,0,0])furo_parafuso(5,20,res,0,0);    
            #translate([2*(cc_sobra_parafusM3-cccc),0,0])furo_parafuso(5,20,res,0,0);        
            #translate([2*(cc_sobra_parafusM3-cccc),2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
            #translate([0,2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
        };
        
        #translate([-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,90,0])
        #cylinder(alt_sobra,raio_rosca+1,raio_rosca+1,$fn=res);
        
        #translate([compri_trilho_x+0.01+alt_sobra,0,0])
        #translate([0,-fixinha,-fixinha])
        #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0]){
            #translate([0,0,0])furo_parafuso(4,20,res,0,0);    
            #translate([2*fixinha,0,0])furo_parafuso(4,20,res,0,0);        
            #translate([2*fixinha,2*fixinha,0])furo_parafuso(4,20,res,0,0);
            #translate([0,2*fixinha,0])furo_parafuso(4,20,res,0,0);
        };
        
        #translate([compri_trilho_x+0.01+alt_sobra,0,0])
        #translate([0,-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc])
        #translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,-90,0])
        #translate([cc_sobra_parafusM3-cccc,cc_sobra_parafusM3-cccc,0])
        #rotate([0,0,45])
        #translate([-cc_sobra_parafusM3+cccc,-cc_sobra_parafusM3+cccc,0]){
            #translate([0,0,0])furo_parafuso(5,20,res,0,0);    
            #translate([2*(cc_sobra_parafusM3-cccc),0,0])furo_parafuso(5,20,res,0,0);        
            #translate([2*(cc_sobra_parafusM3-cccc),2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
            #translate([0,2*(cc_sobra_parafusM3-cccc),0])furo_parafuso(5,20,res,0,0);
        };
        
        #translate([compri_trilho_x+0.01+alt_sobra,0,0])
        #translate([-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
        #rotate([0,90,0])
        #cylinder(alt_sobra,raio_rosca+1,raio_rosca+1,$fn=res);
    }
    
    /*
    translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1,0,motor_base_y+3+5+folga2])
    cube([compri_trilho_x-10-folga1,5,5+0.7]);
    translate([0,larg_trilho_x-5,0])
    translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1,0,motor_base_y+3+5+folga2])
    cube([compri_trilho_x-10-folga1,5,5+0.7]);
    translate([compri_trilho_x-10-folga1,0,0])
    translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1,0,motor_base_y+3+5+folga2])
    rotate([0,0,90])
    cube([larg_trilho_x,5,5+0.7]);
    */

    //translate([alt_sobra-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    //rotate([0,90,0])
    //rosca_mesa_trilho(h_ros=compri_trilho_x,res=res);

    /*
    translate([base_eixo_limite+5+folga5,0,0])
    translate([motor_altura_z+3+folga1+5,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
    rotate([0,90,0])
    {
        thread_for_screw(diameter=12, length=l_fuso_x);
        translate([0,0,-dda])cylinder(dda,d_ia/2,d_ia/2,$fn=100);
    }
    */
}

//translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30,0,motor_altura_z+3+5+folga2])
//cube([-alt_sobra+compri_trilho_y+0.01+2*alt_sobra,5,5]);

//translate([-0.1-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30+travel_y+0.01+2*alt_sobra,0,motor_altura_z+3+5+folga2])
//cube([5,5,5]);

//translate([5+5+base_eixo_limite+ motor_altura_z+3+folga1+compri_trilho_y+0.01,0,0])
//cube([5,5,5]);

//translate([270,10,0])
//cube([5,5,10+folga1]);

/*
translate([alt_sobra-alt_sobra+5+5+base_eixo_limite+ motor_altura_z+3+folga1+30,5+(2*folga1+motor_base_x)/2,(motor_base_y+folga2)/2+5])
rotate([0,90,0])
rosca_mesa_trilho(h_ros=compri_trilho_y,res=res);
*/

















/*
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
*/
/*
translate([0,0,70]){
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
};
*/


/*
                                    //---------- INÍCIO: FIXA EIXO Y E EIXO Z ---------//
                                    
                                    #translate([0,10,0]){
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+4])
                                        #rotate([90,0,0])
                                        #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+(compri_trilho_y-10-folga1)*(2/3),0,motor_base_y+3+5+folga2-10+4])
                                        #rotate([90,0,0])
                                        #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+4-15])
                                        #rotate([90,0,0])
                                        #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+(compri_trilho_y-10-folga1)*(2/3),0,motor_base_y+3+5+folga2-10+4-15])
                                        #rotate([90,0,0])
                                        #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+25+0.7-4])
                                        #rotate([90,0,0])
                                        #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1-4,0,motor_base_y+3+5+folga2-10+25+0.7-4])
                                        #rotate([90,0,0])
                                        #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+25+0.7-4+20])
                                        #rotate([90,0,0])
                                        #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1-4,0,motor_base_y+3+5+folga2-10+25+0.7-4+20])
                                        #rotate([90,0,0])
                                        #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                    }

                                    #translate([0,larg_trilho_y+2,0]){
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+4])
                                        #rotate([90,0,0])
                                        #cylinder(2+10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+(compri_trilho_y-10-folga1)*(2/3),0,motor_base_y+3+5+folga2-10+4])
                                        #rotate([90,0,0])
                                        #cylinder(2+10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+4-15])
                                        #rotate([90,0,0])
                                        #cylinder(2+10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+(compri_trilho_y-10-folga1)*(2/3),0,motor_base_y+3+5+folga2-10+4-15])
                                        #rotate([90,0,0])
                                        #cylinder(2+10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+25+0.7-4])
                                        #rotate([90,0,0])
                                        #cylinder(2+10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1-4,0,motor_base_y+3+5+folga2-10+25+0.7-4])
                                        #rotate([90,0,0])
                                        #cylinder(2+10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+4,0,motor_base_y+3+5+folga2-10+25+0.7-4+20])
                                        #rotate([90,0,0])
                                        #cylinder(2+10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1-4,0,motor_base_y+3+5+folga2-10+25+0.7-4+20])
                                        #rotate([90,0,0])
                                        #cylinder(2+10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                    }
                                    
                                    #translate([0,5,5])
                                    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30,0,motor_base_y+3+5+folga2-10])
                                    #rotate([0,-90,0]){
                                        #translate([0,0,-10])
                                        #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([0,larg_trilho_y-10,-10])
                                        #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        #translate([0,0,-2-compri_trilho_y]){
                                            #cylinder(2+10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                            #translate([0,larg_trilho_y-10,0])
                                            #cylinder(2+10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                        }
                                    }

                                    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1-10,12.5,motor_base_y+3+5+folga2+5+5.35])
                                    #rotate([0,90,0])
                                    #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                    #translate([motor_altura_z+3+5+base_eixo_limite+5+folga1+30+10+folga1+compri_trilho_y-10-folga1-10,larg_trilho_y-10-2.5,motor_base_y+3+5+folga2+5+5.35])
                                    #rotate([0,90,0])
                                    #cylinder(10,diamB_fixYZ/2,diamB_fixYZ/2,$fn=res);
                                    
                                    //---------- FIM: FIXA EIXO Y E EIXO Z ---------//

*/



//funcao_2d_array_cilindros(r,d,h,nx,ny,geo,res,nome="Conjunto 1")
//#translate([6.4,25+1,-5])funcao_2d_array_cilindros((6.4/2),25,5.1+5,11,1,1,res,"Mesa Óptica");
//#translate([6.4,25+1,-5+10-6.5])funcao_2d_array_cilindros((11/2),25,6.5,11,1,1,res,"Mesa Óptica");