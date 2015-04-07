//globals
$fn=50;
obj_round = 50;
obj_height = 50;
shaft = 5.2;

module master(){
	module rightGear(twist) {
		rotate([0, 0, -25]) {
			translate([0, 0, obj_height/4])
			linear_extrude(height = obj_height/2, center = true, twist = twist, convexity = 10)
			    import (file = "small_gear.dxf", layer = "Layer_1");
				circle(r = 1);
		}
	}

module gearObject() {

	module gear() {

		union() {
			rightGear(twist);
			mirror([0,0,1]) rightGear(twist);
		}

	}

	module hole() {	
		cylinder(d=shaft, h=obj_height*2.1, center=true);
	}
	module bone() {
		difference() {
			gear(twist=81);

			hole();
		}
	}
	union() {
		translate([5.6/2, 0, 0]) cube([1.5,5,obj_height], center=true);
		bone();
	}
}
gearObject();
}

intersection(){

master();
}