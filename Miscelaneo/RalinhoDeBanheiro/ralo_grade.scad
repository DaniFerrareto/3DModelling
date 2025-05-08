// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;
folga1=0.125;

rout1=105/2;
altout1=6.05;
rout2=97.2/2;
altout2=14.3-3.75;
rout3=98.55/2;
altout3=3.75;
rout4=92.65/2;
altout4=14.3;

altchao=3.05;
altsobe=8.1;

rchao=96.9/2;
rint=77.7/2;
rsobe=85.15/2;
rdep=39.5/2;

esp=1.75;
num=30;

difference(){
    translate([0,0,0]){
        cylinder(altchao,rchao,rchao,$fn=res);
        cylinder(altsobe,rsobe,rsobe,$fn=res);
    }
    #cylinder(altsobe,rint,rint,$fn=res);
}

cylinder(altsobe,rdep,rdep,$fn=res);

for(i=[0:1:num]){
    rotate([0,0,i*((360)/num)])translate([0,-esp/2,0])cube([(rsobe+rint)/2,esp,altsobe]);
}