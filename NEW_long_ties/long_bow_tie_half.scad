length = 50;
tilt_level = 1.1;
scaling_x = .9;
scaling_y = 1;
scaling_z = 1;
include <include.scad>;
include <globals.scad>;

obj_leg= 12;

module half_dove() {
    intersection() {
        #translate([0.1,0,0]) cube([10, 10, length]);
        male_dovetail(height=length);
    }
}

module bow_tie_master(){
	union(){
		mirror([0,1,0]){
			half_dove();
		}
		half_dove();		
	}
}

intersection(){
    scale([scaling_x,scaling_y,scaling_z])	rotate([90,270,0]) bow_tie_master();
    rotate([90,0,0]) cylinder(r=5.7, h=200);
}