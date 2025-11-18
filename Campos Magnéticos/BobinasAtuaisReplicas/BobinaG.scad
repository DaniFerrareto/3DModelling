// ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
res=100;
folga1=0.125;

altParedBob=5.4;
entrePared=13;
rParedBob=110/2;
altguia=5*altParedBob+4*entrePared;
rguia=30/2;
rint=25/2;

espgarrinha=0.4;
altespgarrinha=0.8;
rgarrinha=(30.4-0.8)/2;
altgarrinha=3.3;

num=12;
esp=2.15;

// ----- ----- ----- Declaração de Funções ----- ----- ----- //


// ----- ----- ----- MAIN ----- ----- ----- //
difference(){
    translate([0,0,0]){
        cylinder(altguia,rguia,rguia,$fn=res);
        for(i=[0:1:4]){
            translate([0,0,i*(altParedBob+entrePared)])
            cylinder(altParedBob,rParedBob,rParedBob,$fn=res);
        }
        translate([0,0,altguia])
        cylinder(altgarrinha,rgarrinha,rgarrinha,$fn=res);
        translate([0,0,altguia+altgarrinha-altespgarrinha])
        cylinder(altespgarrinha,rgarrinha+espgarrinha,rgarrinha+espgarrinha,$fn=res);
        
        translate([0,0,-altgarrinha])
        cylinder(altgarrinha,rgarrinha,rgarrinha,$fn=res);
        translate([0,0,-altgarrinha])
        cylinder(altespgarrinha,rgarrinha+espgarrinha,rgarrinha+espgarrinha,$fn=res);
    }
    
    #translate([0,0,-altgarrinha])cylinder(altguia+2*altgarrinha,rint,rint,$fn=res);
    
    for(i=[0:1:11]){
        #rotate([0,0,i*(360/12)])
        #translate([0,-esp/2,altguia])
        #cube([rguia+rint,esp,altgarrinha]);
    }
    
    for(i=[0:1:11]){
        #rotate([0,0,i*(360/12)])
        #translate([0,-esp/2,-altgarrinha])
        #cube([rguia+rint,esp,altgarrinha]);
    }
}