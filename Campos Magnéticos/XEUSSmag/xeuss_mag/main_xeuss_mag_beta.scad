res=10;

x_encaixe=70;
y_encaixe=20;
z_encaixe=3;

splh_x=x_encaixe;
splh_y=10;
splh_z=60.35-z_encaixe;

diff_splh_x=57;
diff_splh_y=10;
diff_splh_z=19.25;

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
folga1=0.15;

Xdelize=xeuss_x;
Ydelize=25;
Zdelize=11.7-xeuss_z;

alt_poly=15-Zdelize-xeuss_z;
esp_poly=2.5;
apt_poly=7.4;
poly5=5;

use <funcoes_GFCx>

//translate([tr_x,xeuss_y,0])cube([xt,yt,zt]); não apague, mas também não descomente


difference(){
    translate([0,0,0])cube([xeuss_x,xeuss_y,xeuss_z]);
    translate([tr_cil,tr_cil,0]){
        #translate([0,0,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
        #translate([cc,0,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
        #translate([0,cc,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
        #translate([cc,cc,0])cylinder(xeuss_z,rx+folga1,rx+folga1,$fn=res);
    }
}

translate([0,xeuss_y/2-Ydelize/2,xeuss_z])cube([Xdelize,Ydelize,Zdelize]);

translate([0,xeuss_y/2-Ydelize/2,xeuss_z+Zdelize]){
    linear_extrude(alt_poly)polygon([[0,0],[xeuss_x,0],[xeuss_x,apt_poly],[xeuss_x-poly5,esp_poly-folga1],[poly5,esp_poly-folga1]]);
    translate([0,Ydelize,0])linear_extrude(alt_poly)polygon([[0,0],[xeuss_x,0],[xeuss_x,-apt_poly],[xeuss_x-poly5,-esp_poly+folga1],[poly5,-esp_poly+folga1]]);
}

translate([0,xeuss_y/2-Ydelize/2+esp_poly,xeuss_z+Zdelize]){
    cube([x_encaixe,y_encaixe,z_encaixe]);
    difference(){
        translate([0,y_encaixe/2-splh_y/2,0])cube([splh_x,splh_y,splh_z]);
        #translate([splh_x/2-diff_splh_x/2,y_encaixe/2-splh_y/2,splh_z-(splh_x/2-diff_splh_x/2)-diff_splh_z])cube([diff_splh_x,diff_splh_y,diff_splh_z]);
    }
}