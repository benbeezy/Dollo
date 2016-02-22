gearOne = 29;
gear_reverse = -10;
gearLarge = 57;
tip_size = .6;
module xdf(){

	module holes(){
		
		
	module gear_arm(){
					translate([(gearLarge+gearOne)+(tip_size/2),0,0]) circle(d=3);
					translate([gearOne+(tip_size/2),0,0]) circle(d=3);
	}
	
	
		circle(d=3, $fn=20);
	
	module motor(){
		#translate([43.84/2,0]) 		circle(d=3, $fn=20);
		#translate([-43.84/2,0]) 		circle(d=3, $fn=20);
		#translate([0,43.84/2]) 		circle(d=3, $fn=20);
		#translate([0,-43.84/2]) 		circle(d=3, $fn=20);
	}
									motor();
		//rotate([0,0,45]) 	motor();
		
		rotate([0,0,0])			gear_arm();
		rotate([0,0,90])	 		gear_arm();
		rotate([0,0,180]) 		gear_arm();
		rotate([0,0,-90]) 		gear_arm();
		rotate([0,0,-45]) 		gear_arm();
		rotate([0,0,45]) 			gear_arm();
		rotate([0,0,-45]) 		gear_arm();
		rotate([0,0,135]) 		gear_arm();
		rotate([0,0,-135]) 	gear_arm();
		
	
		circle(d=25);
	}
	difference(){
		square([215,215], center=true);
		holes();
	}
}
xdf();