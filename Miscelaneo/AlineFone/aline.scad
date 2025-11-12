// ----- ----- FONE DA ALINE ----- ----- //

// ----- ----- Declaração de Variáveis ----- ----- //
RC=155/2;
rC=25/2;
newrC=8.9;
rCil=0.99*RC;
esp=1;

esp2=1;
espx=4.8;

rfio=5.8/2;
angulo=25;
$fn = 100; // Number of fragments - higher = smoother

easy=0.75;
more1=2.2;
more2=2;
more3=0.95;
dede=16.4;

// ----- ----- Declaração de Funções ----- ----- //
module torus(R = RC, rz = rC, rx=newrC) {
    translate([R, 0, 0])resize(newsize=[2*rx,2*rz,0])circle(rz);
}

module sb(arco){
    rotate([0,0,(arco/RC)*(360/(2*PI))])translate([0,0,dede/2]) // sem buraquinho
    rotate_extrude(angle=angulo-(arco/RC)*(360/(2*PI))){
        union(){
            aux=newrC-espx-0.9;
            aux2=10.825-dede/2-esp;
            aux3=2;
            translate([RC-newrC+espx-aux3/2,0.9,0])square([aux/2+0.15+aux3/2,0.9]);
            translate([RC-newrC+espx-aux3,0,0])square([aux/2+0.15+aux3,0.9]);
            translate([RC-newrC+espx,0,0])square([aux/2+0.15,2.7]);
            translate([RC-newrC+espx+aux/2+0.15,easy,0])square([aux/2,3]);
            translate([RC-newrC+espx+aux+0.15,0,0])square([1,aux2]);
            translate([RC-newrC+espx+aux+0.15,aux2,0])polygon(points=[[0,0],[1,0],[0,0.8]]);
        }
    }
    mirror([0,0,1])rotate([0,0,(arco/RC)*(360/(2*PI))])translate([0,0,dede/2]) // sem buraquinho
    rotate_extrude(angle=angulo-(arco/RC)*(360/(2*PI))){
        union(){
            aux=newrC-espx-0.9;
            aux2=10.825-dede/2-esp;
            aux3=2;
            translate([RC-newrC+espx-aux3/2,0.9,0])square([aux/2+0.15+aux3/2,0.9]);
            translate([RC-newrC+espx-aux3,0,0])square([aux/2+0.15+aux3,0.9]);
            translate([RC-newrC+espx,0,0])square([aux/2+0.15,2.7]);
            translate([RC-newrC+espx+aux/2+0.15,easy,0])square([aux/2,3]);
            translate([RC-newrC+espx+aux+0.15,0,0])square([1,aux2]);
            translate([RC-newrC+espx+aux+0.15,aux2,0])polygon(points=[[0,0],[1,0],[0,0.8]]);
        }
    }
}

module cb(arco){
    rotate([0,0,(arco/RC)*(360/(2*PI))])translate([0,0,dede/2]) // com buraquinho
    rotate_extrude(angle=angulo-(arco/RC)*(360/(2*PI))){
        union(){
            aux=newrC-espx-0.9;
            aux2=10.825-dede/2-esp;
            aux3=2;
            translate([RC-newrC+espx-aux3/2,0.9,0])square([aux/2+0.15+aux3/2,0.9]);
            translate([RC-newrC+espx-aux3,0,0])square([aux/2+0.15+aux3,0.9]);
            translate([RC-newrC+espx,0,0])square([aux/2+0.15,2.7]);
            translate([RC-newrC+espx+aux/2+0.15,easy,0])square([aux/2,aux2+0.8-easy]);
            translate([RC-newrC+espx+aux+0.15,0,0])square([1,aux2]);
            translate([RC-newrC+espx+aux+0.15,aux2,0])polygon(points=[[0,0],[1,0],[0,0.8]]);
        }
    }
    mirror([0,0,1])rotate([0,0,(arco/RC)*(360/(2*PI))])translate([0,0,dede/2]) // com buraquinho
    rotate_extrude(angle=angulo-(arco/RC)*(360/(2*PI))){
        union(){
            aux=newrC-espx-0.9;
            aux2=10.825-dede/2-esp;
            aux3=2;
            translate([RC-newrC+espx-aux3/2,0.9,0])square([aux/2+0.15+aux3/2,0.9]);
            translate([RC-newrC+espx-aux3,0,0])square([aux/2+0.15+aux3,0.9]);
            translate([RC-newrC+espx,0,0])square([aux/2+0.15,2.7]);
            translate([RC-newrC+espx+aux/2+0.15,easy,0])square([aux/2,aux2+0.8-easy]);
            translate([RC-newrC+espx+aux+0.15,0,0])square([1,aux2]);
            translate([RC-newrC+espx+aux+0.15,aux2,0])polygon(points=[[0,0],[1,0],[0,0.8]]);
        }
    }
}

