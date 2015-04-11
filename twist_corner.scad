include <include.scad>;
include <globals.scad>;
include <gears.scad>;









///////////////////// FOCUS ON THIS NOW //////////////////////////////
tooth_depth = 0;
twisted_depth = 2;
units = 2;
r =37;
mirror = true;
double = false; //this will make the piece twist in both directions. only works if you have a high pitch screw

gearOne = -16.5;
gear_reverse = -10;
gearLarge = -32.6+(gearOne/2);
///////////////////// FOCUS ON THIS NOW //////////////////////////////






















	module wrap(){
				#translate([-16.5,30-2.5,-30]) rotate([0,0,-90]) mirror([0,0,1]) male_dovetail();
				#translate([-30,30-2.5,-16.5]) rotate([-90,180,-90]) mirror([0,0,1]) male_dovetail();
		
				rotate([90,0,0]) translate([-35,-1,-15]) cylinder(h=31, r=9);
				mirror([1,0,-1]) rotate([90,0,0]) translate([-35,-1,-15]) cylinder(h=31, r=9);

	}	
	module wrap_add(){
				translate([-15,31,-15]) rotate([0,0,-90]) mirror([0,0,1]) cube([7,32,.5]);
				translate([-15,31,-15]) rotate([-90,0,-90]) mirror([0,0,1]) cube([7,32,.5]);
	}

module arm_movement(){
	difference(){
		//part im trying to make
	difference(){
		translate([-95,-95,30]) rotate([0,0,45]) cube([45,45,(30*2)-.25], center=true);
		translate([-105+(-15/2),-105+(-15/2),30]) cube([45,45,30*5], center=true);
	}
	//twist
	
	for (extrude=[0:3]){
		translate([0+(gearLarge+(gearLarge/2))+tooth_depth,0+(gearLarge+(gearLarge/2))+tooth_depth,extrude*16]) color([0,1,0]) rotate([0,0,(360/22)*1.75]) twist_large();
		translate([21.5-95,21.5-95,extrude*30-45]) rotate([90,0,90]) wrap();
	}
	
	}
	for (support = [1:2]){
		translate([-105,-74.5,support*30-45]) rotate([90,0,180])  wrap_add();
	}
}
translate([95,95,0]) arm_movement();