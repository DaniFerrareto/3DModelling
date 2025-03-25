//Caixa de Acondicionamento Arduino UNO
difference(){
cube([65,85,25]);
#translate([2.5,2.5,2.5])cube([60,80,22.5]);
#translate([(60-53.36)/2+9.72-2+2.5,0,5.8-2+0.5])cube([16.20,25,15]);
#translate([(60-53.36)/2+9.72-2+2.5+16.20-4+19.80,0,5.8-2+0.5])cube([13.18,25,15]);
}