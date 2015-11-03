////608 z axis holder/////

extra	=	2;

module bearing(){
	cylinder(d=22.1, h=7, center=true);
}


module z_stable(){
	translate([extra,extra,0]) cube([24+(extra*2),24+(extra*2),7], center=true);
}

difference(){
	z_stable();
	bearing();
}