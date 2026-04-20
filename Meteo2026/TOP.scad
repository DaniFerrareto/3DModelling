echo(version=version());

    difference (){
    //objeto base
        translate([0, 0, 0])
            linear_extrude(height = 15, scale = 1.4, slices = 200)
                circle(r=25 , $fn= 100);
    
    //objeto a ser subtraido
        translate([0, 0, 2])
            linear_extrude(height = 15, scale = 1.4, slices = 200)
                circle(r=25 , $fn= 100);
    }
translate([20,0,0])
    cylinder(h = 15,r = 2,$fn = 100);
translate([-10,17.3,0])
    cylinder(h = 15, r = 2, $fn = 100);
translate([-10,-17.3,0])
    cylinder(h = 15,r= 2, $fn = 100);
   
// Written in 2015 by Torsten Paul <Torsten.Paul@gmx.de>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
