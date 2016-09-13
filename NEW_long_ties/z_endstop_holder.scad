include <globals.scad>;
include <include.scad>;

height = 27;

difference() {
    union() {
        translate([0,0,5]) rotate([90,0,0]) male_dovetail(height=10);
        translate([-4.5, -14, 0]) cube([9,4,10]);
        translate([-2.5, -12, 0]) cube([5,12,5]);
        translate([-1.5, -height, 0]) cube([3,height,10]);
        translate([-8, -height-8, 0]) cube([16,8,15]);
    }
    translate([0, -height-8, 0]) male_dovetail(height=15);
}
