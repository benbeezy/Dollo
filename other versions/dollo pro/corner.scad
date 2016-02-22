include <veriables.scad>;

module block(){
	translate([depth+wall_thickness,0,0]) cube([depth+wall_thickness,aluminum_width+(wall_thickness*2),aluminum_width+(wall_thickness*2)], center=true);
}

module taken(){
	module something(){
		cube([depth,aluminum_width,aluminum_width], center=true);
		cylinder(h=30, d=4);
		rotate([-90,0,0]) cylinder(h=30, d=4);
		translate([0,0,aluminum_width])  cylinder(h=30, d=8);
		rotate([-90,0,0]) translate([0,0,aluminum_width]) cylinder(h=30, d=8);
	}
	translate([wall_thickness/2+depth+wall_thickness,0,0]) something();
}

rotate([45,-90,0]) difference(){
hull(){
	rotate([45,0,0]) block();
	rotate([0,-90,0]) block();
	rotate([0,0,90]) block();
}
rotate([45,0,0]) taken();
rotate([90,-90,0]) taken();
rotate([-90,0,90]) taken();
cylinder(d=8, h=50, center=true);
translate([0,0,10]) cylinder(d=16, h=20, center=true, $fn=6);
translate([0,0,-20]) #cylinder(d=16, h=20, center=true, $fn=6);
}