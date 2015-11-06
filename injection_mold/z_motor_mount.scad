wall_thickness = 10;
motor_height	= 42;
connector_width = motor_height;
connector_height	= 4;


module motor(){
	cube([42,42,motor_height], center=true);
}
module basic(){
	cube([42+wall_thickness,42+wall_thickness,40+3], center=true);
}

difference(){
	translate([0,0,-3]) basic();
	motor();
	translate([motor_height/2,0,(-motor_height/2)+connector_width/2]) cube([20,connector_height,connector_width], center=true);
}