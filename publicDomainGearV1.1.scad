//////////////////////////////////////////////////////////////////////////////////////////////
// Public Domain Parametric Involute Spur Gear (and involute helical gear and involute rack)
// version 1.1
// by Leemon Baird, 2011, Leemon@Leemon.com
//http://www.thingiverse.com/thing:5505
//
// This file is public domain.  Use it for any purpose, including commercial
// applications.  Attribution would be nice, but is not required.  There is
// no warranty of any kind, including its correctness, usefulness, or safety.
// 
// This is parameterized involute spur (or helical) gear.  It is much simpler and less powerful than
// others on Thingiverse.  But it is public domain.  I implemented it from scratch from the 
// descriptions and equations on Wikipedia and the web, using Mathematica for calculations and testing,
// and I now release it into the public domain.
//
//		http://en.wikipedia.org/wiki/Involute_gear
//		http://en.wikipedia.org/wiki/Gear
//		http://en.wikipedia.org/wiki/List_of_gear_nomenclature
//		http://gtrebaol.free.fr/doc/catia/spur_gear.html
//		http://www.cs.cmu.edu/~rapidproto/mechanisms/chpt7.html
//
// The module gear() gives an involute spur gear, with reasonable defaults for all the parameters.
// Normally, you should just choose the first 4 parameters, and let the rest be default values.
// The module gear() gives a gear in the XY plane, centered on the origin, with one tooth centered on
// the positive Y axis.  The various functions below it take the same parameters, and return various
// measurements for the gear.  The most important is pitch_radius, which tells how far apart to space
// gears that are meshing, and adendum_radius, which gives the size of the region filled by the gear.
// A gear has a "pitch circle", which is an invisible circle that cuts through the middle of each
// tooth (though not the exact center). In order for two gears to mesh, their pitch circles should 
// just touch.  So the distance between their centers should be pitch_radius() for one, plus pitch_radius() 
// for the other, which gives the radii of their pitch circles.
//
// In order for two gears to mesh, they must have the same mm_per_tooth and pressure_angle parameters.  
// mm_per_tooth gives the number of millimeters of arc around the pitch circle covered by one tooth and one
// space between teeth.  The pitch angle controls how flat or bulged the sides of the teeth are.  Common
// values include 14.5 degrees and 20 degrees, and occasionally 25.  Though I've seen 28 recommended for
// plastic gears. Larger numbers bulge out more, giving stronger teeth, so 28 degrees is the default here.
//
// The ratio of number_of_teeth for two meshing gears gives how many times one will make a full 
// revolution when the the other makes one full revolution.  If the two numbers are coprime (i.e. 
// are not both divisible by the same number greater than 1), then every tooth on one gear
// will meet every tooth on the other, for more even wear.  So coprime numbers of teeth are good.
//
// The module rack() gives a rack, which is a bar with teeth.  A rack can mesh with any
// gear that has the same mm_per_tooth and pressure_angle.
//
// Some terminology: 
// The outline of a gear is a smooth circle (the "pitch circle") which has mountains and valleys
// added so it is toothed.  So there is an inner circle (the "root circle") that touches the 
// base of all the teeth, an outer circle that touches the tips of all the teeth,
// and the invisible pitch circle in between them.  There is also a "base circle", which can be smaller than
// all three of the others, which controls the shape of the teeth.  The side of each tooth lies on the path 
// that the end of a string would follow if it were wrapped tightly around the base circle, then slowly unwound.  
// That shape is an "involute", which gives this type of gear its name.
//
//////////////////////////////////////////////////////////////////////////////////////////////

//An involute spur gear, with reasonable defaults for all the parameters.
//Normally, you should just choose the first 4 parameters, and let the rest be default values.
//Meshing gears must match in mm_per_tooth, pressure_angle, and twist,
//and be separated by the sum of their pitch radii, which can be found with pitch_radius().
pi= 3.1415926;

