smoothing = 100;
length = 13;
tilt_level = 1;
scaling_x = .9;
scaling_y = 1;
scaling_z = 1;
include <include.scad>;
include <globals.scad>;

obj_leg= 12;
$fn = smoothing;
module bow_tie_master(){
	union(){
		mirror([0,1,0]) 		intersection(){
			intersection(){
				rotate([0,-45,0]) cube([obj_leg,obj_leg,obj_leg]);
				translate([-obj_leg/2,(obj_leg/2)-tilt_level,-5]) rotate([45,0,0]) cube([obj_leg,obj_leg,obj_leg*2]);
			}
			male_dovetail(height=length);
		}
		
		intersection(){
			intersection(){
				rotate([0,-45,0]) cube([obj_leg,obj_leg,obj_leg]);
				translate([-obj_leg/2,(obj_leg/2)-tilt_level,-5]) rotate([45,0,0]) cube([obj_leg,obj_leg,obj_leg*2]);
			}
			male_dovetail(height=length);
		}
		
	}
}

module finished(){
	rotate([0,45*0,0]){
		
			rotate([0,180,0]) bow_tie_master();
		
	}
}

scale([scaling_x,scaling_y,scaling_z]) finished();
