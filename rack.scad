include <include.scad>;
include <globals.scad>;

//globals

obj_height = 40;
units = 2;



//herring bone style rack made from inkscape and OpenScad
module rackObject() {

//START:        This is the bottom of the rack that will be mirrored to make the top

module rackHalf(){
	intersection() {
		union() {
			rotate(a=[0,-25,0]) {
				linear_extrude(height = obj_height*5, center = true, convexity = 10)
			   	import (file = "rack.dxf", layer = "Layer_1");
			}
		}
			translate([0, 0, obj_height/4*-1]) cube(center = true, [200, 50, obj_height/2]);
	}
}
//END





//START: this is the finished full rack, this function makes the object and mirrors it and moves it above.

module rackFull(){
	intersection() {
		union() {
			mirror([0,0,1]) rackHalf();
			rackHalf();
		}
		union() {
			cube(center = true, [20, 30, obj_height-8]);

		}
	}
}
//END


//the final rendering
		for(rack_length=[-5:5]){ 
				translate([rack_length*20,0,0]) rackFull();
		}
		for(rack_length=[-5:5]){ 
			difference(){
				translate([30*rack_length+15,5,0]) cube([30,6,40], center=true);
    		 		#scale([1.1,1.1,1.1]) translate([27*rack_length+9,7.3,0]) rotate([0,0,180]) male_dovetail(height=30);
//#scale([1.1,1.1,1.1]) translate([-15,30-2.5,-15]) rotate([0,180,180]) male_dovetail();
			}
		}
}
diamiter = 4;
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
intersection(){
    			rotate([-90,0,0]) translate([-10,0,0]) translate([30,0,0]) rounded_cube(30*units+10,16,40,$fn=50);
union(){ rotate([-90,0,0]) intersection(){
rackObject();
	difference(){
		union(){
			translate([30,0,0]) rounded_cube(30*units,16,40,$fn=50);
                        #translate([-12.5,-5,0]) rotate([0,25,0]) cube([30,30,30]);
                        #mirror([0,0,1]) translate([-12.5,-5,0]) rotate([0,25,0]) cube([30,30,30]);
		}
		union(){
                        translate([47.5,-5,0]) rotate([0,25,0]) cube([30,30,30]);
                        mirror([0,0,1]) translate([47.5,-5,0]) rotate([0,25,0]) cube([30,30,30]);
		}
	}
}
}
}
