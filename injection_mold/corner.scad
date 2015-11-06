include <include.scad>;
include <globals.scad>;

	slot_translate = .5;
	rod_size = .5;
module basic_corner(){
	module added(){
			translate([0,0,15]) cube([obj_leg,obj_leg,obj_leg*2], center=true);
			translate([0,15,0]) cube([obj_leg,obj_leg*2,obj_leg], center=true);
			translate([15,0,0]) cube([obj_leg*2,obj_leg,obj_leg], center=true);
	}
	module taken(){
		cylinder(d=8.5, h=obj_leg*5, center=true);
		rotate([0,90,0]) cylinder(d=8.5, h=obj_leg*5, center=true);
		rotate([90,0,0]) cylinder(d=8.5, h=obj_leg*5, center=true);
		cylinder(d=20, h=28, center=true);
		rotate([0,90,0]) cylinder(d=20, h=28, center=true);
		rotate([90,0,0]) cylinder(d=20, h=28, center=true);

		rotate([0,45,180]) translate([0,-45,0]) tie_end();
		rotate([0,45,90]) translate([0,-45,0]) tie_end();
		rotate([-90,0,45]) translate([0,-45,0]) tie_end();

	}
	module corner() {
		difference(){
			added();
			taken();
		}
	};
	rotate([45,0,0]) corner();
};
module full_corner(){
	difference(){
		translate([0,0,0]) rotate([0,-35,0])basic_corner();
		union(){
			//cylinder(h=50, d=15);
			translate([0,0,-25]) cube([200,200,50], center=true);
		}
	}
}

full_corner();