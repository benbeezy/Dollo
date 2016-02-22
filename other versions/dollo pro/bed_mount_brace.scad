include <veriables.scad>;

module added(){
	translate([0,50/2+(30-aluminum_plate_thick)/2-(30-aluminum_plate_thick),0]) cube([160,50,8],center=true);
}

module taken(){
	#translate([150/2-smooth_rod,0,0]) cube([12,30-aluminum_plate_thick,8],center=true);
	#translate([-150/2+smooth_rod,0,0]) cube([12,30-aluminum_plate_thick,8],center=true);
}

difference(){
	added();
	taken();
}