include <include.scad>;
include <globals.scad>;
units = 4;

module extention(){
module added(){
translate([0,15,0]) cube([30,30*units,30], center=true);
}

module subtracted(){
	module wrap(){
		depth = 30;
				scale([1.1,1.1,1.1]) translate([-15,30-2.5,13.75]) rotate([90,180,90]) male_dovetail(height=depth);
				#rotate([0,90,0]) scale([1.1,1.1,1.1]) translate([-15,30-2.5,13.75]) rotate([90,180,90]) male_dovetail(height=depth);
				rotate([0,180,0]) scale([1.1,1.1,1.1]) translate([-15,30-2.5,13.75]) rotate([90,180,90]) male_dovetail(height=depth);
				rotate([0,-90,0]) scale([1.1,1.1,1.1]) translate([-15,30-2.5,13.75]) rotate([90,180,90]) male_dovetail(height=depth);
	}


rotate([0,45,0]) translate([0,-45,0]) tie_end();
rotate([0,45,0]) translate([0,obj_leg*2.5,0]) rotate([0,0,180]) tie_end();


rotate([90,0,0]) cylinder(h=5000, d= 8.5, center=true);


for (y = [-2:units-3]) // two iterations, z = -1, z = 1
{
    translate([0, y*30, 0])
    wrap();
}
for (y = [-1:1]) // two iterations, z = -1, z = 1
{
    translate([0, y*30, 0]){
				translate([0,15,-16]) cylinder(h=35, d=18);
				rotate([0,90,0]) translate([0,15,-16]) cylinder(h=35, d=18);
	}
}
}


difference(){
added();
subtracted();
}
	module middle_bars(){
				for (y = [-1:units-2]) {
			translate([0, y*30, 0]){
						cube([30,12,1], center=true);
						rotate([0,90,0]) cube([30,12,1], center=true);
			}
		}
	}
	middle_bars();
}

//support
translate([13,75-.5,-15+2.5]) cube([5,1,5], center=true);
translate([13,-45+.5,-15+2.5]) cube([5,1,5], center=true);

translate([-13,75-.5,-15+2.5]) cube([5,1,5], center=true);
translate([-13,-45+.5,-15+2.5]) cube([5,1,5], center=true);


extention();