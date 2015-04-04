include <include.scad>;
include <globals.scad>;
include <publicDomainGearV1.1.scad>;

//globals

obj_height = 40;
units = 2;
diamiter = 4;  // of corners







module rounded_cube(width,depth,height){
    hull(){
        translate([width/2-diamiter/2,depth/2-diamiter/2,height/2-diamiter/2]) sphere(d=diamiter);
        translate([width/2-(diamiter/2),depth/2-(diamiter/2),-height/2+(diamiter/2)]) sphere(d=diamiter);
        translate([-width/2+diamiter/2,depth/2-diamiter/2,height/2-diamiter/2]) sphere(d=diamiter);
        translate([-width/2+(diamiter/2),depth/2-(diamiter/2),-height/2+(diamiter/2)]) sphere(d=diamiter);
        
        translate([width/2-diamiter/2,-depth/2+diamiter/2,height/2-diamiter/2]) sphere(d=diamiter);
        translate([width/2-(diamiter/2),-depth/2+(diamiter/2),-height/2+(diamiter/2)]) sphere(d=diamiter);
        translate([-width/2+diamiter/2,-depth/2+diamiter/2,height/2-diamiter/2]) sphere(d=diamiter);
        translate([-width/2+(diamiter/2),-depth/2+(diamiter/2),-height/2+(diamiter/2)]) sphere(d=diamiter);
    }
}    
//herring bone style rack made from inkscape and OpenScad
module rackObject() {

//the final rendering
				rackFull();

		for(rack_length=[-5:5]){ 
			difference(){
				translate([30*rack_length+15,5,0]) cube([30,6,40], center=true);
    		 		translate([27*rack_length+9,7.3,0]) rotate([0,0,180]) male_dovetail(height=30);
			}
		}
}


intersection(){
			#translate([30,0,0]) rounded_cube(30*units,16,40,$fn=50);
		union(){
			#translate([0,0,10]) rack();
			rackObject();
		}
}

union(){ rotate([0,0,0]) intersection(){

	difference(){
		union(){

		}
	}
}
}
