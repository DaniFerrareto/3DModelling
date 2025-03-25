//lateral suporte motor
cc=31/2;
hh=50+40;
difference(){
    rotate([0,-90,0]){
    //difference(){   
      //  translate([0,-(a-50)/2,0])cube([50,a,5]);
        //#translate([25,25,-5])    
        //cylinder(20,11,11,$fn=150);      
        //#translate([25-cc,25-cc,-5]) 
        //cylinder(hh,2.5,2.5,$fn=150);     
        //#translate([25+cc,25-cc,-5]) 
        //cylinder(hh,2.5,2.5,$fn=150);         
        //#translate([25+cc,25+cc,-5]) 
        //cylinder(hh,2.5,2.5,$fn=150);
        //#translate([25-cc,25+cc,-5]) 
        //cylinder(hh,2.5,2.5,$fn=150);         
    //};
    //base inicial
    translate([0,-(a-50)/2,0])cube([5,a,40+45.5+5+1+1+22+1]);


    a=71.60;
    b=35.90;
    translate([0,-(a-50)/2,40+47.5])difference(){   
        translate([0,0,-5-0])cube([b+5+2,a,5]);
        //#translate([5+4+2.3,32+4,-60])    
        //cylinder(70,4.5,4.5,$fn=150);      
        #translate([5+4+21.3,2.4+4,-60]) 
        cylinder(hh,4.5,4.5,$fn=150);     
        #translate([5+4+21.5,a-(2.6+4),-60]) 
        cylinder(hh,4.5,4.5,$fn=150);  
        //#translate([13+6-8,(a-40)/2,0])
        //cube([b-14+8,40,5]);
        
        #translate([D,15-4.2,-10])translate([25-cc,25-cc,00]) 
        cylinder(hh+10,3,3,$fn=150);
        #translate([D,15-4.2,-10])translate([25-cc,25+cc,00]) 
        cylinder(hh+10,3,3,$fn=150);
        
        //#translate([25+0.1+D,25+11-0.1,-5])cylinder(110,11,11,$fn=150);
        #translate([25+0.1+D-11,25+11-0.1-11,-5])cube([22+1,22,5]);
    };

    //D=8.2, d=5
    //21.5, 18.7
    D=21.5+8.2 -18.7 -5;
    //lateral fixacao movimentador
    difference(){
        translate([0,-15,40])difference(){ 
            cube([50+10,80,5]);
            //#translate([20-15+6,25+5+10,0]) cylinder(5,6,6);   
            //#translate([25-cc,25+cc+15,-10]) 
            //cylinder(hh,3,3,$fn=150);
            //#translate([25-cc,25+cc-15,-10]) 
            //cylinder(hh,3,3,$fn=150);
            //#translate([0,50+15+(a-50)/2,0])cube([50,10,5]);
            //#translate([0,-10+15-(a-50)/2,0])cube([50,10,5]);
        };     
        #translate([D+25-cc,25-cc,40]) 
        cylinder(hh+10,2,2,$fn=150);     
        #translate([D+25+cc,25-cc,40]) 
        cylinder(hh+10,2,2,$fn=150);         
        #translate([D+25+cc,25+cc,40]) 
        cylinder(hh+10,2,2,$fn=150);
        #translate([D+25-cc,25+cc,40]) 
        cylinder(hh+10,2,2,$fn=150);
        
        #translate([25+D,25,-5])cylinder(110,11,11,$fn=150);
        
        #translate([5+4+21.3,2.4+4-11,-40]) 
        cylinder(hh,4.5,4.5,$fn=150);    
        #translate([5+4+21.5,a-(2.6+4)-11,-40]) 
        cylinder(hh,4.5,4.5,$fn=150);
    };

    j=6;
    translate([10-j,-2.5,40]) cube([10+j,5,45]);
    translate([10-j,45+2.5,40]) cube([10+j,5,45]);

    dd=6+20;
    translate([5,-(a-50)/2,47.5+2.5+40+47.5+5+23])rotate([0,-90,0])rotate([0,0,90])difference(){
            cube([a,50,5]);
            #translate([18.4+6/2,(50-6-20)/2,0])cylinder(5,8/2,8/2,$fn=150);
            #translate([18.4+6/2,(50-6-20)/2+dd,0])cylinder(5,8/2,8/2,$fn=150);
        }
    };  
    dd= 5+20;
    #translate([-3.5-6*dd,(50-6-2.8-20)/2,0])cylinder(5,4,4,$fn=150);
    #translate([-2.5-5*dd,(50-6-2.8-20)/2,0])cylinder(5,4,4,$fn=150);
    #translate([-1.5-4*dd,(50-6-2.8-20)/2,0])cylinder(5,4,4,$fn=150);
    #translate([-0.5-3*dd,(50-6-2.8-20)/2,0])cylinder(5,4,4,$fn=150);
    #translate([1.5-2*dd,(50-6-2.8-20)/2,0])cylinder(5,4,4,$fn=150);
    #translate([1.5-1*dd,(50-6-2.8-20)/2,0])cylinder(5,4,4,$fn=150);
    
    #translate([-3.5-6*dd,(50-6-2.8-20)/2+dd,0])cylinder(5,4,4,$fn=150);
    #translate([-2.5-5*dd,(50-6-2.8-20)/2+dd,0])cylinder(5,4,4,$fn=150);
    #translate([-1.5-4*dd,(50-6-2.8-20)/2+dd,0])cylinder(5,4,4,$fn=150);
    #translate([-0.5-3*dd,(50-6-2.8-20)/2+dd,0])cylinder(5,4,4,$fn=150);
    #translate([1.5-2*dd,(50-6-2.8-20)/2+dd,0])cylinder(5,4,4,$fn=150);
    #translate([2.5-1*dd,(50-6-2.8-20)/2+dd,0])cylinder(5,4,4,$fn=150);
}
