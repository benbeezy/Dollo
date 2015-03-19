include <include.scad>;
include <globals.scad>;









///////////////////// FOCUS ON THIS NOW //////////////////////////////
tooth_depth = -6.5;
twisted_depth = 2;
units = 2;
r =37;
mirror = true;
double = false; //this will make the piece twist in both directions. only works if you have a high pitch screw
///////////////////// FOCUS ON THIS NOW //////////////////////////////






















module full(){
	module wrap(){
				//scale([1.1,1.1,1.1]) translate([-15,30-2.5,15]) rotate([90,180,90]) mirror([1,1,0]) male_dovetail();
				scale([1.1,1.1,1.1]) translate([-15,30-2.5,-15]) rotate([0,0,-90]) mirror([0,0,1]) male_dovetail();
				scale([1.1,1.1,1.1]) translate([-15,30-2.5,-15]) rotate([-90,180,-90]) mirror([0,0,1]) male_dovetail();
				//scale([1.1,1.1,1.1]) translate([15,30-2.5,-15]) rotate([0,0,90]) mirror([1,1,0]) male_dovetail();
	}
module main(){
difference(){
    translate([22,22,0]) difference(){
        rotate([0,0,45]) translate([0,0,30*units/2]) cube([30,30,30*units], center=true);
        rotate([0,0,0]) translate([15,15,30*units/2]) cube([30,30,30*units], center=true);
    }
for (i = [0:4*units]) {
translate([tooth_depth,tooth_depth,i*15/2]) scale([1,1,1]) linear_extrude(height = 8, center = false, convexity = 10, twist = 360, $fn = 50) translate([twisted_depth, 0, 0]) circle(r = r);
	if (double==true) {
	translate([tooth_depth,tooth_depth,i*15/2]) scale([1,1,1]) linear_extrude(height = 8, center = false, convexity = 10, twist = -360, $fn = 50) translate([twisted_depth, 0, 0]) circle(r = r);
	}
}
}
}


difference(){
    main();
    #for (i=[0:units-1]){
    #translate([7,7,(i*30)-15]) rotate([90,0,-90]) wrap();
    }
}
    for (i=[0:units-1]){
        #translate([22,43-21,(i*30)]) rotate([90,0,0]) cube([20,30,1]);
        translate([22,43,(i*30)]) rotate([90,0,-90]) cube([20,30,1]);
    }
}

if (mirror==true) {
	mirror([0,0,1]) full();
} else {
	full();
}