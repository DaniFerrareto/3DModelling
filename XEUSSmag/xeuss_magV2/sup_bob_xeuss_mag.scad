
// ----- ----- Declaração de Variáveis ----- ----- //

res=10;

folga1=0.15;
folga2=0.05;

cubo=50;

ds_splh=(44+40)/2;
d_splh=ds_splh/12; //3.5

diff_splh_x=17;
diff_splh_y=10;
diff_splh_z=19.25;

raio_bobina=12.5;

xeuss_x=76.3;
xeuss_y=76.3;
xeuss_z=5;

xt=14;
yt=89.8-xeuss_y;
zt=xeuss_z;

rx=6.6/2;
tr_x=13.65;
tr_cil=10+rx;
cc = (56.5+43.45)/2;

Xdelize=xeuss_x;
Ydelize=25;
Zdelize=11.7-xeuss_z;

alt_poly=15-Zdelize-xeuss_z;
esp_poly=2.5;
apt_poly=7.4;
poly5=5;

x_encaixe=xeuss_x-2*poly5;
y_encaixe=20;
z_encaixe=3;

splh_x=20;
splh_y=10;
splh_z=60.35-z_encaixe;
r_splh=1;

alt_bob=11;

esp_pottop=3;
long_pottop=6.5;
alt_quad=5;
trans_aux2=-diff_splh_z/2-cubo/2+xeuss_z+Zdelize+splh_z-splh_x/2+diff_splh_x/2+z_encaixe-folga1-esp_pottop-alt_bob-alt_quad;
desce_enough=trans_aux2-xeuss_z-folga2;
gordura=1;

// ----- ----- Declaração de Bibliotecas ----- ----- //
use <funcoes_GFCx.scad>
use <module_Cubo.scad>
use <module_MontagemDoCubo.scad>

//não apague, mas também não descomente
//translate([tr_x,xeuss_y,0])cube([xt,yt,zt]); 

// ----- ----- Declaração de Funções ----- ----- //
module pottop(param,param2,folga,alt){
    translate([-param-folga,-param-folga,-param-folga]){
        cube([param+param2,param,param+param2]);
        cube([param,param+param2,param+param2]);
        translate([0,0,-alt])cube([param+param2,param+param2,param+alt]);
    }
}

/*
// ----- ----- Base Atuador Manual Linear ----- ----- //
difference(){
    translate([0,0,0])cube([xeuss_x,xeuss_y,xeuss_z]);
    translate([tr_cil,tr_cil,0]){
        #translate([0,0,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
        #translate([cc,0,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
        #translate([0,cc,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
        #translate([cc,cc,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
    }
}*/

/*
// ----- ----- Suporte de Amostras ----- ----- //
translate([0,xeuss_y/2-Ydelize/2,xeuss_z])cube([Xdelize,Ydelize,Zdelize]);
translate([0,xeuss_y/2-Ydelize/2,xeuss_z+Zdelize]){
    linear_extrude(alt_poly)polygon([[0,0],[xeuss_x,0],[xeuss_x,apt_poly],[xeuss_x-poly5,esp_poly-folga1],[poly5,esp_poly-folga1]]);
    translate([0,Ydelize,0])linear_extrude(alt_poly)polygon([[0,0],[xeuss_x,0],[xeuss_x,-apt_poly],[xeuss_x-poly5,-esp_poly+folga1],[poly5,-esp_poly+folga1]]);
}
translate([poly5,xeuss_y/2-Ydelize/2+esp_poly,xeuss_z+Zdelize]){
    cube([x_encaixe,y_encaixe,z_encaixe]);
    difference(){
        translate([x_encaixe/2-splh_x/2,y_encaixe/2-splh_y/2,z_encaixe])cube([splh_x,splh_y,splh_z]);
        #translate([x_encaixe/2-splh_x/2+splh_x/2-diff_splh_x/2,y_encaixe/2-splh_y/2,splh_z-(splh_x/2-diff_splh_x/2)-diff_splh_z+z_encaixe])
        #cube([diff_splh_x,diff_splh_y,diff_splh_z]);
        #translate([0,0,-10])
        #translate([x_encaixe/2-splh_x/2+splh_x/2-(4*d_splh)/2,y_encaixe/2,splh_z-(splh_x/2-diff_splh_x/2)-diff_splh_z+z_encaixe])
        #funcao_2d_array_cilindros(r_splh,d_splh,10+splh_x/2-diff_splh_x/2+diff_splh_z,5,1,1,res,"Conjunto Sample Holder");
        #translate([0,0,-10])
        #translate([x_encaixe/2-splh_x/2+splh_x/2-(d_splh*4)/2,y_encaixe/2,splh_z-(splh_x/2-diff_splh_x/2)-diff_splh_z+z_encaixe])
        #3d_array_sp_cb(1,1,1,1,d_splh,30,5,1,1,1,"sphere",res,"Conjunto Sample Holder Esferas");
    }
}*/

