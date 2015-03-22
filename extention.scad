include <include.scad>;
include <globals.scad>;
metal_rod_size = 9;
units = 4;


module extention(){
module added(){
		translate([0,15,0]) cube([30,30*units,30], center=true);
}

module subtracted(){
	module wrap(){
		depth = 30;
				scale([1,1,1]) translate([-15,30,15]) rotate([90,180,90]) male_dovetail(height=depth);
				rotate([0,90,0]) translate([-15,30,15]) rotate([90,180,90]) male_dovetail(height=depth);
				rotate([0,180,0]) translate([-15,30,15]) rotate([90,180,90]) male_dovetail(height=depth);
				rotate([0,-90,0]) translate([-15,30,15]) rotate([90,180,90]) male_dovetail(height=depth);
	}


rotate([0,45,0]) translate([0,-45,0]) tie_end();
rotate([0,45,0]) translate([0,obj_leg*2.5,0]) rotate([0,0,180]) tie_end();


rotate([90,0,0]) cylinder(h=5000, d= metal_rod_size, center=true);


for (y = [-2:units-3]) // two iterations, z = -1, z = 1
{
    translate([0, y*30, 0]) wrap();
	#translate([6,y*30+(30),-16]) cylinder(h=35, d=4, $fn=20);
	#translate([-6,y*30+(30),-16]) cylinder(h=35, d=4, $fn=20);
		
	#rotate([0,90,0]) translate([6,y*30+(30),-16]) cylinder(h=35, d=4, $fn=20);
	#rotate([0,90,0]) translate([-6,y*30+(30),-16]) cylinder(h=35, d=4, $fn=20);
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
	difference(){
		 middle_bars();
		rotate([90,0,0]) cylinder(h=5000, d= 8.5, center=true);
	}
}
	module holes(){
		rotate([0,90,0]) translate([0,-38,-20]) cylinder(h=40, d=6, $fn=20);
		rotate([0,90,0]) translate([0,(obj_leg*2.5)-8,-20]) cylinder(h=40, d=6, $fn=20);
		rotate([0,0,0]) translate([0,-38,-20]) cylinder(h=40, d=6, $fn=20);
		rotate([0,0,0]) translate([0,(obj_leg*2.5)-8,-20]) cylinder(h=40, d=6, $fn=20);
		
		one = 7;
		two = 7;
		translate([one,one,one]) rotate([90,0,0]) cylinder(h=5000, d=5, center=true, $fn=20);
		translate([-one,-one,-one]) rotate([90,0,0]) cylinder(h=5000, d=5, center=true, $fn=20);
		translate([-one,one,one]) rotate([90,0,0]) cylinder(h=5000, d=5, center=true, $fn=20);
		translate([one,one,-one]) rotate([90,0,0]) cylinder(h=5000, d=5, center=true, $fn=20);
		
		translate([two,two,two]) rotate([90,0,0]) cylinder(h=5000, d=5, center=true, $fn=20);
		translate([-two,-two,-two]) rotate([90,0,0]) cylinder(h=5000, d=5, center=true, $fn=20);
		translate([-two,two,two]) rotate([90,0,0]) cylinder(h=5000, d=5, center=true, $fn=20);
		translate([two,two,-two]) rotate([90,0,0]) cylinder(h=5000, d=5, center=true, $fn=20);
	}

//support
translate([13,75-.5,-15+2.5]) cylinder(h=5, d=6, center=true);
translate([13,-45+.5,-15+2.5]) cylinder(h=5, d=6, center=true);

translate([-13,75-.5,-15+2.5]) cylinder(h=5, d=6, center=true);
translate([-13,-45+.5,-15+2.5]) cylinder(h=5, d=6, center=true);

difference(){
	extention();
	holes();
}