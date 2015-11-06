nut_size	=	15.8;
$fn=6;
module nut(){
	cylinder(d=nut_size, center=true, h=13);
}

module piece(){
	cylinder(d=nut_size+4, center=true, h=12);
	translate([-nut_size,0,-4.5]) cube([nut_size*2,nut_size,3], center=true);
}

difference(){
	piece();
	nut();
}

difference(){
	intersection(){
		cube([nut_size,nut_size,1], center=true);
		nut();
	}
	cube([nut_size-4,nut_size-4,1], center=true);
}