difference(){
    translate([xeuss_x/2-cubo/2,xeuss_x/2-cubo/2,0])
    translate([0,0,splh_z-(splh_x/2-diff_splh_x/2)-diff_splh_z+z_encaixe])
    translate([0,0,xeuss_z+Zdelize])
    translate([0,0,diff_splh_z/2-cubo/2]){
        //MontagemDoCubo();
        //Cubo();
        
        pottop(esp_pottop,long_pottop,folga1,alt_bob);
        translate([50,0,0])rotate([0,0,90])pottop(esp_pottop,long_pottop,folga1,alt_bob);
        translate([50,50,0])rotate([0,0,2*90])pottop(esp_pottop,long_pottop,folga1,alt_bob);
        translate([0,50,0])rotate([0,0,3*90])pottop(esp_pottop,long_pottop,folga1,alt_bob);

        translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
        cube([cubo+2*esp_pottop+2*folga1,cubo+2*esp_pottop+2*folga1,alt_quad]);
        /*
        translate([0,0,-desce_enough-folga2]){
            translate([(long_pottop+esp_pottop)*1.5,esp_pottop,0])
            translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
            cube([long_pottop,long_pottop,desce_enough]);
            translate([-(long_pottop+esp_pottop)*1.5,esp_pottop,0])
            translate([cubo+2*esp_pottop+2*folga1-long_pottop,0,0])
            translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
            cube([long_pottop,long_pottop,desce_enough]);
            translate([0,cubo+2*esp_pottop+2*folga1-long_pottop-esp_pottop,0]){
                translate([(long_pottop+esp_pottop)*1.5,0,0])
                translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
                cube([long_pottop,long_pottop,desce_enough]);
                translate([-(long_pottop+esp_pottop)*1.5,0,0])
                translate([cubo+2*esp_pottop+2*folga1-long_pottop,0,0])
                translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
                cube([long_pottop,long_pottop,desce_enough]);
            }
        }*/
    }
    #translate([poly5,xeuss_y/2-Ydelize/2+esp_poly,xeuss_z+Zdelize])
    #translate([x_encaixe/2-(splh_x*1.2)/2,y_encaixe/2-(splh_y*1.2)/2,z_encaixe])
    #cube([splh_x*1.2,splh_y*1.2,splh_z*0.2]);
    
    #translate([0,0,gordura])
    #translate([xeuss_x/2-cubo/2,xeuss_x/2-cubo/2,0])
    #translate([0,0,splh_z-(splh_x/2-diff_splh_x/2)-diff_splh_z+z_encaixe])
    #translate([0,0,xeuss_z+Zdelize])
    #translate([0,0,diff_splh_z/2-cubo/2])
    translate([0,0,-desce_enough-folga2]){
        translate([(long_pottop+esp_pottop)*1.5,esp_pottop,0])
        translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
        cube([long_pottop,long_pottop,desce_enough]);
        translate([-(long_pottop+esp_pottop)*1.5,esp_pottop,0])
        translate([cubo+2*esp_pottop+2*folga1-long_pottop,0,0])
        translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
        cube([long_pottop,long_pottop,desce_enough]);
        translate([0,cubo+2*esp_pottop+2*folga1-long_pottop-esp_pottop,0]){
            translate([(long_pottop+esp_pottop)*1.5,0,0])
            translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
            cube([long_pottop,long_pottop,desce_enough]);
            translate([-(long_pottop+esp_pottop)*1.5,0,0])
            translate([cubo+2*esp_pottop+2*folga1-long_pottop,0,0])
            translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
            cube([long_pottop,long_pottop,desce_enough]);
        }
    }
}
/*
difference(){
    translate([0,0,folga2])
    translate([xeuss_x/2-cubo/2,xeuss_x/2-cubo/2,0])
    translate([0,0,splh_z-(splh_x/2-diff_splh_x/2)-diff_splh_z+z_encaixe])
    translate([0,0,xeuss_z+Zdelize])
    translate([0,0,diff_splh_z/2-cubo/2])
    translate([0,0,-desce_enough-folga2]){
        translate([-gordura,-gordura,0])
        translate([(long_pottop+esp_pottop)*1.5,esp_pottop,0])
        translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
        cube([long_pottop+2*gordura,long_pottop+2*gordura,desce_enough-folga2]);
        translate([-gordura,-gordura,0])
        translate([-(long_pottop+esp_pottop)*1.5,esp_pottop,0])
        translate([cubo+2*esp_pottop+2*folga1-long_pottop,0,0])
        translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
        cube([long_pottop+2*gordura,long_pottop+2*gordura,desce_enough-folga2]);
        translate([0,cubo+2*esp_pottop+2*folga1-long_pottop-esp_pottop,0]){
            translate([-gordura,-gordura,0])
            translate([(long_pottop+esp_pottop)*1.5,0,0])
            translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
            cube([long_pottop+2*gordura,long_pottop+2*gordura,desce_enough-folga2]);
            translate([-gordura,-gordura,0])
            translate([-(long_pottop+esp_pottop)*1.5,0,0])
            translate([cubo+2*esp_pottop+2*folga1-long_pottop,0,0])
            translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
            cube([long_pottop+2*gordura,long_pottop+2*gordura,desce_enough-folga2]);
        }
    }
    #translate([0,0,-folga2])
    #translate([xeuss_x/2-cubo/2,xeuss_x/2-cubo/2,0])
    #translate([0,0,splh_z-(splh_x/2-diff_splh_x/2)-diff_splh_z+z_encaixe])
    #translate([0,0,xeuss_z+Zdelize])
    #translate([0,0,diff_splh_z/2-cubo/2])
    #translate([0,0,-desce_enough-folga2]){
        #translate([-folga1,-folga1,0])
        #translate([(long_pottop+esp_pottop)*1.5,esp_pottop,0])
        #translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
        #cube([long_pottop+2*folga1,long_pottop+2*folga1,gordura]);
        #translate([-folga1,-folga1,0])
        #translate([-(long_pottop+esp_pottop)*1.5,esp_pottop,0])
        #translate([cubo+2*esp_pottop+2*folga1-long_pottop,0,0])
        #translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
        #cube([long_pottop+2*folga1,long_pottop+2*folga1,gordura]);
        #translate([0,cubo+2*esp_pottop+2*folga1-long_pottop-esp_pottop,0]){
            #translate([-folga1,-folga1,0])
            #translate([(long_pottop+esp_pottop)*1.5,0,0])
            #translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
            #cube([long_pottop+2*folga1,long_pottop+2*folga1,gordura]);
            #translate([-folga1,-folga1,0])
            #translate([-(long_pottop+esp_pottop)*1.5,0,0])
            #translate([cubo+2*esp_pottop+2*folga1-long_pottop,0,0])
            #translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
            #cube([long_pottop+2*folga1,long_pottop+2*folga1,gordura]);
        }
    }
}*/

