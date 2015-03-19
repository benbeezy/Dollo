gearOne = -16;
gearLarge = -31+(gearOne/2);

module dont_render(){
	module corner(){ 
		include <corner.scad>; 
	}
	module extention(){
		include <extention.scad>;
	}
		module bed_motor(){
				//motor
			translate([(220/2)-5,(220/2)-5,100-30]) color([.5,.5,.5]) rotate([0,0,45]) cube([42,42,47], center=true);
	}
	module bed(){
			translate([(220/2)-5,(220/2)-5,100]) color([1,1,1,.4]) rotate([0,0,45]) cube([220,220,5], center=true);
	}
	
	module gear_file(){
		include <gears.scad>;
					translate([(220/2)-5,(220/2)-5,100-30]) color([1,0,0]) gear_one();
					translate([((220/2)-5)+(gearOne+(gearOne/2)),((220/2)-5)+(gearOne+(gearOne/2)),100-30]) color([.5,.5,.5]) rotate([0,0,(360/12)*1.5]) middle_gear();
					translate([((220/2)-5)+(gearLarge+(gearLarge/2)),((220/2)-5)+(gearLarge+(gearLarge/2)),100-30]) color([0,1,0]) rotate([0,0,(360/22)*1.75]) gear_large();
		
	}

	color([1,0,0]) translate([-3,-3,-3]) rotate([-45,0,0]){
		rotate([0,35,0]) corner();
	}

	translate([0,30*3,0]) color([0,0,1]) extention();
	rotate([90,0,0]) translate([0,30*3,0]) color([0,0,1]) extention();
	rotate([0,0,-90]) translate([0,30*3,0]) color([0,0,1]) extention();

	gear_file();
	bed();
	bed_motor();
}

module arm_movement(){
	difference(){
		//part im trying to make
	difference(){
		translate([10,10,30*2]) rotate([0,0,45]) cube([45,45,30*2], center=true);
		translate([-15/2,-15/2,30]) cube([45,45,30*5], center=true);
	}
	//twist
			translate([((220/2)-5)+(gearLarge+(gearLarge/2)),((220/2)-5)+(gearLarge+(gearLarge/2)),100-39]) color([0,1,0]) rotate([0,0,(360/22)*1.75]) twist_large();
	
	}
}
arm_movement();

dont_render();
