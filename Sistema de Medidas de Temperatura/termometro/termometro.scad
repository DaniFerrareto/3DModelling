res=10;
dd=((41.5-28.5)/2)-1.7;
ddd=28.5+3.4;

// CAIXA DE ACONDICIONAMENTO DO MAX31865
MAXx=25.3+1;
MAXy=28.1+1;
MAXz=22.5;
translate([100,0,0]){
    difference(){
    cube([MAXx+1,MAXy+1,MAXz+1]);
    #translate([0.5,0.5,1])cube([MAXx,MAXy,MAXz]);
    #translate([(MAXx+1 - 18.10-3)/2,0,2.5])cube([18.10+3,2,12.5]);
    }
    difference(){
        translate([0,0,0]){
                translate([1.5+0.85+1.6,2+1+0.85+1.6,-4])cylinder(15.5+2,1.6+0.5,1.6-0.5,$fn=res);
                translate([MAXx+2.5-2-1-0.85-1.6,2+1+0.85+1.6,-4])cylinder(15.5+2,1.6+0.5,1.6-0.5,$fn=res);
        }
        #translate([0,0,-4])cube([aMEGAx+4,aMEGAy+4,4]);
}
}

// CAIXA DE ACONDICIONAMENTO DO ARDUINO UNO

//aUNOx=53.75+2;
//aUNOy=68.7+2;
//aUNOz=22.5;

aMEGAx=60;
aMEGAy=120;
aMEGAz=22.5;
translate([0,0,0]){
    difference(){
        cube([aMEGAx+4,aMEGAy+4,aMEGAz+2]);
        #translate([2,2,2])cube([aMEGAx,aMEGAy,aMEGAz]);
        #translate([2+1+9.35-1,0,2])cube([12.15+2,2,50]);
        #translate([2+1+9.35+12.15+19.65-1,0,2])cube([9.15+2,2,50]);
    }
    difference(){
            translate([0,0,0]){
                translate([2+1+1.7+1,2+1+13.55+1.7,-6])cylinder(22.5+2,1.7+0.5,1.7-0.5,$fn=res);
                translate([2+1+1.7+15.85,68.7+2+4-2-1-1.7-0.3,-6])cylinder(22.5+2,1.7+0.5,1.7-0.5,$fn=res);
                translate([53.75+2+4-2-1-1.7-5.9,68.7+2+4-2-1-1.7-0.3,-6])cylinder(22.5+2,1.7+0.5,1.7-0.5,$fn=res);
                translate([53.75+2+4-2-1-1.7-0.65,2+1+12.4+1.7,-6])cylinder(22.5+2,1.7+0.5,1.7-0.5,$fn=res);
                translate([2+1+1.7+1,2+1+13.55+1.7+3.4+72,-6])cylinder(22.5+2,1.7+0.5,1.7-0.5,$fn=res);
                translate([53.75+2+4-2-1-1.7-0.65,2+1+12.4+1.7+3.4+79.55,-6])cylinder(22.5+2,1.7+0.5,1.7-0.5,$fn=res);
            }
            #translate([0,0,-6])cube([aMEGAx+4,aMEGAy+4,6]);
            #translate([0,0,aMEGAz+2-10])cube([aMEGAx+4,aMEGAy+4,10]);
        }
}

//TESTES DE FUNIL
derd1=0.1;
derd2=0.2;
derd3=0.3;
derd4=0.4;
derd5=0.5;
derd6=0.6;
translate([-10,0,0])cylinder(22.5+2,1.7+derd1,1.7-derd1,$fn=res);
translate([-20,0,0])cylinder(22.5+2,1.7+derd2,1.7-derd2,$fn=res);
translate([-30,0,0])cylinder(22.5+2,1.7+derd3,1.7-derd3,$fn=res);
translate([-40,0,0])cylinder(22.5+2,1.7+derd4,1.7-derd4,$fn=res);
translate([-50,0,0])cylinder(22.5+2,1.7+derd5,1.7-derd5,$fn=res);
translate([-60,0,0])cylinder(22.5+2,1.7+derd6,1.7-derd6,$fn=res);

// CAIXA DE ACONDICIONAMENTO DO LCD

translate([0,0,-10-14])cube([60,98,14]);