twist= 40;
	//gear settings
	angle_fix = 2; //use this is you are doing a pressure_angle that is under 28
	mm_per_tooth_gears    = 4;    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
	number_of_teeth_gears = 11;   //total number of teeth around the entire perimeter
	thickness_gears       = 25;    //thickness of gear in mm
	hole_diameter_gears   = 5.2;    //diameter of the hole in the center, in mm
	twist_gears           = twist;    //teeth rotate this many degrees from bottom of gear to top.  360 makes the gear a screw with each thread going around once
	teeth_to_hide_gears   = 0;    //number of teeth to delete to make this only a fraction of a circle
	pressure_angle_gears  = 28;   //Controls how straight or bulged the tooth sides are. In degrees.
	clearance_gears       = 0.0;  //gap between top of a tooth on one gear and bottom of valley on a meshing gear (in millimeters)
	backlash_gears        = 0.0;   //gap between two meshing teeth, in the direction along the circumference of the pitch circle
	
	//rack settings
	angle_fix = .5; //use this is you are doing a pressure_angle is under 28 as a multiplier
	mm_per_tooth_rack    = 4;    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
	number_of_teeth_rack = 15;   //total number of teeth along the rack
	thickness_rack       = 15;    //thickness of rack in mm (affects each tooth)
	height_rack          = 5;   //height of rack in mm, from tooth top to far side of rack.
	pressure_angle_rack  = 28;   //Controls how straight or bulged the tooth sides are. In degrees.
	backlash_rack        = 0.0; //gap between two meshing teeth, in the direction along the circumference of the pitch circle
	twist_rack			= (number_of_teeth_gears*mm_per_tooth_rack)/360*(twist/1.4 )*2;
	
	
module gear (
	mm_per_tooth    = mm_per_tooth_gears,
	number_of_teeth = number_of_teeth_gears,
	thickness       = thickness_gears,
	hole_diameter   = hole_diameter_gears,
	twist           = twist_gears,
	teeth_to_hide   = teeth_to_hide_gears,
	pressure_angle  = pressure_angle_gears,
	clearance       = clearance_gears,
	backlash        = backlash_gears
) {

	p  = mm_per_tooth * number_of_teeth / pi / 2;  //radius of pitch circle
	c  = p + mm_per_tooth / pi - clearance;        //radius of outer circle
	b  = p*cos(pressure_angle);                    //radius of base circle
	r  = p-(c-p)-clearance;                        //radius of root circle
	t  = mm_per_tooth/2-backlash/2;                //tooth thickness at pitch circle
	k  = -iang(b, p) - t/2/p/pi*180;             //angle to where involute meets base circle on each side of tooth
		difference() {
			for (i = [0:number_of_teeth-teeth_to_hide-1] )
				rotate([0,0,i*360/number_of_teeth])
					linear_extrude(height = thickness, center = true, convexity = 10, twist = twist)
						polygon(
							points=[
								[0, -hole_diameter/10],
								polar(r, -181/number_of_teeth),
								polar(r, r<b ? k : -180/number_of_teeth),
								q7(0/5,r,b,c,k, 1),q7(1/5,r,b,c,k, 1),q7(2/5,r,b,c,k, 1),q7(3/5,r,b,c,k, 1),q7(4/5,r,b,c,k, 1),q7(5/5,r,b,c,k, 1),
								q7(5/5,r,b,c,k,-1),q7(4/5,r,b,c,k,-1),q7(3/5,r,b,c,k,-1),q7(2/5,r,b,c,k,-1),q7(1/5,r,b,c,k,-1),q7(0/5,r,b,c,k,-1),
								polar(r, r<b ? -k : 180/number_of_teeth),
								polar(r, 181/number_of_teeth)
							],
 							paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]]
						);
			cylinder(h=2*thickness+1, r=hole_diameter/2, center=true, $fn=20);
		}
};	
//these 4 functions are used by gear
function polar(r,theta)   = r*[sin(theta), cos(theta)];                            //convert polar to cartesian coordinates
function iang(r1,r2)      = sqrt((r2/r1)*(r2/r1) - 1)/3.1415926*180 - acos(r1/r2); //unwind a string this many degrees to go from radius r1 to radius r2
function q7(f,r,b,r2,t,s) = q6(b,s,t,(1-f)*max(b,r)+f*r2);                         //radius a fraction f up the curved side of the tooth 
function q6(b,s,t,d)      = polar(d,s*(iang(b,d)+t));                              //point at radius d on the involute curve

