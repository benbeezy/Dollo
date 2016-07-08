include <include.scad>;
include <globals.scad>;


module body(){
scale([-1,.5,1]) difference(){
	union(){
	cube([100,100,13]);
	cube([50,20,25]);
	}
	rotate([0,0,45]) cube([200,200,200]);

}
}
rotate([90,0,0])difference(){
	body();
	translate([-90,50,13/2]) rotate([90,0,0]) cylinder(d=8, h=100);
}
