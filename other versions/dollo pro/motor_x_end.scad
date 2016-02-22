include <veriables.scad>;

module added(){
	hull(){
		cube([motor_width,wall_thickness*4,x_rod_spacing+smooth_rod*2], center=true);
		cube([motor_width,motor_width*4,x_rod_spacing+smooth_rod*2], center=true);
	}
}
module taken(){
	translate([0,10,0]) rotate([0,0,45]) cube([20,20,200], center=true);
	
	translate([motor_screw_space/2,-70,motor_screw_space/2]) rotate([90,0,0]) cylinder(d=3, h=40, center=true);
	translate([-motor_screw_space/2,-70,motor_screw_space/2]) rotate([90,0,0]) cylinder(d=3, h=40, center=true);
	translate([motor_screw_space/2,-70,-motor_screw_space/2]) rotate([90,0,0]) cylinder(d=3, h=40, center=true);
	translate([-motor_screw_space/2,-70,-motor_screw_space/2]) rotate([90,0,0]) cylinder(d=3, h=40, center=true);

	#translate([0,-50,-x_rod_spacing/2]) rotate([90,0,0]) cylinder(d=8, h=50, center=true);
	#translate([0,-40,-x_rod_spacing/2]) rotate([90,90,0]) cylinder(d=17, h=20, center=true, $fn=6);

	translate([motor_screw_space/2,-52,motor_screw_space/2]) rotate([90,0,0]) cylinder(d=6, h=10, center=true);
	translate([-motor_screw_space/2,-52,motor_screw_space/2]) rotate([90,0,0]) cylinder(d=6, h=10, center=true);
	translate([motor_screw_space/2,-52,-motor_screw_space/2]) rotate([90,0,0]) cylinder(d=6, h=10, center=true);
	translate([-motor_screw_space/2,-52,-motor_screw_space/2]) rotate([90,0,0]) cylinder(d=6, h=10, center=true);

	translate([-motor_width/2.5,20,-x_rod_spacing/2]) rotate([0,90,0]) cylinder(d=smooth_rod, h=50);
	translate([-motor_width/2.5,20,x_rod_spacing/2]) rotate([0,90,0]) cylinder(d=smooth_rod, h=50);
	
	module bearings(){
		hull(){
			translate([-bearing_outer/2,-10,0]) rotate([0,90,45]) cylinder(d=bearing_outer+1, h=bearing_thick+3, center=true);
			translate([-bearing_outer/2,-10,50]) rotate([0,90,45]) cylinder(d=bearing_outer+1, h=bearing_thick+3, center=true);
		}
		hull(){
			mirror([1,0,0]) {
				translate([-bearing_outer/2,-10,0]) rotate([0,90,45]) cylinder(d=bearing_outer+1, h=bearing_thick+3, center=true);
				translate([-bearing_outer/2,-10,50]) rotate([0,90,45]) cylinder(d=bearing_outer+1, h=bearing_thick+3, center=true);
			}
		}
			mirror([1,0,0]) translate([-bearing_outer/2,-10,height]) rotate([0,90,45]) cylinder(d=bearing_inner, h=30, center=true);
			mirror([1,0,0]) translate([-bearing_outer/2,-10,height]) rotate([0,90,45]) translate([0,0,-23]) cylinder(d=bearing_inner*2, h=30, center=true);
			translate([-bearing_outer/2,-10,height2]) rotate([0,90,45]) cylinder(d=bearing_inner, h=30, center=true);
			translate([-bearing_outer/2,-10,height2]) rotate([0,90,45]) translate([0,0,-23]) cylinder(d=bearing_inner*2, h=30, center=true);

			translate([-bearing_outer/2,-10,height2]) rotate([0,90,45]) translate([0,0,21]) cylinder(d=bearing_inner*2, h=30, center=true);
			mirror([1,0,0]) translate([-bearing_outer/2,-10,height]) rotate([0,90,45]) translate([0,0,21]) cylinder(d=bearing_inner*2, h=30, center=true);
	}

	bearings(height2=25);
	mirror([0,1,0]) translate([0,aluminum_width*2+16,0]) bearings(height=25);
	translate([0,-28,0]) rotate([0,0,45]) cube([aluminum_width+2,aluminum_width+2,x_rod_spacing+smooth_rod*2], center=true);
}


intersection(){
	difference(){
		added();
		taken();
	}
	translate([-50,-65,-50]) cube([100,100,100]); 
}