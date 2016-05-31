length = 50;
tilt_level = 1.1;
scaling_x = .9;
scaling_y = 1;
scaling_z = 1;
include <include.scad>;
include <globals.scad>;

intersection() {
    intersection() {
        scale([scaling_x,scaling_y,scaling_z])	rotate([90,0,0])	 male_dovetail(height=length);
        rotate([90,0,0]) cylinder(r=5.7, h=200);
    }
    translate([0,0,3.2]) rotate([90,0,0]) cylinder(r=3.7, h=100);
}