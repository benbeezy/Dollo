use <long_bow_tie.scad>;
include <include.scad>;
include <globals.scad>;

$fn=35;

module fixing_pin() {
    difference() {
        union() {
            cylinder(3, r=3.2);
            hull() {
                translate([0,0,3]) cylinder(0.5, r=3.2);
                translate([0,0,3.5]) cylinder(1, r=3.7);
                translate([0,0,4.5]) cylinder(1, r=2);
            }
        }
        cube([8,1.5,12], center=true);
    }
}

module fixing_plate() {
    difference() {
        translate([-14.5,0,10]) cube([7,74,20], center = true);
		union() {
			// fixing plate cutout
			translate([-16,34,0]) rotate([45,0,0]) cube([16,16,7], center = true);
			translate([-16,-34,0]) rotate([135,0,0]) cube([16,16,7], center = true);
			translate([-16,34,20]) rotate([135,0,0]) cube([16,16,7], center = true);
			translate([-16,-34,20]) rotate([45,0,0]) cube([16,16,7], center = true);
		}
	}
	translate([-18,30.5,10]) rotate([0,270,0]) fixing_pin();
	translate([-18,-30.5,10]) rotate([0,270,0]) fixing_pin();

}

module do_airtrippers_bowden_mount() {
    difference() {
        translate([0,0,-11]) rotate([0,90,0]) fixing_plate();
        translate([10,40,0]) rotate([90,0,0]) male_dovetail(height=80);
    }
}

do_airtrippers_bowden_mount();