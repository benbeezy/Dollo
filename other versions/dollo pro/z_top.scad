include <veriables.scad>;

difference(){
	cube([150,bearing_outer+(wall_thickness*2),aluminum_width*2],center=true);
	translate([0,0,aluminum_width]) cube([150,aluminum_width+(wall_thickness*2),aluminum_width*2],center=true);
	translate([0,0,-aluminum_width/2]) cylinder(d=bearing_outer,h=aluminum_width+2,center=true);
	translate([150/2-smooth_rod,0,0]) cylinder(d=smooth_rod,h=100,center=true);
	translate([-150/2+smooth_rod,0,0]) cylinder(d=smooth_rod,h=100,center=true);
	//T-slot screw holes
	translate([150/3-smooth_rod,0,0]) cylinder(d=screw_diamiter,h=100,center=true);
	translate([-150/3+smooth_rod,0,0]) cylinder(d=screw_diamiter,h=100,center=true);
}