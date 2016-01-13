include <globals.scad>;
include <include.scad>;

module main(){
	difference(){
		translate([0,0,4]) cube([20,35,8], center=true);
		#rotate([90,0,0]) translate([0,0,0]) male_dovetail(25);
	}

	scale([.9,.9,.9]) translate([8.5,19.45,0]) rotate([0,0,180]) male_dovetail(25);
	scale([.9,.9,.9]) translate([-8.5,19.45,0]) rotate([0,0,180]) male_dovetail(25);
}

rotate([-90,0,0]) main();