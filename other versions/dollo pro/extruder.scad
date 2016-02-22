module extruder(){
	import("i3v_extruder.stl");
	translate([0,-1,0]) cylinder(d=20,h=5);
}

difference(){
	extruder();
	translate([0,-1,0]) cylinder(d=3,h=100,center=true, $fn=25);
}