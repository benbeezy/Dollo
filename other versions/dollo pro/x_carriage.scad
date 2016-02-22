include <veriables.scad>;

module hotend(){
	//top
	translate([0,0,-hotend_top/2]) cylinder(d=hotend_top_dia, h=hotend_top,center=true);
	//bottom
	cylinder(d=hotend_gap_dia, h=hotend_gap+10, center=true);
}

module basics(){
	hull(){
		translate([0,0,(hotend_gap+hotend_top)/2]) cube([45,long_bearing_length*2,hotend_gap+hotend_top], center=true);
		rotate([90,0,0]) translate([-x_rod_spacing/2,(long_bearing_od+wall_thickness)/2,0]) cylinder(d=long_bearing_od+wall_thickness, h=long_bearing_length*2, center=true);
	}
}

rotate([90,0,0]) intersection(){
	difference(){
		basics();
		translate([0,0,(hotend_gap+hotend_top)/3]) hotend();
		rotate([90,0,0]) translate([-x_rod_spacing/2,(long_bearing_od+wall_thickness)/2,0]) cylinder(d=long_bearing_od, h=long_bearing_length*2+5, center=true);
		translate([0,long_bearing_od/2,6]) rotate([90,0,90]) cylinder(d=3, h= 100, center=true);
		translate([0,-long_bearing_od/2,6]) rotate([90,0,90]) cylinder(d=3, h= 100, center=true);
		translate([-38,long_bearing_od/2,6]) rotate([90,0,90]) cylinder(d=7, h= 10, center=true);
		translate([-38,-long_bearing_od/2,6]) rotate([90,0,90]) cylinder(d=7, h= 10, center=true);
		translate([0,0,(hotend_gap+hotend_top)/2+hotend_gap+hotend_top+5]) cube([35,long_bearing_length*2,hotend_gap+hotend_top+10], center=true);
		translate([0,25,0]) cylinder(d=4, h=50, center=true);
		translate([0,-25,0]) cylinder(d=4, h=50, center=true);
		translate([-10,15,0]) cylinder(d=4, h=50, center=true);
		translate([-10,-15,0]) cylinder(d=4, h=50, center=true);
	}
		translate([-100,-50,0]) cube([100,100,100]);
}