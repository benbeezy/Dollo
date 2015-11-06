include <include.scad>;
include <globals.scad>;
metal_rod_size = 9;
support = true;
//min number of units is 2
//max is however large your printer can print
units = 4;

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
		difference(){
			translate([15, (y*30)+15, 15]){
				wrap_one();
				translate([0,30,15]) cube([50,5,5],center=true);
			}
			union(){
				translate([15.5,y*30+30,0]) cube([.5,30,30]);
				rotate([0,90,0]) translate([-15.5,y*30+30,0]) cube([.5,30,30]);
			}
		}
	}
	
	}
	difference(){
		added();
		subtracted();
	}	
}

extention();