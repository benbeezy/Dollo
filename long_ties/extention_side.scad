include <include.scad>;
include <globals.scad>;
metal_rod_size = 9;
support = true;
//min number of units is 2
//max is however large your printer can print
units = 4;

tip_size	=	1.2;

module extention(){
	
	module added(){
			translate([0,0,0]) cube([30,30*units,30]);
	}

	module subtracted(){
	translate([15,0,15]) rotate([0,45,0]) tie_end();
	translate([15,units*30,15]) rotate([0,45,0]) rotate([0,0,180]) tie_end();
	translate([15,15,15]) rotate([90,0,0]) cylinder(h=5000, d= metal_rod_size, center=true);

	for (y = [-1:units-2]) // two iterations, z = -1, z = 1
	{
			translate([15, (y*30)+15, 15]){
			for (r = [0:4]) // two iterations, z = -1, z = 1
			{
				rotate([0,r*90,0]) translate([0,15,15]) rotate([-90,0,0])male_dovetail(height=30);
			}
		}
	}

	} //subtracted
	difference(){
		added();
		subtracted();
	}	
} //module extention

//support
if (support==true)
{
	cube([tip_size,30*4,30]);
	translate([30-tip_size,0,0]) cube([tip_size,30*4,30]);
}

module extention_finished(){
		rotate([0,0,0]) extention();
}

extention_finished();