module pontinha(arcosb,arcocb){
    intersection(){
        union(){
            difference(){
                sb(arcosb);
                #cb(arcocb);
            }
        }
        union(){
            intersection(){
                #cylinder(2*rC,rCil,rCil,center=true);
                #translate([RC,0,0])resize(newsize=[2*newrC-2*esp,2*rC,0])sphere(rC-esp);
            }
            intersection(){
                #rotate_extrude(angle=angulo)torus(rz=rC-esp,rx=newrC-esp);
                #cylinder(2*rC,rCil,rCil,center=true);
            }
        }
    }
}

// ----- ----- MAIN ----- ----- //

sb(30); // deslize sem buraquinho 
cb(1); // deslize com buraquinho


// Concave
difference(){
    union(){
        intersection(){
            cylinder(2*rC,rCil,rCil,center=true);
            translate([RC,0,0])resize(newsize=[2*newrC,2*rC,0])sphere(rC);
        }
        intersection(){
            rotate_extrude(angle=angulo)torus();
            cylinder(2*rC,rCil,rCil,center=true);
        }
    }
    union(){
        intersection(){
            #cylinder(2*rC,rCil,rCil,center=true);
            #translate([RC,0,0])resize(newsize=[2*newrC-2*esp,2*rC,0])sphere(rC-esp);
        }
        intersection(){
            #rotate_extrude(angle=angulo)torus(rz=rC-esp,rx=newrC-esp);
            #cylinder(2*rC,rCil,rCil,center=true);
        }
    }
}

// Cube Bloqueador
intersection(){
    rotate([0,0,angulo])translate([RC-newrC,-esp2,-rC])cube([espx,esp2,2*rC]);
    union(){
        intersection(){
            #cylinder(2*rC,rCil,rCil,center=true);
            #translate([RC,0,0])resize(newsize=[2*newrC-2*esp,2*rC,0])sphere(rC-esp);
        }
        intersection(){
            #rotate_extrude(angle=angulo)torus(rz=rC-esp,rx=newrC-esp);
            #cylinder(2*rC,rCil,rCil,center=true);
        }
    }
}

pontinha(10,10);
esp3=3;
color("blue"){
difference(){
    union(){
        intersection(){
            difference(){
                cylinder(2*rC,rCil+esp3,rCil+esp3,center=true);
                #cylinder(2*rC,rCil,rCil,center=true);
            } 
            #rotate_extrude(angle=angulo)torus(R=rCil+esp3/2,rz=2*rC);
        }
        intersection(){
            translate([rCil,0,0])rotate([0,90,0])cylinder(3*esp3,rC,rC,center=true);
            difference(){
                cylinder(2*rC,rCil+esp3,rCil+esp3,center=true);
                #cylinder(2*rC,rCil,rCil,center=true);
            }
        }
    }
    #rotate([0,0,0.1])cb(1); // deslize com buraquinho
}
}