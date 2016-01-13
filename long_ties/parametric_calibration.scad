/*
what do you want to test for?

In the section below, set what you want to test to true, 
and things that you dont want to test to false.

logo will test sharp corners and thin objects
x_axis will test your x length and your resolution on text
y_axis will test rounded faces in all directions and your y axis length
z_axis will test your z height with 5mm units, small overhangs, and how will it does small surfaces

*/

//what do you want to test?

x_axis = true;
y_axis = true;
z_axis = true;
overhangs = true;
sharp_corners = true;
thin_objects = true;

//how big in mm do you want your test to be?

x = 50;
y = 50;
z = 50;











// dont mess with these things unless you know what you are doing
module logo(){
	difference(){
		translate([5,5,0]) cube([20,20,3]);
		translate([12,10,-.5]) cube([8,50,4]);
		translate([12,0,-.5]) cube([1,50,4]);
		translate([12,25,-.5]) rotate([0,0,-70]) cube([8,50,4]);
		translate([12,5,-.5]) rotate([0,0,-70]) cube([8,50,4]);
		translate([-15,28,-.5]) rotate([0,0,-80]) cube([8,50,4]);
		translate([12,-3,-.5]) rotate([0,0,70]) cube([8,50,4]);
	}
	translate([5,5,0]) cube([20,20,.5]);
}


module x(){
	difference(){
		cube([x,5,3]);
		for ( i = [0 : x/5-1] )
			{	
				translate([(i*5)+1,0,2.8]) cube([.25,3,.5]);
			}
	}
	linear_extrude(height=3.){
		translate([5,3.5,2.8]) text("5", size = 1.5);
		translate([5*2,3.5,2.8]) text("10", size = 1.5);
		translate([5*3,3.5,2.8]) text("15", size = 1.5);
		translate([5*4,3.5,2.8]) text("20", size = 1.5);
		translate([5*5,3.5,2.8]) text("25", size = 1.5);
		translate([5*6,3.5,2.8]) text("30", size = 1.5);
		translate([5*7,3.5,2.8]) text("35", size = 1.5);
		translate([5*8,3.5,2.8]) text("40", size = 1.5);
		translate([5*9,3.5,2.8]) text("45", size = 1.5);
	}
}

module y(){
	hull(){
		translate([2.5,0,5/2]) sphere(d=5, $fn=80);
		translate([2.5,50,0]) cylinder(h=3, d=5, $fn=80);
	}
}

module z(){
	intersection(){
		cube([10,10,50]);
		hull(){
			sphere(d=12, $fn=80);
			translate([0,0,50]) sphere(d=8, $fn=80);
		}
	}
}

 if (x_axis==true || overhangs==true) {
	  if (overhangs==true) {
			difference(){
				x();
				translate([5,0,0]) cube([5,3,2]);
				translate([15,0,0]) cube([10,3,2]);
				translate([30,0,0]) cube([15,3,2]);
			}
		} else{
			x();
		}
 }
 
  if (y_axis==true) {
	difference(){
		y();
		for ( i = [0 : x/5-1] )
			{	
				translate([0,(i*5)+1,0]) cube([3,.25,.5]);
			}
	}
 }
 
  if (z_axis==true) {
		z();
		for ( i = [0 : x/5-1] )
			{	
				translate([0,-.25,(i*5)+1]) cube([4,1,.25]);
			}
 }

  if (thin_objects==true || sharp_corners==true) {
		logo();
 }