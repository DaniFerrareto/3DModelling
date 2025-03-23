a=72.2; //Lado da base
b=72.2; //Outro lado da base
h=7; //altura da base
dd=6; //diametro do parafuso que irá fixar a base
HH=70; //altura disponível de deslocamento
l=41.90; //Lado do motor de passo
h_eixo=45-5.4; //Altura do motor em relação a direção do seu eixo
//----------Peça 1----------//
cube([a,b,h]);

//----------Peça 2----------//
translate([0,14-3,h])cube([a,4,HH]);
translate([0,b-15,h])cube([a,4,HH]);

translate([0,14-3,h])cube([a,3,HH]);
translate([0,b-14,h])cube([a,3,HH]);

translate([0,0,h])difference(){
    translate([-2,-2,0])translate([(a-l-2)/2,(b-l-2)/2,HH])cube([l+2+4,l+2+4,h_eixo+1+2]);
    #translate([(a-l)/2,(b-l)/2,HH])cube([l+2,l+2,h_eixo+1]);
}
