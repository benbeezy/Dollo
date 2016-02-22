include <veriables.scad>;


$fn= 20;
rotate([0,0,0]) difference(){
	cube([motor_width,motor_width,10], center=true);
	translate([motor_screw_space/2,motor_screw_space/2,0]) cylinder(d=3, h=10, center=true);
	translate([motor_screw_space/2,motor_screw_space/2,-5]) sphere(d=6);
	translate([-motor_screw_space/2,motor_screw_space/2,0]) cylinder(d=3, h=10, center=true);
	translate([-motor_screw_space/2,motor_screw_space/2,-5]) sphere(d=6);
	translate([motor_screw_space/2,-motor_screw_space/2,0]) cylinder(d=3, h=10, center=true);
	translate([motor_screw_space/2,-motor_screw_space/2,-5]) sphere(d=6);
	translate([-motor_screw_space/2,-motor_screw_space/2,0]) cylinder(d=3, h=10, center=true);
	translate([-motor_screw_space/2,-motor_screw_space/2,-5]) sphere(d=6);
	cylinder(h=10, d=8, center=true);
	cylinder(h=10, d=16, $fn=6);
}