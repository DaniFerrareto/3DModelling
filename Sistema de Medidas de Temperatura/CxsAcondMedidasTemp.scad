res=10;
dd=((41.5-28.5)/2)-1.7;
ddd=28.5+3.4;

// CAIXA DE ACONDICIONAMENTO DO MOTOR DE PASSO
translate([53.75+2+4-2,0,0]){
    difference(){
        cube([43.5+4,36.75+4,22.5+2]);
        #translate([2,2,2])cube([43.5,36.75,22.5]);
        #translate([2+1+41.5-14-3,0,2])cube([14+1+3,2,9+4]);
    }

    dd=((41.5-28.5)/2)-1.7;
    ddd=28.5+3.4;

    translate([3+dd,36.75+4-2-1-3.4,0])cylinder(20+4,1.7+0.5,1.7-0.5,$fn=res);
    translate([3+dd+ddd,36.75+4-2-1-3.4,0])cylinder(20+4,1.7+0.5,1.7-0.5,$fn=res);
}

// CAIXA DE ACONDICIONAMENTO DO ARDUINO UNO
translate([0,0,0]){
    difference(){
        cube([53.75+2+4,68.7+2+4,22.5+2]);
        #translate([2,2,2])cube([53.75+2,68.7+2,22.5]);
        #translate([2+1+9.35-1,0,2])cube([12.15+2,2,50]);
        #translate([2+1+9.35+12.15+19.65-1,0,2])cube([9.15+2,2,50]);
    }

    translate([2+1+1.7+1,2+1+13.55+1.7, 0])cylinder(22.5+2,1.7+0.5,1.7-0.5,$fn=res);
    translate([2+1+1.7+15.85,68.7+2+4-2-1-1.7-0.3, 0])cylinder(22.5+2,1.7+0.5,1.7-0.5,$fn=res);
    translate([53.75+2+4-2-1-1.7-5.9,68.7+2+4-2-1-1.7-0.3, 0])cylinder(22.5+2,1.7+0.5,1.7-0.5,$fn=res);
    translate([53.75+2+4-2-1-1.7-0.65,2+1+12.4+1.7, 0])cylinder(22.5+2,1.7+0.5,1.7-0.5,$fn=res);
}

// CAIXA DE ACONDICIONAMENTO DO MAX31865
translate([53.75+2+4+25.3+2+4-2,28.1+2+4+36.75+4-2,0])rotate([0,0,180]){
    difference(){
    cube([25.3+2+4,28.1+2+4,22.5+2]);
    #translate([2,2,2])cube([25.3+2,28.1+2,22.5]);
    #translate([7-1.5,0,2.5])cube([18.10+3,25,12.5]);
    }

    translate([2+1+0.85+1.6,2+1+0.85+1.6,0])cylinder(15.5+2,1.6+0.5,1.6-0.5,$fn=res);
    translate([25.3+2+4-2-1-0.85-1.6,2+1+0.85+1.6,0])cylinder(15.5+2,1.6+0.5,1.6-0.5,$fn=res);
}