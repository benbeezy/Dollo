include <globals.scad>;
include <include.scad>;

hotend_depth = 75;
mounting_diamiter = 11.75;
top_diamiter = 16.5;
arm_thickness = 5;
snap_location = 47;
natch_height = 6;


module motor_mount_small(height=15){
	scale([.9,.9,.9]) 	translate([-8.75,1,snap_location]) male_dovetail(35);
}

module y_mount_added(){
	motor_mount_small();
	translate([0,-4+((10-arm_thickness)/2),hotend_depth/2]) cube([24.75,arm_thickness,hotend_depth], center=true);
    translate([0,-15,hotend_depth-(natch_height)]) cube([25,30,natch_height*2],center=true);
	translate([-5,-15,hotend_depth-15]) rotate([-45,0,0]) cube([15,30,natch_height*2],center=true);
	translate([0,1,0]) cube([25,8,5],center=true);
}

module y_mount_taken(){
        translate([0,-13,hotend_depth/2]) cylinder(h=70, d=mounting_diamiter);
	    translate([0,-13,0]) cylinder(h=70, d=top_diamiter);
		translate([0,-26,hotend_depth-natch_height]) rotate([0,-90,0]) cylinder(h=30, d=3.5, $fn=20);
		#translate([0,-2,hotend_depth-natch_height+3]) rotate([0,-90,0]) cylinder(h=30, d=3.5, $fn=20);
}
module mount(){
    rotate([0,-90,0]){
        intersection(){
                    translate([-15,-30,0]) cube([15,100,100]);
            difference(){
                    y_mount_added();
                    y_mount_taken();
            }
        }
                translate([-12,.7,37.5+(hotend_depth-80)]) cube([7,.3,42.5]);
    }
}

mount();
translate([0,-65,0]) mirror([0,1,0]) mount();