wall_thickness		= 5;
nut_size					= 15;
rod_diamiter			= 9;
screw_spacing		= 31;
motor_distance		= 84;
wall_width				= 130;
wall_height			= 50;
sides_on_nut			= 6;
screw_diamiter		= 3;


translate([40,0,0]) wall_one();
wall_two();

//color([0.75,0.75,0.75]) motor_dont_render();

module wall_one(){
	difference(){
		wall_one_added();
		wall_one_taken();
	}
}


module wall_one_added(){
		cube([wall_thickness,wall_width,wall_height],center=true);
}
	
module wall_one_taken(){
		rotate([0,90,0]) translate([0,motor_distance/2,-20]) cylinder(h=50, d=rod_diamiter, center=true);
		rotate([0,90,0]) translate([0,-motor_distance/2,-20]) cylinder(h=50, d=rod_diamiter, center=true);
		rotate([0,90,0]) translate([0,motor_distance/2,10/2]) cylinder(h=10, d=nut_size, center=true, $fn=sides_on_nut);
		rotate([0,90,0]) translate([0,-motor_distance/2,10/2]) cylinder(h=10, d=nut_size, center=true, $fn=sides_on_nut);
}

module wall_two(){
	difference(){
		wall_two_added();
		wall_two_taken();
	}
}


module wall_two_added(){
		cube([wall_thickness,wall_width,wall_height],center=true);
}
	
module wall_two_taken(){
		rotate([0,90,0]) translate([0,motor_distance/2,0]) cylinder(h=20, d=rod_diamiter, center=true);
		rotate([0,90,0]) translate([0,-motor_distance/2,0]) cylinder(h=20, d=rod_diamiter, center=true);
		translate([0,motor_distance/2,0]) motor();
		translate([0,-motor_distance/2,0]) motor();
}

module motor(){
	translate([0,screw_spacing/2,screw_spacing/2]) rotate([0,90,0]) cylinder(d=screw_diamiter, h=20, center=true);
	translate([0,-screw_spacing/2,-screw_spacing/2]) rotate([0,90,0]) cylinder(d=screw_diamiter, h=20, center=true);
	translate([0,screw_spacing/2,-screw_spacing/2]) rotate([0,90,0]) cylinder(d=screw_diamiter, h=20, center=true);
	translate([0,-screw_spacing/2,screw_spacing/2]) rotate([0,90,0]) cylinder(d=screw_diamiter, h=20, center=true);
}

module motor_dont_render(){
	translate([-40,motor_distance/2,0]) cube([42,42,42], center=true);
	translate([-40,-motor_distance/2,0]) cube([42,42,42], center=true);
	translate([-10,0,0]) wall_two_taken();
	translate([40,0,0]) wall_one_taken();
}