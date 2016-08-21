include <include.scad>;
include <globals.scad>;
include <gears.scad>;

///////////////////// FOCUS ON THIS NOW //////////////////////////////
tooth_depth = (sqrt(18)/2)+2;
twisted_depth = 2;
units = 2;
r =37;
mirror = true;
double = false; //this will make the piece twist in both directions. only works if you have a high pitch screw

gearOne = -16.5;
gear_reverse = -10;
gearLarge = -32.6+(gearOne/2);

resolution = 60;
///////////////////// FOCUS ON THIS NOW //////////////////////////////

// side rounded hollows and inside dovetail tracks
module wrap(){
    translate([-16.5,30+4,-32]) rotate([0,90,-90]) male_dovetail();
    translate([-32,30+4,-16.5]) rotate([-90,180,0])  male_dovetail();
    
    rotate([90,0,0]) translate([-35,-1,-25*units]) cylinder(h=35*units, r=8);
    mirror([1,0,-1]) rotate([90,0,0]) translate([-35,-1,-25*units]) cylinder(h=35*units, r=8);
}

module arm_movement(){
	difference(){
		//part im trying to make
        difference(){
            translate([-95+tooth_depth,-95+tooth_depth,30]) rotate([0,0,45]) cube([45,45,((units+1)*30)-.25], center=true);
            translate([-105+(-15/2),-105+(-15/2),30]) cube([45,45,30*5], center=true);
        }
        //twist
	
        for (extrude=[0:units+1]){
            translate([0+(gearLarge+(gearLarge/2))+tooth_depth,0+(gearLarge+(gearLarge/2))+tooth_depth,extrude*20]) color([0,1,0]) rotate([0,0,(360/22)*1.75]) twist_large_extrude($fn=resolution);
            translate([21.5-95,21.5-95,extrude*30-45-5]) rotate([90,0,90]) wrap();
        }

	}
}

module finished(){
	intersection(){
		translate([95,95,0]) arm_movement();
		hull(){
			translate([tooth_depth+25.5,0,0]) cylinder(h=(units+2)*30, r=2);
			translate([0,tooth_depth+25.5,0]) cylinder(h=(units+2)*30, r=2);
			
			translate([-(tooth_depth+26),1,0]) cylinder(h=(units+2)*30, r=2);
			translate([1,-(tooth_depth+26),0]) cylinder(h=(units+2)*30, r=2);
		}
	}
}
module base(){
	intersection(){
		translate([0,0,0]) rotate([0,0,45]) finished();
		//translate([-50,-50,0]) cube([100,100,units*40]);
	}
}

module top_dove() {
    intersection() {
        scale([0.9, 1, 0.95]) rotate ([90,0,0]) intersection() {
            intersection() {
                male_dovetail(height=11.7);
                translate([-6,0,0]) cube([10,4.6,25]);
            }
            translate([0,-0.3, 0]) cylinder(r=5.7, h=20);
        }
        translate([-5,-6,-4.2]) rotate([0,90,0]) cylinder(r=10, h=20);
    }
}
//translate([50,50,0]) top_dove(); //testing

module with_dove(){
    difference(){
        intersection(){
            rotate([0,-2,0]) base();
            translate([-50,-50,1.38]) cube([100,100,units*30]);
        }
        translate([0,0,1]) union(){
            translate([11,15,0]) rotate([90,0,0]) male_dovetail(height=25);
            translate([-11,15,0]) rotate([90,0,0]) male_dovetail(height=25);
        }
    }

    translate([-2,0,0]) difference(){
        union(){
            translate([11,14.2,30*units+1.1]) top_dove();
            translate([-11,14.2,30*units+1.1]) top_dove();
        }
            translate([0,-33,0]) rotate([0,0,45]) cube([30,30,units*45]);
        }
}

// do it
with_dove();
