
// ----- ----- ----- DECLARAÇÃO DE VARIÁVEIS ----- ----- ----- //
res=100;
esp_peca=5;
dedfx=6.6+6; // dist entre os diferentes furos em x
ygBase=82.55;

basex=72.7;
basey=70.75;
basez=esp_peca;

vertx=esp_peca;
verty=basey;
vertz=112.5;

rFuro=7/2;
altFuro=esp_peca;
ofsZ=16;

holex=esp_peca;
holey=25-esp_peca;
holez=45;

FuroY=2*rFuro;
FuroZ=esp_peca;

//sub_auxX=(basex - (2*rFuro+2*25.2))/2 + rFuro;
sub_auxY=(basey - (2*rFuro+2*25.2))/2 + rFuro;
sub_auxX=5.3+6/2;

// ----- ----- ----- DECLARAÇÃO DE FUNÇÕES ----- ----- ----- //
use <funcoes_GFCx.scad>

// ----- ----- ----- Base ----- ----- ----- //
difference(){
    cube([basex,basey,basez]);    
    #translate([sub_auxX,sub_auxY,0])
    #funcao_2d_array_cilindros(rFuro,25.2,altFuro,3,3,geo=1,res=res,nome="Furos da Base");
    //#funcao_2d_array_cilindros(r,d,h,nx,ny,geo,res,nome="Conjunto 1")
    #translate([sub_auxX+25.2,sub_auxY-rFuro,0])cube([25.2,FuroY,FuroZ]);
    #translate([sub_auxX+25.2,sub_auxY-rFuro,0])cube([25.2,FuroY,FuroZ]);
    #translate([sub_auxX,25.2+sub_auxY-rFuro,0])cube([25.2,FuroY,FuroZ]);
    #translate([sub_auxX+25.2,2*25.2+sub_auxY-rFuro,0])cube([25.2,FuroY,FuroZ]);
    #translate([sub_auxX+25.2-dedfx,sub_auxY,0])cylinder(altFuro,rFuro,rFuro,$fn=res);
    #translate([sub_auxX,sub_auxY-rFuro,0])cube([25.2-dedfx,2*rFuro,esp_peca]);
    #translate([sub_auxX+25.2-dedfx,sub_auxY+2*25.2,0])cylinder(altFuro,rFuro,rFuro,$fn=res);
    #translate([sub_auxX,sub_auxY-rFuro+2*25.2,0])cube([25.2-dedfx,2*rFuro,esp_peca]);
    #translate([sub_auxX+25.2+dedfx,sub_auxY+25.2,0])cylinder(altFuro,rFuro,rFuro,$fn=res);
    #translate([sub_auxX+25.2+dedfx,sub_auxY-rFuro+25.2,0])cube([25.2-dedfx,2*rFuro,esp_peca]);
}

// ----- ----- ----- Vertical ----- ----- ----- //
translate([basex-esp_peca,0,esp_peca])
difference(){
    cube([vertx,verty,vertz]); 
    #translate([0,verty/2-holey/2,ofsZ+ygBase/2-holez/2])
    #cube([esp_peca,holey,holez]);
    #translate([esp_peca,sub_auxY,0])
    {
        #translate([0,0,17+3-esp_peca])
        #rotate([0,-90,0])#cylinder(altFuro,rFuro,rFuro,$fn=res);
        #translate([0,0,17+3-esp_peca+37.5-6])
        #rotate([0,-90,0])#cylinder(altFuro,rFuro,rFuro,$fn=res);
        #translate([0,0,17+3-esp_peca+37.5-6+13.25+6])
        #rotate([0,-90,0])#cylinder(altFuro,rFuro,rFuro,$fn=res);
        #translate([0,0,17+3-esp_peca+37.5-6+13.25+6+37.5-6])
        #rotate([0,-90,0])#cylinder(altFuro,rFuro,rFuro,$fn=res);
        #translate([-esp_peca,-rFuro,17+3-esp_peca])cube([esp_peca,2*rFuro,37.5-6]);
        #translate([-esp_peca,-rFuro,17+3-esp_peca+37.5-6+13.25+6])cube([esp_peca,2*rFuro,37.5-6]);
        #translate([0,2*25.2,0])
        {
            #translate([0,0,17+3-esp_peca])
            #rotate([0,-90,0])#cylinder(altFuro,rFuro,rFuro,$fn=res);
            #translate([0,0,17+3-esp_peca+37.5-6])
            #rotate([0,-90,0])#cylinder(altFuro,rFuro,rFuro,$fn=res);
            #translate([0,0,17+3-esp_peca+37.5-6+13.25+6])
            #rotate([0,-90,0])#cylinder(altFuro,rFuro,rFuro,$fn=res);
            #translate([0,0,17+3-esp_peca+37.5-6+13.25+6+37.5-6])
            #rotate([0,-90,0])#cylinder(altFuro,rFuro,rFuro,$fn=res);
            #translate([-esp_peca,-rFuro,17+3-esp_peca])cube([esp_peca,2*rFuro,37.5-6]);
            #translate([-esp_peca,-rFuro,17+3-esp_peca+37.5-6+13.25+6])cube([esp_peca,2*rFuro,37.5-6]);
        }
    }
}

// ----- ----- ----- Triângulo ----- ----- ----- //
translate([0,esp_peca/2+sub_auxY+25.2/2,esp_peca])
rotate([90,0,0])
linear_extrude(esp_peca)polygon([[0,0],
                                 [basex-esp_peca,0],
                                 [basex-esp_peca,vertz]]);
translate([0,esp_peca/2+sub_auxY+(3/2)*25.2,esp_peca])
rotate([90,0,0])
linear_extrude(esp_peca)polygon([[0,0],
                                 [basex-esp_peca,0],
                                 [basex-esp_peca,vertz]]);