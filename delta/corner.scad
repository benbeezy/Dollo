include <include.scad>;
include <globals.scad>;


module basic_corner(){
rod_size = .5;
extra_length = 6;
//////////////////      NORMAL       ////////////////////

module added(){
		translate([0,0,15]) cube([obj_leg,obj_leg,obj_leg*extra_length], center=true);
}


module taken(){
	cylinder(d=8.5, h=obj_leg*5*extra_length, center=true);
	//rotate([0,90,0]) cylinder(d=8.5, h=obj_leg*5, center=true);
	//rotate([90,0,0]) cylinder(d=8.5, h=obj_leg*5, center=true);
	//cylinder(d=20, h=28, center=true);
	//rotate([0,90,0]) cylinder(d=20, h=28, center=true);
	//rotate([90,0,0]) cylinder(d=20, h=28, center=true);

	wrap(extra_length);
	rotate([-90,0,45]) translate([0,-15-15*extra_length,0]) tie_end();
}

	//////	support/////

module corner() {
	difference(){
		added();
		taken();
	}

/////////
rotate([90,0,0]) translate([0,obj_leg*2-15,0]) rotate([0,0,180]) bow_support();
/////////

}

	corner();
}
module full_corner(){
	module support_pillers(){
		translate([37,0,0]) cylinder(h=1,d=4);
		translate([34,4,0]) cylinder(h=4,d=4);
		translate([34,-4,0]) cylinder(h=4,d=4);
		translate([47,3,0]) cylinder(h=11,d=4);
		translate([47,-3,0]) cylinder(h=11,d=4);
	}


	
	difference(){
		translate([0,0,0]) rotate([45,-35,0]) union(){
			rotate([0,0,45]) basic_corner();
			translate([0,0,30*1.5]){
				rotate([-90,0,-15]) basic_corner();
				rotate([0,90,15]) basic_corner();
			}
			translate([0,0,0]){
				rotate([-90,0,-15]) basic_corner();
				rotate([0,90,15]) basic_corner();
			}
		}
		union(){
			cylinder(h=50, d=15);
			translate([-20,0,0]) cylinder(h=50, d=7);
			translate([10,17,0]) cylinder(h=50, d=7);
			translate([10,-17,0]) cylinder(h=50, d=7);
			translate([0,0,-105]) cube([200,200,200], center=true);
		}
	}
}

full_corner();