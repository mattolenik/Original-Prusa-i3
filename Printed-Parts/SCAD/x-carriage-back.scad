// PRUSA iteration4
// X carriage back
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org


module m3head()
{
    intersection()
    {
        translate([30,5,9])cylinder(r=3.1,h = 25); // head cut
        translate([30,5,17-3.5]) cube([6.2,3.4,1], center=true);
    }
    translate([30,5,17-4]) cube([3.4,3.4,1], center=true);
    translate([30,5,17-3.5])cylinder(r=3.1,h = 20); // head cut
}



module x_carriage_back(bearing_dia=15)
{
    t=1;
    edge=1;
    l=20.55;
    w=16.15;
    h=2;
    offset=[20,-26,23.1];
    bearing_r = bearing_dia/2;
    translate([-1, -4, -15.1]) // Align to center around central screw head
    difference() {
    union() {
    difference()
    {
        union()
        {
            // base block
            translate([-16,-40.0,15.1]) cube([33,73,8]);
            translate([-25.5,4,15.1]) cube([52,30.5,8]);
        }

        // lower bearing cut
        translate([-17,-25,7.5]) cube([35,6,10]);

        // cables opening
        translate([-4.5,-18,15]) cube([10,4,10]);
        translate([0.5,-18,10]) rotate([0,0,90]) cylinder( h=32, r=5 );
        translate([0.5,-14,10]) rotate([0,0,90]) cylinder( h=32, r=5 );
        translate([-20,-19.5,9]) cube([50,7.5,10]);

        // bearings
        //translate([-15,-25,11.75]) rotate([0,90,0]) cylinder( h=31, r=bearing_r, $fn=150 );
        //translate([-30,20,11.75]) rotate([0,90,0]) cylinder( h=60, r=bearing_r, $fn=150 );
        //translate([-17,-25,11.75]) rotate([0,90,0]) cylinder( h=60, r=7 );
        //translate([-32,20,11.75]) rotate([0,90,0]) cylinder( h=80, r=7 );

        //translate([-15,-25-2,18]) cube([30,4,2]);
        //translate([-30,20-2,18]) cube([60,4,2]);


        // hold together screws
        translate([-5,-36,10]) rotate([0,0,0]) cylinder( h=50, r=1.65, $fn=50 );
        translate([1,4,10]) rotate([0,0,0]) cylinder( h=50, r=1.65, $fn=50 );
        translate([13,31,10]) rotate([0,0,0]) cylinder( h=50, r=1.65, $fn=50 );
        translate([-10.5,31,10]) rotate([0,0,0]) cylinder( h=50, r=1.65, $fn=50 );
        translate([13,31,19]) cylinder( h=50, r=3.1 );
        translate([-10.5,31,19]) cylinder( h=50, r=3.1 );

        // lower screw heads
        translate([-5,-36,19]) cylinder( h=6, r=3.1 );
        translate([-8.1,-46,18]) cube([6.2,10,10]);


        // center screw head
        translate([1,4,18]) cylinder( h=7, r=3.1 );

        // heat cables cut
        translate([10.15,-37,4]) rotate([0,-20,0])
        union()
            {
            cylinder(r=3, h=40);
            translate([-3,-10,0])cube([6,10,40]);
            }
        translate([5.85,-37,4]) rotate([0,-10,0])
        union()
            {
            cylinder(r=3, h=40);
            translate([-3,-10,0])cube([6,10,40]);
            }
        // cable holder screw
        translate([0.5,-27,11]) rotate([0,0,90]) cylinder( h=40, r=1.6 );
        translate([0.5,-27,16.75]) rotate([0,0,0]) cylinder( h=5, r=3.1, $fn=6 );

        // x-carriage screws in belt holders
        translate([-11.5,-0.5,10]) rotate([0,0,90]) cylinder( h=40, r=3 );

        difference()
        {
            union()
            {
            translate([28,-4,10]) rotate([0,0,90]) cube([10,22,15]);
            translate([-4,-4,10]) rotate([0,0,90]) cube([10,22,15]);
            }
            difference()
            {
                translate([-14,-4,30]) rotate([0,45,0]) cube([22,22,22]);
                union()
                {
                translate([9,-4,15]) cube([22,22,22]);
                translate([-28,-4,15]) cube([22,22,22]);
                }
            }
        }

        translate([9,0,16]) rotate([45,0,0]) cube([50,10,10]);
        translate([-36,0,16]) rotate([45,0,0]) cube([30,10,10]);
        // nice edges
        translate([-20.8,-47.1,10]) rotate([0,0,45]) cube([10,10,15]);
        translate([21.8,-47.1,10]) rotate([0,0,45]) cube([10,10,15]);
        //translate([-24.4,15.2,10]) rotate([0,0,45]) cube([14,10,15]);
        //translate([26.9,15.2,10]) rotate([0,0,45]) cube([10,14,15]);
        //translate([-19.55,28,10]) rotate([0,0,45]) cube([10,10,15]);
        //translate([22.05,28,10]) rotate([0,0,45]) cube([10,10,15]);
        translate([-22,35,21]) rotate([30,0,0]) cube([44,10,10]);

        translate([-26,35,17]) rotate([30,0,0]) cube([18.5,10,10]);
        translate([10,35,17]) rotate([30,0,0]) cube([17.5,10,10]);

        translate([-20.8,-40.5,16]) rotate([50,0,0]) cube([50,20,10]);

        // upper side cuts
        //translate([17,25,10]) rotate([0,0,0]) cube([10,10,15]);
        //translate([-29.5,25,10]) rotate([0,0,0]) cube([15,15,15]);
        //translate([17,22,13]) rotate([0,0,0]) cube([10,10,5]);
        //translate([-24.5,22,13]) rotate([0,0,0]) cube([10,10,5]);

        //// side edges
        // Top half
        translate([28.5,-15,16]) rotate([0,-30,0]) cube([10,50,10]);
        translate([-36.2,-15,21]) rotate([0,30,0]) cube([10,50,10]);
        // Bottom half
        translate([-27.1,-50,21]) rotate([0,30,0]) cube([10,50,10]);
        translate([19.5,-50,16]) rotate([0,-30,0]) cube([10,50,10]);

        // inner cable cleanup
        translate([-1,-19.5,14]) rotate([0,30,0]) cube([10,7.5,10]);
        translate([-5,-19.5,10]) rotate([0,-30,0]) cube([10,7.5,10]);

        // supports
        translate([-17,26,5]) m3head();
        translate([-40.5,26,5]) m3head();
        translate([-29,-1,4]) m3head();
        translate([-35,-41,4]) m3head();
        translate([-8.1,-40,17.5]) cube([6.2,4,5]);
        translate([-8.1,-37.7,17.0]) cube([6.2,2,5]);
        translate([-5,-36,11.51]) rotate([0,0,0]) cylinder( h=5, r=1.8, $fn=50 );


        // selective infill
        translate([5,-8,16]) cube([0.5,20,6.5]);
        translate([-3.25,-8,16]) cube([0.5,20,6.5]);
        translate([0.75,-8,16]) cube([0.5,7,6.5]);
}
        translate(offset)
            #cuboid([l+edge, w+edge, h], anchor=TOP);
    }
    // accelerometer mount
    translate(offset)
        #cuboid([l-edge, w-edge, t], anchor=TOP);
    }
}

