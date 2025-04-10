use <funcArduinoUNO.scad>
module funcBaseEL3DArduinoUNO(res=100,amais2=2.6){
    // ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
    folga1=0.125;
    folga10=1;

    pcbx=41.8;
    pcbx1=66.5;
    pcbx2=68.65;
    pcby1=2.9;
    pcby2=4.65;
    pcby3=53.55-14.95;
    pcby4=53.55-13.3;
    pcby5=53.55;
    pcbz=1.6;
    pcbr=3.45/2;
    pcbalt=1.6;
    pbcentre=(35+28.8)/2;
    pcbfuro1=3.1+pcbr;

    conx=16.35;
    cony=12.1;
    conz=10.7;
    tCx=-7.8;
    tCy=28.4+3.1;

    alix=14;
    aliy=8.9;
    aliz=11;
    tAx=-4.65;
    tAy=3.1;

    pin1x=20.75;
    pin2x=15.6;
    pin3x=25.8;
    pin4x=20.75;
    piny=2.55;
    pinz=8.55;
    tpin1x=26.7;
    tpin2x=tpin1x+pin1x+2.05;
    tpin3x=18;
    tpin4x=tpin3x+pin3x+0.9;
    tpinbaixoy=1.3;
    tpinaltoy=pcby5-1-piny;

    conectDisspx=9;
    conectDisspy=9;
    conectDisspz=4.55;
    tDsx=2;
    tDsy=2.75;

    conectEDSx=2.35;
    conectEDSy=7.2;
    conectEDSz=2.6;
    tEDSx=2.55;

    conectStepx=9.1;
    conectStepy=9.85;
    conectStepz=5.7;
    tSx=pcbx-conectStepx-0.6;

    conectStep123x=1.45;
    conectStep123y=3.25;
    conectStep123z=1.25;
    tS1x=tSx+conectStepx/2-(3*conectStep123x+2)/2;
    tS2x=tS1x+1+conectStep123x;
    tS3x=tS2x+1+conectStep123x;

    fio06=0.6;
    fioz=5.75;

    rcx=6.75;
    rcy=6.55;
    rcz=2;
    trcx=2.35;
    trcy=pcby5-rcy-0.7;

    rbr=3/2;
    rbalt=1;
    trbx=trcx+(rcx-6.25)+6.25/2;
    trby=trcy+rcy/2;

    ISCPx=5;
    ISCPy=7.35;
    ISCPz=2.6;
    tISCPx=pcbx2-ISCPx-0.8;
    tISCPy=24.4;

    oscr=3.5/2;
    oscalt=4;
    oscx=4.45;
    oscy=11.3;
    oscz=1.1;
    oschull=10-3.5;
    toscx=pcbx2-oscx-13.4;
    toscy=32.35-oscy+tpinbaixoy;

    osc2r=3.5/2;
    osc2alt=4;
    osc2x=11.3;
    osc2y=4.45;
    osc2z=1.1;
    osc2hull=10-3.5;
    tosc2x=pcbx2-osc2x-46.1;
    tosc2y=pcby5-osc2y-12.9;

    capr=6.3/2;
    capalt=6;
    cap2alt=6-4.1;
    tcapx=pcbx2-4*capr-43.65-0.6;
    tcap2x=pcbx2-2*capr-43.65;
    tcapy=6.05;

    espParede=2;
    baseARDx=pcbx2+2*folga10;
    baseARDy=pcby5+2*folga10;
    baseARDz=2.4;

    // ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
    module arrayPins(pit,alt,l,n){
        for(i=[0:1:n-1]){
            translate([i*(l/n)+(l/n)/2-pit/2,0,0])cube([pit,pit,alt]);
        }
    }
    
    //translate([espParede+folga10,espParede+folga10,espParede])funcArduinoUNO(res,amais2);

    // ----- ----- ----- MAIN ----- ----- ----- //

    // Base do Arduino
    difference(){
        translate([-folga1,-folga1,0])
        cube([baseARDx+2*espParede+2*folga1,baseARDy+2*espParede+2*folga1,baseARDz+espParede]);
        #translate([espParede,espParede,espParede])cube([baseARDx,baseARDy,baseARDz]);
    }
    // Encaixe Cilíndrico do Arduino
    translate([espParede+folga10,espParede+folga10,espParede]){
        translate([12.65+pcbr,0.65+pcbr,0])cylinder(pcbalt+amais2+espParede,pcbr-folga1,pcbr-folga1,$fn=res);
        translate([13.85+pcbr,pcby5-0.7-pcbr,0])cylinder(pcbalt+amais2+espParede,pcbr-folga1,pcbr-folga1,$fn=res);
        translate([pcbx2-0.35-pcbr,5.8+pcbr,0])cylinder(pcbalt+amais2+espParede,pcbr-folga1,pcbr-folga1,$fn=res);
        translate([pcbx2-0.4-pcbr,pcby5-16.3-pcbr,0])cylinder(pcbalt+amais2+espParede,pcbr-folga1,pcbr-folga1,$fn=res);
    }
} 

funcBaseEL3DArduinoUNO();
