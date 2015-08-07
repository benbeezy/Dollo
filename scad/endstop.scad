include <include.scad>;
include <globals.scad>;
$fn=20;
switch_length = 20.5;
switch_depth = 6;
switch_width = 11;
radius = 1;

module button(){
	difference(){
		hull(){
			translate([radius/2,radius/2,0]) cylinder(h=switch_depth, d=radius);
			translate([switch_length-radius/2,radius/2,0]) cylinder(h=switch_depth, d=radius);
			translate([radius/2,switch_width-radius/2,0]) cylinder(h=switch_depth, d=radius);
			translate([switch_length-radius/2,switch_width-radius/2,0]) cylinder(h=switch_depth, d=radius);
		}
		//union(){
		//	translate([radius/2,radius/2,0]) cylinder(h=switch_depth, d=3);
		//	translate([switch_length-radius/2,switch_width-radius/2,0]) cylinder(h=switch_depth, d=3);
		//}
	}
}
module button_plus(){
	button();
	hull(){
		translate([-5,10,3]) sphere(r=3);
		translate([-5,10,10]) sphere(r=3);
		translate([16,10,3]) sphere(r=3);
		translate([16,10,10]) sphere(r=3);
	}
	
	hull(){
		translate([25,0,3]) sphere(r=3);
		translate([25,0,10]) sphere(r=3);
		translate([5,0,3]) sphere(r=3);
		translate([5,0,10]) sphere(r=3);
	}
}

translate([-3,-2,8]) cube([4,9,1]);

difference(){
	difference(){
		translate([-3,-2,-5]) cube([switch_length+6,switch_width+3,switch_depth+7]);
		translate([0,0,2]) button_plus();
	}
	#rotate([90,0,0]) translate([switch_width,-5,-13]) male_dovetail(height=15);
}