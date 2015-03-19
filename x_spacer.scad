include <globals.scad>;
include <include.scad>;

tail_depth = 55;
tail_depth_2 = -10;
module y_mount_added(){
	translate([0,-15+6-3.5,51/2]) cube([30,23,51], center=true);
    
    	translate([-8,-1,-55+tail_depth]) scale([.9,.9,.9]) male_dovetail(height=15);
	translate([8,-1,-55+tail_depth]) scale([.9,.9,.9]) male_dovetail(height=15);
    

}

module y_mount_taken(){
	translate([0,-24,15]) rotate([0,45,0]) tie_end();
    	rotate([180,0,0]) translate([-8,1,-55+tail_depth_2]) scale([.9,.9,.9]) male_dovetail(height=30);
	rotate([180,0,0]) translate([8,1,-55+tail_depth_2]) scale([.9,.9,.9]) male_dovetail(height=30);
        translate([0,-12,51/2]) cube([30,12,51], center=true);

}

rotate([0,0,0]){
difference(){
	y_mount_added();
	y_mount_taken();
}
	translate([0,-23.5,15]) bow_support();
        difference(){
            union(){
                hull(){
                    translate([9,-12,0]) cylinder(h=51, r=6);
                    translate([-9,-12,0]) cylinder(h=51, r=6);
                }
            }
            union(){
                hull(){
                    translate([9,-12,0]) cylinder(h=51, r=5.25);
                    translate([-9,-12,0]) cylinder(h=51, r=5.25);
                }
                hull() {
                    rotate([0,90,0]) translate([-15,-12,-15]) cylinder(h=51, r=5.5);
                    rotate([0,90,0]) translate([-51+15,-12,-15]) cylinder(h=51, r=5.5);
                }
             }
        }
}