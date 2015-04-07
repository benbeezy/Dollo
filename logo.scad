rotate([35,0,0]) rotate([0,45,0]){
	color([1,.6,0]) cube([50,50,50], center=true);
	translate([-16, -16, 25]) {
	   color([1,1,1]) text("D", font = "Liberation Sans:style=Bold", size=35);
	 }
	 rotate([0,-90,0]) translate([-16, -16, 25]) {
	   color([1,1,1]) text("3", font = "Liberation Sans:style=Bold", size=35);
	 }
	 rotate([-90,-45,0]) translate([-27, -5, 25]) {
	   color([1,1,1]) text("DOLLO", font = "Liberation Sans:style=Bold", size=12);
	 }
}


inches = 25.4;
scale([inches,inches,inches]) module everything(){
	//put things in here
}
everything();