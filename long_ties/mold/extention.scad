module extention(){
	include <../extention.scad>;
}

difference(){
	translate([-2.5,-32.5,0]) cube([35,35,30*4]);
	extention();
}