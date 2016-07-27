include <globals.scad>;
include <include.scad>;

tail_depth = 55;
tail_depth_2 = -10;
thickness = 21;
module y_mount_added(){
	translate([0,-15+6-3.5,51/2]) cube([30,thickness,51], center=true);
    
    translate([-8,-12.5+thickness/2,-55+tail_depth]) scale([.9,.9,.9]) male_dovetail(height=15);
	translate([8,-12.5+thickness/2,-55+tail_depth]) scale([.9,.9,.9]) male_dovetail(height=15);
    

}

module y_mount_taken(){
	translate([0,-thickness/2-12.5,15]) rotate([0,45,0]) tie_end();
    
	rotate([180,0,0]) translate([-8,12.5-thickness/2,-55+tail_depth_2]) scale([.9,.9,.9]) male_dovetail(height=30);
	rotate([180,0,0]) translate([8,12.5-thickness/2,-55+tail_depth_2]) scale([.9,.9,.9]) male_dovetail(height=30);
translate([-15,-45,0]) wrap(3);
}
rotate([90,0,0]) difference(){
	translate([0,-thickness/2-12.5,15]) bow_support();
	translate([0,-thickness/2-12.5,25]) cube([50,10,20], center=true);
	translate([0,-thickness/2-12.5,0]) cube([31,10,20], center=true);
}

rotate([90,0,0]) difference(){
	y_mount_added();
	y_mount_taken();
}
