$fn = 100;
length = 15;
include <include.scad>;
include <globals.scad>;

module bow_tie_master(){
union(){
	mirror([0,1,0]) intersection(){
		rotate([0,-45,0]) cube([obj_leg,obj_leg,obj_leg]);
		male_dovetail(height=length);
	}

	intersection(){
		#rotate([0,-45,0]) cube([obj_leg,obj_leg,obj_leg]);
		male_dovetail(height=length);
	}
}
}
module bow_holes() {
	translate([-10,-2.5,-2]) rotate([0,90,0]) #cylinder(h=50, d=1.5);
	translate([-10,2.5,-2]) rotate([0,90,0]) #cylinder(h=50, d=1.5);
}

rotate([0,45*3,0]){
difference(){
	scale([0.9,0.9,0.85]) rotate([0,180,0]) bow_tie_master();
	bow_holes();
}
}
