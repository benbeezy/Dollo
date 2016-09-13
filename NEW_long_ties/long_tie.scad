length = 50;
tilt_level = 1.1;
scaling_x = .9;
scaling_y = 1;
scaling_z = 1;
include <include.scad>;
include <globals.scad>;

$fn=30;
module end(){
    difference() {
        translate([-4, -5, -0.2]) cube([8, 5, 6]);
        translate([0, 0, -0.5])cylinder(r=3.8, h=7);
    }
}

module tie() {
    intersection() {
        intersection() {
            rotate([90,0,0]) male_dovetail(height=length);
            rotate([90,0,0]) cylinder(r=5.9, h=200);
        }
        translate([0,0,3.3]) rotate([90,0,0]) cylinder(r=3.9, h=100);
    }
}
scale([scaling_x,scaling_y,scaling_z]) difference () {
    tie();
    translate([0, -(length -3.5), 0]) end();
    translate([0, -3.5, 0]) rotate([0,0,180]) end();
}