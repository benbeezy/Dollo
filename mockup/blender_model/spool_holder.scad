spool_width			= 76;
hole_diamiter		= 51;
lip_height				= 3;
wall_thickness		=	3;
center_split_width	=	5;


difference(){
	union(){
		translate([0,0,spool_width/2]) rotate_extrude(convexity = 10, $fn = 50)
		translate([hole_diamiter/2-(wall_thickness/4), 0, 0])
		circle(d = lip_height, $fn = 50);
		cylinder(h=spool_width, d=hole_diamiter, center=true, $fn=100);
	}
	cylinder(h=spool_width+lip_height, d=hole_diamiter-wall_thickness, center=true, $fn=100);
	cube([hole_diamiter+(lip_height*2),center_split_width,spool_width+(lip_height*2)], center=true);
}
translate([0,0,-spool_width/2]) cylinder(h=2, d=hole_diamiter, center=true, $fn=100);