//a rack, which is a straight line with teeth (the same as a segment from a giant gear with a huge number of teeth).
//The "pitch circle" is a line along the X axis.


module rack (
	mm_per_tooth    = mm_per_tooth_rack,
	number_of_teeth = number_of_teeth_rack,
	thickness       = thickness_rack,
	height          = height_rack,
	pressure_angle  = pressure_angle_rack,
	backlash        = backlash_rack,
	twist			= twist_rack,
) {
	a_rack = mm_per_tooth / pi; //addendum
	t_rack = a_rack*cos(pressure_angle)-angle_fix;         //tooth side is tilted so top/bottom corners move this amount
		for (i = [0:number_of_teeth-1] )
			rotate([180,0,0]) translate([i*mm_per_tooth,0,0])
					polyhedron(
						points=[
							[-mm_per_tooth * 3/4,                 a_rack-height,0],
							[-mm_per_tooth * 3/4 - backlash,     -a_rack,0],
							[-mm_per_tooth * 1/4 + backlash - t_rack, -a_rack,0],
							[-mm_per_tooth * 1/4 + backlash + t_rack,  a_rack,0],
							[ mm_per_tooth * 1/4 - backlash - t_rack,  a_rack,0],
							[ mm_per_tooth * 1/4 - backlash + t_rack, -a_rack,0],
							[ mm_per_tooth * 3/4 + backlash,     -a_rack,0],
							[ mm_per_tooth * 3/4,                 a_rack-height,0],
							
							[(-mm_per_tooth * 3/4) -twist,                 a_rack-height, thickness],
							[(-mm_per_tooth * 3/4 - backlash) -twist,     -a_rack, thickness],
							[(-mm_per_tooth * 1/4 + backlash - t_rack) -twist, -a_rack, thickness],
							[(-mm_per_tooth * 1/4 + backlash + t_rack) -twist,  a_rack, thickness],
							[( mm_per_tooth * 1/4 - backlash - t_rack) -twist,  a_rack, thickness],
							[( mm_per_tooth * 1/4 - backlash + t_rack) -twist, -a_rack, thickness],
							[( mm_per_tooth * 3/4 + backlash) -twist,     -a_rack, thickness],
							[( mm_per_tooth * 3/4) -twist,                 a_rack-height, thickness],
	
						],
						faces=[[0,1,2],[2,3,4],[2,4,5],[5,6,7],[0,2,5],[0,5,7]
						,[0+8,1+8,2+8],[2+8,3+8,4+8],[2+8,4+8,5+8],[5+8,6+8,7+8],[0+8,2+8,5+8],[0+8,5+8,7+8]
						,[0,1,0+8], [0+8,1+8,1],[1,1+8,2],[1+8,2+8,2],[2,3,2+8],[3,3+8,2+8],[3+8,4+8,3],[4,3,4+8],[4,4+8,5+8],[5+8,4,5],[5+8,5,6],[5+8,6+8,6],[7,7+8,6],[7+8,6,6+8],[0,0+8,7],[7+8,7,0+8]
						]
					);
};	


//These 5 functions let the user find the derived dimensions of the gear.
//A gear fits within a circle of radius outer_radius, and two gears should have
//their centers separated by the sum of their pictch_radius.
function circular_pitch  (mm_per_tooth=3) = mm_per_tooth;                     //tooth density expressed as "circular pitch" in millimeters
function diametral_pitch (mm_per_tooth=3) = 3.1415926 / mm_per_tooth;         //tooth density expressed as "diametral pitch" in teeth per millimeter
function module_value    (mm_per_tooth=3) = mm_per_tooth / pi;                //tooth density expressed as "module" or "modulus" in millimeters
function pitch_radius    (mm_per_tooth=3,number_of_teeth=11) = mm_per_tooth * number_of_teeth / 3.1415926 / 2;
function outer_radius    (mm_per_tooth=3,number_of_teeth=11,clearance=0.1)    //The gear fits entirely within a cylinder of this radius.
	= mm_per_tooth*(1+number_of_teeth/2)/3.1415926  - clearance;              


//gear();
//rack();

