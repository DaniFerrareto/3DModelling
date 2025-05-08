use <funcoes_GFCx.scad>
module funcSuporteDoCuboBaixo_v2(){
    // ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
    res=100;
    folga1=0.125;
    
    xeuss_x=76.3;
    xeuss_y=76.3;
    xeuss_z=5;
    
    rInt=10.45;
    rExt=12.45;
    alt=15;
    
    rx=6.6/2;
    tr_x=13.65;
    tr_cil=10+rx;
    cc = (56.5+43.45)/2;


    // ----- ----- ----- Declaração de Funções ----- ----- ----- //
    
    //funcao_2d_array_cilindros(r,d,h,nx,ny,geo,res,nome="Conjunto 1")
    
    /*
    difference(){
        translate([-25,-25,0])cube([100,100,5]);
        #translate([-12.5,-12.5,0])
        #funcao_2d_array_cilindros(7/2,25.2, 5,4,4,1,res,nome="Base do Suporte");
    }*/
    
    translate([-25,-25,0])
    translate([50,50,0])
    translate([0,0,5])
    difference(){
        cylinder(alt,rExt,rExt,$fn=res);
        #cylinder(alt,rInt,rInt,$fn=res);
    }
    
    translate([-25,-25,0])
    translate([50,50,0])
    translate([-xeuss_x/2,-xeuss_y/2,0])
    difference(){
        translate([0,0,0])cube([xeuss_x,xeuss_y,xeuss_z]);
        translate([tr_cil,tr_cil,0]){
            #translate([0,0,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
            #translate([cc,0,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
            #translate([0,cc,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
            #translate([cc,cc,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
        }
    }
}

translate([25,25,0])
translate([-50,-50,0])
funcSuporteDoCuboBaixo_v2();