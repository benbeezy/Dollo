include <gears.scad>;




gearOne = -16.5;
gear_reverse = -10;
gearLarge = -32+(gearOne/2);

module dont_render(){
	module corner(){ 
		include <corner.scad>; 
	}
	module extention(){
		include <extention.scad>;
	}
	module motor(){
				//motor
			translate([0,0,100-30]) color([.5,.5,.5]) rotate([0,0,45]) cube([42,42,47], center=true);
	}
	module bed(){
			translate([(0/2)-5,(0/2)-5,100]) color([1,1,1,.4]) rotate([0,0,45]) cube([220,220,5], center=true);
	}
	// middle gear
						translate([0,0,100-30]) color([1,0,0]) gear_one();
	module gear_arm(){
					translate([0+(gearOne+(gearOne/2)),0+(gearOne+(gearOne/2)),100-30]) color([.5,.5,.5]) rotate([0,0,(360/12)*1.5]) middle_gear();
					translate([0+(gearLarge+(gearLarge/2)),0+(gearLarge+(gearLarge/2)),100-30]) color([0,1,0]) rotate([0,0,(360/22)*1.75]) gear_large();
		
	}
	module gear_arm_reversed(){
					translate([0+(gear_reverse+(gearOne/2)),0+(gear_reverse+(gearOne/2)),100-30]) color([.5,.5,.5]) rotate([0,0,(360/6)*.25]) reverse_gear_one();
		translate([0+(gear_reverse+(gearOne-gear_reverse)*2+(gearOne/2)),0+(gear_reverse+(gearOne-gear_reverse)*2+(gearOne/2)),100-30]) color([.5,.5,.5]) rotate([0,0,(360/6)*.25]) reverse_gear_one();
					translate([0+(gearLarge+(gearLarge/2)),0+(gearLarge+(gearLarge/2)),100-30]) color([0,1,0]) rotate([0,0,(360/22)*1.75]) gear_large();
	}
	
	module frame(){
		color([1,0,0]) translate([-3,-3,-3]) rotate([-45,0,0]){
			rotate([0,35,0]) corner();
		}

		translate([0,30*3,0]) color([0,0,1]) extention();
		rotate([90,0,0]) translate([0,30*3,0]) color([0,0,1]) extention();
		rotate([0,0,-90]) translate([0,30*3,0]) color([0,0,1]) extention();
	}
		//bed();
		//motor();
		gear_arm();
		rotate([0,0,90]) gear_arm();
	
		rotate([0,0,-90]) gear_arm_reversed();
		rotate([0,0,180]) gear_arm_reversed();
	
	translate([-105,-105,0]) frame();
}

module arm_movement(){
	difference(){
		//part im trying to make
	difference(){
		translate([-95,-95,30*2]) rotate([0,0,45]) cube([45,45,30*2], center=true);
		#translate([-105+(-15/2),-105+(-15/2),30]) cube([45,45,30*5], center=true);
	}
	//twist
	
	for (extrude=[0:6]){
			translate([0+(gearLarge+(gearLarge/2)),0+(gearLarge+(gearLarge/2)),extrude*16]) color([0,1,0]) rotate([0,0,(360/22)*1.75]) twist_large();
	}
	
	
	}
}

module xdf(){
	difference(){
		rotate([0,0,45]) square([215,215], center=true);
		everything_dxf();
	}
	module everything_dxf(){
		
		
	module gear_arm(){
					translate([0+(gearOne+(gearOne/2)),0+(gearOne+(gearOne/2))]){
						circle(d=3, $fn=20);
					}
					translate([0+(gearLarge+(gearLarge/2)),0+(gearLarge+(gearLarge/2))]){
						circle(d=3, $fn=20);
					}
	}
	
	
	module gear_arm_reversed(){
					translate([0+(gear_reverse+(gearOne/2)),0+(gear_reverse+(gearOne/2))]) color([.5,.5,.5]) circle(d=3, $fn=20);
		translate([0+(gear_reverse+(gearOne-gear_reverse)*2+(gearOne/2)),0+(gear_reverse+(gearOne-gear_reverse)*2+(gearOne/2))]) circle(d=3, $fn=20);
					translate([0+(gearLarge+(gearLarge/2)),0+(gearLarge+(gearLarge/2))]) color([0,1,0]) circle(d=3, $fn=20);
	}
		circle(d=3, $fn=20);
	
	translate([43.84/2,0]) circle(d=3, $fn=20);
	translate([-43.84/2,0]) circle(d=3, $fn=20);
	translate([0,43.84/2]) circle(d=3, $fn=20);
	translate([0,-43.84/2]) circle(d=3, $fn=20);

	
		gear_arm();
		rotate([0,0,90]) gear_arm();
		rotate([0,0,180]) gear_arm();
		rotate([0,0,-90]) gear_arm();
	
		rotate([0,0,45]){
			gear_arm();
			rotate([0,0,90]) gear_arm();
			rotate([0,0,180]) gear_arm();
			rotate([0,0,-90]) gear_arm();
			
			translate([43.84/2,0]) circle(d=3, $fn=20);
			translate([-43.84/2,0]) circle(d=3, $fn=20);
			translate([0,43.84/2]) circle(d=3, $fn=20);
			translate([0,-43.84/2]) circle(d=3, $fn=20);

		}
		circle(d=25);
		
		rotate([0,0,-90]) gear_arm_reversed();
		rotate([0,0,180]) gear_arm_reversed();
		rotate([0,0,0]) gear_arm_reversed();
		rotate([0,0,90]) gear_arm_reversed();
	
		rotate([0,0,45*0]) translate([152.03-4,0]) circle(d=3);
		rotate([0,0,45*2]) translate([152.03-4,0]) circle(d=3);
		rotate([0,0,45*4]) translate([152.03-4,0]) circle(d=3);
		rotate([0,0,45*6]) translate([152.03-4,0]) circle(d=3);
	
		//rotate([0,0,45]) translate([110,0]) square([1,220], center=true);
		//rotate([0,0,45*3]) translate([110,0]) square([1,220], center=true);
		//rotate([0,0,45*5]) translate([110,0]) square([1,220], center=true);
		//rotate([0,0,45*7]) translate([110,0]) square([1,220], center=true);
	}
}

translate([215/2,215/2,0]) rotate([0,0,45]) xdf();


//arm_movement();

//dont_render();