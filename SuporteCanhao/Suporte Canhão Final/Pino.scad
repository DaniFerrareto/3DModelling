module pino(res){
    folga=0.1; //TESTE AQUI, VEJA SE A FOLGA ESTÁ BOA!
    cylinder(4-folga,5,5,$fn=res);
    cylinder(7,2.5,2.5,$fn=res);
    translate([0,0,7])
    difference(){
        cylinder(6,5,5,$fn=res);
        #translate([0,0,2])cylinder(4,2.5,2.5,$fn=res);
    };
}

pino(100);