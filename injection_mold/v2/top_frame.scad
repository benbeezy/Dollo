units2 = 6;
length_in_units2 = 6;

module arm(length_in_units2){
translate([30*(units2+2)/2-15,0,0]) cube([30,30*(length_in_units2+2),30], center=true);
}
module metal_smooth_rods(){
	translate([30*(units2+2)/2-15,((units2-1)/3)*30,0]) cylinder(d=8, h=45, center=true, $fn=100);
	translate([30*(units2+2)/2-15,-((units2-1)/3)*30,0]) cylinder(d=8, h=45, center=true, $fn=100);
	//lm8uu linear bearing
	translate([30*(units2+2)/2-15,0,0]) cylinder(d=15, h=45, center=true, $fn=100);
}
module base(){
	difference(){
		arm(length_in_units2);
		metal_smooth_rods();
	}
	rotate([0,0,90]) arm(length_in_units2);
	rotate([0,0,180]) arm(length_in_units2);
	rotate([0,0,-90]) arm(length_in_units2);

	translate([0,(units2-2.5)*30,(units2-2.5)*30]) rotate([90,0,0]) arm(length_in_units2);
	translate([0,-(units2-2.5)*30,(units2-2.5)*30]) rotate([90,0,0]) arm(length_in_units2);
	translate([0,(units2-2.5)*30,(units2-2.5)*30]) rotate([90,180,0]) arm(length_in_units2);
	translate([0,-(units2-2.5)*30,((length_in_units2-2.5)*30)]) rotate([90,0,180]) arm(length_in_units2);
}

base();

module rack(){
	import("/Users/benjamin/Desktop/projects/Dollo/injection_mold/v2/stl/rack.stl");
}

rotate([180,0,0]) translate([30,(units2+1)*(30/2),17]) rack();
rotate([180,0,0]) translate([30,-(units2+1)*(30/2),17]) rack();