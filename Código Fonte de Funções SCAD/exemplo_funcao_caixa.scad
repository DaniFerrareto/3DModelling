//-----FUNÇÃO CAIXA E TAMPA RETANGULAR-----//

// Forneça as três dimensões do objeto a ser encaixotado: a,b,c
// Leve em conta que as dimensões a,b,c precisam ter um tamanho um pouco maior do que as reais dimensões do objeto, no mínimo 0.5 mm maiores
// Forneça a espessura da caixa e da tampa: d
// Forneça a altura da tampa: h
// Encaixe por fora (true) ou encaixe por dentro (false)?

rr=0.1; //Espaço de sobra


module funcao_caixa(a,b,c,d,h,encaixe){
    if(encaixe){
    /*---Encaixe por fora---*/
        /*---Caixa---*/
        difference(){
            cube([a+2*d,b+2*d,c+d]);
            #translate([d,d,d])cube([a,b,c]);
        };
        /*---Tampa---*/
        translate([a+2*d+2,0,0])difference(){
            cube([a+4*d+2*rr,b+4*d+2*rr,h]);
            #translate([d,d,d])cube([a+2*d+2*rr,b+2*d+2*rr,h-d]);
        };
    }else{
    /*---Encaixe por dentro---*/
        /*---Caixa---*/
        difference(){
            cube([a+2*d,b+2*d,c+2*d]);
            #translate([d,d,d])cube([a,b,c+d]);
        };
        /*---Tampa---*/
        translate([a+2*d+2,0,0])cube([a+2*d,b+2*d,d]);
        translate([a+2*d+2,0,0])difference(){
            translate([d+rr,d+rr,d])cube([a-2*rr,b-2*rr,d]);
            #translate([2*d+rr,2*d+rr,d])cube([a-2*rr-2*d,b-2*rr-2*d,d]);
        };
    };
};

// Caso Encaixe por fora, o tamanho da caixa com a tampa posta é [a+4*d+2*rr,b+4*d+2*rr,c+2*d]  
// Caso Encaixe por dentro, o tamanho da caixa com a tampa posta é [a+2*d,b+2*d,c+3*d] 

a=100;
b=100;
c=100;
d=4;
h=10;
encaixe=false;

funcao_caixa(a,b,c,d,h,encaixe);