//-----Teste de Encaixe do Rabo de Andorinha-----//
r=3;
d=20+5.15;
h=9;
nx=5;
ny=5;
geo=1;
res=10;

aux=2*d+5.15+10;
aux2=40.7-24.2+111.70-16.7-5.15/2;
aux3=11/2;
aux4=(37.55+4)/2 - (16.35+5.1/2-13.2);

cc=25;
ff=37.5;
gg=0.2; // TESTE AQUI: MUDE O "gg" CASO NECESSÁRIO

shift=(10)/2;
shift2=(2)/2;

h_alt=11/2;
hip=h_alt/(sin(60));

o_ext=d*0.75+2*shift; // Segundo rabo de andorinha
o_ext2=2*shift2+d*0.75; //Primeiro rabo de andorinha

translate([0,0,0]){
    translate([-(15-shift2+(20-(d*0.75))/2),-30,100])linear_extrude(5)polygon(points=[[35+shift2-(20-(d*0.75))/2,45],[35+shift2-(20-(d*0.75))/2,40],[27.5-gg+shift2*0.75,40],[30-gg+shift2*0.75,35+gg],[20+gg-shift2*0.75,35+gg],[22.5+gg-shift2*0.75,40],[15-shift2+(20-(d*0.75))/2,40],[15-shift2+(20-(d*0.75))/2,45]]); 
    translate([-(15-shift2+(20-(d*0.75))/2),-30,100])linear_extrude(5)polygon(points=[[15-shift2+(20-(d*0.75))/2,30],[35+shift2-(20-(d*0.75))/2,30],[35+shift2-(20-(d*0.75))/2,40],[27.5+shift2*0.75,40],[30+shift2*0.75,35],[20-shift2*0.75,35],[22.5-shift2*0.75,40],[15-shift2+(20-(d*0.75))/2,40]]);
};