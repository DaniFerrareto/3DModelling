module funcArduinoUNO(res=10,amais=2.6){
    // ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
    folga1=0.125;

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

    // ----- ----- ----- Declaração de Variáveis ----- ----- ----- //
    module arrayPins(pit,alt,l,n){
        for(i=[0:1:n-1]){
            translate([i*(l/n)+(l/n)/2-pit/2,0,0])cube([pit,pit,alt]);
        }
    }

    // ----- ----- ----- MAIN ----- ----- ----- //
    // PCB
    difference(){
        linear_extrude(pcbz+amais)polygon(points=[[    0,    0],
                                                  [pcbx1,    0],
                                                  [pcbx1,pcby1],
                                                  [pcbx2,pcby2],
                                                  [pcbx2,pcby3],
                                                  [pcbx1,pcby4],
                                                  [pcbx1,pcby5],
                                                  [    0,pcby5]]);
        #translate([12.65+pcbr,0.65+pcbr,0])cylinder(pcbalt+amais,pcbr,pcbr,$fn=res);
        #translate([13.85+pcbr,pcby5-0.7-pcbr,0])cylinder(pcbalt+amais,pcbr,pcbr,$fn=res);
        #translate([pcbx2-0.35-pcbr,5.8+pcbr,0])cylinder(pcbalt+amais,pcbr,pcbr,$fn=res);
        #translate([pcbx2-0.4-pcbr,pcby5-16.3-pcbr,0])cylinder(pcbalt+amais,pcbr,pcbr,$fn=res);
    }
    // Periféricos de Comunicação/Conexão e Alimentação
    translate([tCx,tCy,pcbz+amais])cube([conx,cony,conz]);
    translate([tAx,tAy,pcbz+amais])cube([alix,aliy,aliz]);
    // Pinos Macho e Fêmea
    translate([tpin1x,tpinbaixoy,pcbz+amais])cube([pin1x,piny,pinz]);
    translate([tpin1x,tpinbaixoy+piny+0.5,pcbz+amais])cube([pin1x,piny,conectEDSz]);
    translate([tpin1x,tpinbaixoy+piny+0.5+piny/2-fio06/2,pcbz+amais+conectEDSz])arrayPins(fio06,fioz,pin1x,8);
    translate([tpin2x,tpinbaixoy,pcbz+amais])cube([pin2x,piny,pinz]);
    translate([tpin2x,tpinbaixoy+piny+0.5,pcbz+amais])cube([pin2x,piny,conectEDSz]);
    translate([tpin2x,tpinbaixoy+piny+0.5+piny/2-fio06/2,pcbz+amais+conectEDSz])arrayPins(fio06,fioz,pin2x,6);
    translate([tpin3x,tpinaltoy,pcbz+amais])cube([pin3x,piny,pinz]);
    translate([tpin3x,tpinaltoy-piny-0.5,pcbz+amais])cube([pin3x,piny,conectEDSz]);
    translate([tpin3x,tpinaltoy-piny-0.5+piny/2-fio06/2,pcbz+amais+conectEDSz])arrayPins(fio06,fioz,pin3x,10);
    translate([tpin4x,tpinaltoy,pcbz+amais])cube([pin4x,piny,pinz]);
    translate([tpin4x,tpinaltoy-piny-0.5,pcbz+amais])cube([pin4x,piny,conectEDSz]);
    translate([tpin4x,tpinaltoy-piny-0.5+piny/2-fio06/2,pcbz+amais+conectEDSz])arrayPins(fio06,fioz,pin4x,8);
    // Botão de Reset
    translate([trcx,trcy,pcbz+amais])cube([rcx,rcy,rcz]);
    translate([trbx,trby,pcbz+amais+rcz])cylinder(rbalt,rbr,rbr,$fn=res);
    // Conexão ISCP
    translate([tISCPx,tISCPy,pcbz+amais])cube([ISCPx,ISCPy,ISCPz]);
    translate([tISCPx,tISCPy+(ISCPy/3)/2-fio06/2,pcbz+amais+ISCPz])arrayPins(fio06,fioz,ISCPx,2);
    translate([tISCPx,tISCPy+ISCPy/3+(ISCPy/3)/2-fio06/2,pcbz+amais+ISCPz])arrayPins(fio06,fioz,ISCPx,2);
    translate([tISCPx,tISCPy+ISCPy/3+ISCPy/3+(ISCPy/3)/2-fio06/2,pcbz+amais+ISCPz])arrayPins(fio06,fioz,ISCPx,2);
    // Osciladores 1 e 2
    translate([toscx,toscy,pcbz+amais])cube([oscx,oscy,oscz]);
    hull(){
        translate([toscx+oscx/2,toscy+oscy/2-oschull/2,pcbz+amais])cylinder(oscalt,oscr,oscr,$fn=res);
        translate([toscx+oscx/2,toscy+oscy/2+oschull/2,pcbz+amais])cylinder(oscalt,oscr,oscr,$fn=res);
    }
    translate([tosc2x,tosc2y,pcbz+amais])cube([osc2x,osc2y,osc2z]);
    hull(){
        translate([tosc2x+osc2x/2-oschull/2,tosc2y+osc2y/2,pcbz+amais])cylinder(oscalt,oscr,oscr,$fn=res);
        translate([tosc2x+osc2x/2+oschull/2,tosc2y+osc2y/2,pcbz+amais])cylinder(oscalt,oscr,oscr,$fn=res);
    }
    // Capacitores
    translate([tcapx,tcapy,pcbz+amais])cube([2*capr,2*capr,cap2alt]);
    translate([tcap2x,tcapy,pcbz+amais])cube([2*capr,2*capr,cap2alt]);
    translate([tcapx+capr,tcapy+capr,pcbz+amais])cylinder(capalt,capr,capr,$fn=res);
    translate([tcap2x+capr,tcapy+capr,pcbz+amais])cylinder(capalt,capr,capr,$fn=res);
}

funcArduinoUNO(100);