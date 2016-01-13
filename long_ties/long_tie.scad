length = 50;
tilt_level = 1.1;
scaling_x = .9;
scaling_y = 1;
scaling_z = 1;
include <include.scad>;
include <globals.scad>;

		scale([scaling_x,scaling_y,scaling_z])	rotate([90,0,0])	 male_dovetail(height=length);
