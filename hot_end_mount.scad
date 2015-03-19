include <globals.scad>;
include <include.scad>;

hotend_depth = 80;
mounting_diamiter = 13;

module motor_mount_small(height=15){
	scale([.9,.9,.9]) 	translate([-8.75,1,0]) male_dovetail(height);
	scale([.9,.9,.9]) 	translate([8.75,1,0]) male_dovetail(height);
}

module y_mount_added(){
	motor_mount_small();
	translate([0,-4,hotend_depth/2]) cube([24.75,10,hotend_depth], center=true);
        translate([0,-15,hotend_depth-(5.8/2)]) cube([25,30,5.8],center=true);
}

module y_mount_taken(){
	translate([0,2,38]) rotate([0,0,180]) motor_mount_small(height=50);
        translate([0,-18,hotend_depth/2]) cylinder(h=70, d=mounting_diamiter);

    
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
                translate([-12,.7,37.5]) cube([7,.3,42.5]);
    }
}

mount();
translate([0,-65,0]) mirror([0,1,0]) mount();