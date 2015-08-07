module master(){
	hull(){
		rotate([90,0,0]) translate([-35,-1,-20]) sphere(r=9);
		rotate([90,0,0]) translate([-35,-1,-9]) sphere(r=9);
	}
	rotate([0,45,0]) translate([-33,0,-25]) cube([5,20,50]);
	difference(){
		rotate([0,45,0]) translate([-33,0,-0]) cube([35,5,30]);
		union(){
			rotate([90,0,0]) translate([0,30,0]) cylinder(h=11, d=3.5, center=true, $fn=20);
			#rotate([90,0,0]) translate([0,30,-8]) cylinder(h=11, d=8, center=true, $fn=20);
		}
	}
}

mirror([1,1,0]) rotate([90,0,0]) master();
rotate([90,0,0]) master();