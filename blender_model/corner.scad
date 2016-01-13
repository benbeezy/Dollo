include <include.scad>;
include <globals.scad>;
//if you can do pretty far over hangs, like an SLA printer or something then take this off by setting it to flase.
    support = false;
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
		cylinder(d=23, h=28, center=true);
		rotate([0,90,0]) cylinder(d=23, h=28, center=true);
		rotate([90,0,0]) cylinder(d=23, h=28, center=true);
		module wrap(){
			translate([0,-15,0]) male_dovetail(height=50);
			rotate([0,0,90]) translate([0,-15,0]) male_dovetail(height=50);
			rotate([0,0,180]) translate([0,-15,0]) male_dovetail(height=50);
			rotate([0,0,-90]) translate([0,-15,0]) male_dovetail(height=50);
		}
		wrap();
		rotate([0,90,0]) wrap();
		rotate([-90,90,0]) wrap();
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
	module support_pillers(){
		
		translate([48-slot_translate/2,3,0]) cylinder(h=11,d=4);
		translate([48-slot_translate/2,-3,0]) cylinder(h=11,d=4);
		
		translate([39-slot_translate/2,18,24]) rotate([0,-40,0]) cylinder(h=6,d=4);
		translate([39-slot_translate/2,-18,24]) rotate([0,-40,0]) cylinder(h=6,d=4);
	}
	if (support==true)
	{
		support_pillers();
		rotate([0,0,(360/3)*2]) support_pillers();
		rotate([0,0,(360/3)*1]) support_pillers();
	}
	difference(){
		translate([0,0,0]) rotate([0,-35,0])basic_corner();
		union(){
			cylinder(h=50, d=15);
			//translate([-20,0,0]) cylinder(h=50, d=7);
			//translate([10,17,0]) cylinder(h=50, d=7);
			//translate([10,-17,0]) cylinder(h=50, d=7);
			translate([0,0,-25]) cube([200,200,50], center=true);
		}
	}
}

rotate([45,0,0]) rotate([0,35,0]) full_corner();