/*
translate([0,0,gordura+folga2])
translate([xeuss_x/2-cubo/2,xeuss_x/2-cubo/2,0])
translate([0,0,splh_z-(splh_x/2-diff_splh_x/2)-diff_splh_z+z_encaixe])
translate([0,0,xeuss_z+Zdelize])
translate([0,0,diff_splh_z/2-cubo/2])
translate([0,0,-desce_enough-folga2]){
    translate([folga1,folga1,0])
    translate([(long_pottop+esp_pottop)*1.5,esp_pottop,0])
    translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
    cube([long_pottop-2*folga1,long_pottop-2*folga1,desce_enough-2*folga2]);
    translate([folga1,folga1,0])
    translate([-(long_pottop+esp_pottop)*1.5,esp_pottop,0])
    translate([cubo+2*esp_pottop+2*folga1-long_pottop,0,0])
    translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
    cube([long_pottop-2*folga1,long_pottop-2*folga1,desce_enough-2*folga2]);
    translate([0,cubo+2*esp_pottop+2*folga1-long_pottop-esp_pottop,0]){
        translate([folga1,folga1,0])
        translate([(long_pottop+esp_pottop)*1.5,0,0])
        translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
        cube([long_pottop-2*folga1,long_pottop-2*folga1,desce_enough-2*folga2]);
        translate([folga1,folga1,0])
        translate([-(long_pottop+esp_pottop)*1.5,0,0])
        translate([cubo+2*esp_pottop+2*folga1-long_pottop,0,0])
        translate([-folga1-esp_pottop,-folga1-esp_pottop,-folga1-esp_pottop-alt_bob-alt_quad])
        cube([long_pottop-2*folga1,long_pottop-2*folga1,desce_enough-2*folga2]);
    }
}*/