length = 50;
tilt_level = 1.1;
scaling_x = .9;
scaling_y = 1;
scaling_z = 1;
include <include.scad>;
include <globals.scad>;

obj_leg= 12;

// unaligend version of bow tie. Why? I printed twist corners that do not match the extention parts, so this is the fix :3

module bow_tie_rounded() {
    intersection () {
        male_dovetail(height=length);
        cylinder(r=5.7, h=200);
    }
}

module bow_tie_master(){
	union(){
        translate([2,0,0]) mirror([0,1,0]){
            bow_tie_rounded();
        }
        bow_tie_rounded();
	}
}

// do the part
scale([scaling_x,scaling_y,scaling_z]) rotate([90,0,0]) bow_tie_master();
