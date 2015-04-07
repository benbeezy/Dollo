include <include.scad>;
include <globals.scad>;
include <corner.scad>;
include <extention.scad>;

extention();
translate([0,(obj_leg*-3),0]) basic_corner();

translate([obj_leg*7,obj_leg,0]) rotate([0,0,180]){
extention();
translate([0,(obj_leg*-3),0]) basic_corner();
}

translate([obj_leg*4,obj_leg*-3,0]) rotate([0,0,90]){
extention();
translate([0,(obj_leg*-3),0]) basic_corner();
}

translate([obj_leg*3,obj_leg*4,0]) rotate([0,0,-90]){
extention();
translate([0,(obj_leg*-3),0]) basic_corner();
}


module top_flip(){
extention();
translate([0,(obj_leg*-3),0]) basic_corner();

translate([obj_leg*7,obj_leg,0]) rotate([0,0,180]){
extention();
translate([0,(obj_leg*-3),0]) basic_corner();
}

translate([obj_leg*4,obj_leg*-3,0]) rotate([0,0,90]){
extention();
translate([0,(obj_leg*-3),0]) basic_corner();
}

translate([obj_leg*3,obj_leg*4,0]) rotate([0,0,-90]){
extention();
translate([0,(obj_leg*-3),0]) basic_corner();
}
}

translate([obj_leg*7,0,obj_leg*7]) rotate([0,180,0]) top_flip();

	rotate([90,0,0]) translate([obj_leg*7,obj_leg*3,obj_leg*3]){ extention();}
	rotate([90,0,0]) translate([obj_leg*7,obj_leg*3,obj_leg*-4]){ extention();}
	rotate([90,0,0]) translate([0,obj_leg*3,obj_leg*-4]){ extention();}
	rotate([90,0,0]) translate([0,obj_leg*3,obj_leg*3]){ extention();}