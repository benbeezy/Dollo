include <include.scad>;
include <globals.scad>;


//globals

obj_height = 40;
units = 10; //only even numbers
tail_depth = 8;
tie_scale_x = 1;
tie_scale_y = 1;
tie_scale_z = 1;


//good things
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
				module tie_taken(){
					difference(){
						union(){
							translate([0,tail_depth,.5]) rotate([0,0,180]) scale([tie_scale_x,tie_scale_z,tie_scale_y])  male_dovetail(height=30);
							translate([0,tail_depth,-30.5]) rotate([0,0,180]) scale([tie_scale_x,tie_scale_z,tie_scale_y])  male_dovetail(height=30);
						}
						cube([10,20,1], center=true);
					}
				}




//herring bone style rack made from inkscape and OpenScad
module rackObject() {

module rackHalf(){
	intersection() {
		union() {
			rotate(a=[0,0,0]) {
				linear_extrude(height = obj_height*5, center = true, convexity = 10)
			   	import (file = "../../vectors/rack.dxf", layer = "Layer_1");
			}
		}
			translate([0, 0, obj_height/4*-1]) cube(center = true, [31, 50, obj_height/2]);
	}
}				
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
		for(rack_length=[-units:5]){ 
				translate([rack_length*18,0,0]) rackFull();
		}
		for(rack_length=[-units:1]){ 
			difference(){
				translate([30*rack_length+15,6,0]) cube([30,8,40], center=true);
				//translate([30*rack_length+9,0,0]) tie_taken();
			}
		}
}
diamiter = 4;

 module rack_full(){
	intersection(){
	//translate([0,0,-10]) cube([20,20,20]);
		intersection(){
						rotate([-90,0,0]) translate([-10-((units-2)*15),0,0]) translate([30,0,0]) rounded_cube(30*units+10,20,40,$fn=50);
		union(){ 
			rotate([-90,0,0]) intersection(){
				
					rackObject();
					
				

						translate([30,0,0]) rounded_cube(30*units,20,40,$fn=50);

		//intersection
		}
		//union
		}
		//intersection
		}
	//intersection
		
}// module
	}
	
	rack_full();