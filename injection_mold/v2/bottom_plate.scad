units2 = 6;
length_in_units2 = 6;
module arm(length_in_units2){
translate([30*(units2+2)/2-15,0,0]) cube([30,30*(length_in_units2+2),30], center=true);
}


// add a fan to this


module bottom_frame() {
	difference(){
		cube([30*(units2+2.5),30*(units2+2.5),3], center=true);
		
		translate([0,(units2-2.5)*30,(units2-3)*30]) rotate([90,0,0]) arm(length_in_units2);
		translate([0,-(units2-2.5)*30,(units2-3)*30]) rotate([90,0,0]) arm(length_in_units2);
		translate([0,(units2-2.5)*30,(units2-3)*30]) rotate([90,180,0]) arm(length_in_units2);
		translate([0,-(units2-2.5)*30,((length_in_units2-3)*30)]) rotate([90,0,180]) arm(length_in_units2);
	}
}

bottom_frame();