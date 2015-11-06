///////// NEED TO REDO THE MATH BECUASE OF THE SNAP ON RAILS, WELL WORTH IT

$fn = 30;
include <globals.scad>;
include <include.scad>;


frame_width = 35.5;
tail_depth = 11;
mount_max = 62.5;
wabble = 1.5;
not_tooth_gap = 0;
rack_gap = 2.5;
tower_height = 17.5+3;

head_diamiter = 7.5;
extra_depth =1.5;

//$fn=220;

diameter = 3.5;

module rounded_cube(width,depth,height){
    hull(){
        translate([width/2-diameter/2,depth/2-diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([width/2-(diameter/2),depth/2-(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
        translate([-width/2+diameter/2,depth/2-diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([-width/2+(diameter/2),depth/2-(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
        
        translate([width/2-diameter/2,-depth/2+diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([width/2-(diameter/2),-depth/2+(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
        translate([-width/2+diameter/2,-depth/2+diameter/2,height/2-diameter/2]) sphere(d=diameter);
        translate([-width/2+(diameter/2),-depth/2+(diameter/2),-height/2+(diameter/2)]) sphere(d=diameter);
    }
}    
//rounded_cube(x,y,z,diameter);


module y_mount_added(){    
    
    translate([0,2.25-2.25+rack_gap/2,-1]) rounded_cube(depth = 50+rack_gap*2, width = frame_width+15+1, height=4, center=true);

    
    
	translate([0,frame_width-15.5+rack_gap,2.5]) rounded_cube(height = 5, width = 50, depth = 11, diameter = 3.5);
//towers
	translate([0-21,-25.75,0]) cube([42,18,tower_height]);
	translate([(32-21-4)+18/2,(11-21+wabble)+15/2,(17.5+4.25)/2]) rounded_cube(18,15,tower_height);
	translate([(-21-4)+25/2,    (11-21+wabble)+15/2,(17.5+4.25)/2]) rounded_cube(25,15,tower_height);

	//#translate([17,(not_tooth_gap/2)+5,2.5]) rounded_cube(height = 4, width = 15, depth = not_tooth_gap, diameter = 2);
	//#translate([-17,(not_tooth_gap/2)+5,2.5]) rounded_cube(height = 4, width = 15, depth = not_tooth_gap, diameter = 2);
}

module y_mount_taken(){
	rotate([0,0,45]) {
		translate([5.65-21,5.65-21,-10]) cylinder(d=3.5, h=70);
		translate([5.65+31-21,5.65-21,-10]) cylinder(d=3.5, h=70);
		translate([5.65-21,5.65+31-21,-10]) cylinder(d=3.5, h=70);
		translate([5.65+31-21,5.65+31-21,-10]) cylinder(d=3.5, h=70);

		//counter sink
		translate([5.65-21,5.65-21,-2+extra_depth]) sphere(d=head_diamiter);
		translate([5.65+31-21,5.65-21,-2+extra_depth]) sphere(d=head_diamiter);
		translate([5.65-21,5.65+31-21,-2+extra_depth]) sphere(d=head_diamiter);
		translate([5.65+31-21,5.65+31-21,3]) cylinder(d=head_diamiter, h=20);

		translate([5.65-21,5.65-21,-2-extra_depth]) cylinder(d=head_diamiter, h=extra_depth*2);
		translate([5.65+31-21,5.65-21,-2-extra_depth]) cylinder(d=head_diamiter, h=extra_depth*2);
		translate([5.65-21,5.65+31-21,-2-extra_depth]) cylinder(d=head_diamiter, h=extra_depth*2);


		translate([-70,-30,-5]) cube([50,50,50]);
		translate([-30,-70,-5]) cube([50,50,50]);

		translate([0,0,-5]) cylinder(d=23, h=20);

		#rotate([90,0,-45]) translate([-8,-3,-55+tail_depth]) male_dovetail(height=30);
		#rotate([90,0,-45]) translate([8,-3,-55+tail_depth]) male_dovetail(height=30);

		#rotate([90,0,-45]) translate([-8,-3,22-tail_depth]) male_dovetail(height=30);
		#rotate([90,0,-45]) translate([8,-3,22-tail_depth]) male_dovetail(height=30);
	}
}

module motor_mount(){
	difference(){
		y_mount_added();
		y_mount_taken();
	}
}

module translated_mount(){
translate([(-obj_leg/2)-2.5,0,0]) rotate([0,90,0]) motor_mount();
}

module screw_driver(){
translated_mount();
}

rotate([0,-90,0]) difference(){
	screw_driver();
	translate([-15,0,0]) rotate([0,90,0]) union(){
		translate([5.65,5.65,-1]) cylinder(d=3.5, h=40);
		translate([5.65+31,5.65,-1]) cylinder(d=3.5, h=40);
		translate([5.65,5.65+31,-1]) cylinder(d=9, h=40);
		translate([5.65+31,5.65+31,-1]) cylinder(d=9, h=40);

		translate([-20,20,15]) rotate([90,0,45]) cylinder(h=70, d=22);
		translate([20,20,15]) rotate([90,0,-45]) cylinder(h=70, d=22);
	}
}