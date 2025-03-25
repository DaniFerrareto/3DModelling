//Caixa de Acondicionamento Arduino MEGA
difference(){
cube([65,125,25]);
#translate([2.5,2.5,2.5])cube([60,120,22.5]);
#translate([(60-53.7)/2+7.48-2+2.5,0,5.8-2])cube([16.16,25,15]);
#translate([(60-53.7)/2+7.48-2+2.5+16.16-4+18.54,0,5.8-2])cube([13.18,25,15]);
}