include <veriables.scad>;

module added(){
	hull(){
		translate([0,0,0]) cube([80,155,8]);
		translate([0,155,long_bearing_od/2+wall_thickness]) rotate([0,90,0]) cylinder(d=long_bearing_od+wall_thickness*2, h=long_bearing_length*3);
	}
}

module taken(){
	translate([aluminum_plate_thick,0,0]) cube([aluminum_plate_thick,145,long_bearing_od+wall_thickness*2]);
	cube([aluminum_plate_thick,130,long_bearing_od+wall_thickness*2]);
	#translate([0,155/2,0]) cube([30,8,long_bearing_od+wall_thickness*2]);
	translate([0,155/2,long_bearing_od/2+wall_thickness]) cube([80,8,long_bearing_od+wall_thickness*2]);
	rotate([0,0,-30])  cube([80,155,long_bearing_od+wall_thickness*2]);
	translate([0,155,long_bearing_od/2+wall_thickness]) rotate([0,90,0]) cylinder(d=long_bearing_od, h=long_bearing_length*3);
}

difference(){
	added();
	taken();
}