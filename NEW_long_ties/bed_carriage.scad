gearOne = 29;
gear_reverse = -10;
gearLarge = 57;
tip_size = .6;

center_width = 70;

bolt_hole_dia = 3.2;

height = 12;
arm_width = 11;
arm_length = 105 - arm_width;;
corner_arm_length = 153;
arm_hole_width = arm_width+0.2;
arm_hole_height = height/2;

extra_corner_offset = 4;

module nut() {
    hull() {
        cylinder(d = 6.5, h=2.4, $fn=6);
        translate([0,0,2.4]) cylinder(d = 3.2, h=1.2, $fn=20);
    }
}

//translate([50,50]) nut();
//translate([50,47.2]) cube([5.6, 5.6, 2.4]);

module gear_one_hole(dia=3, height=height) {
    translate([gearOne+(tip_size/2),0,0]) cylinder(d=dia, h=height);
}

module gear_one_nut_hole(z=0) {
    translate([gearOne+(tip_size/2),0,z]) nut();
}

module gear_large_hole(dia=3, height=height) {
    translate([(gearLarge+gearOne)+(tip_size/2),0,0]) cylinder(d=dia, h=height);
}

module gear_large_nut_hole(z=0) {
    translate([(gearLarge+gearOne)+(tip_size/2),0,z]) nut();
}

module gear_arm_holes(){
	gear_one_hole();
	gear_large_hole();
}

module motor(){
    cylinder(d=25, h=height);
    translate([43.84/2,0]) 		cylinder(d=bolt_hole_dia, h=height, $fn=20);
    translate([-43.84/2,0]) 	cylinder(d=bolt_hole_dia, h=height, $fn=20);
    translate([0,43.84/2]) 		cylinder(d=bolt_hole_dia, h=height, $fn=20);
    translate([0,-43.84/2]) 	cylinder(d=bolt_hole_dia, h=height, $fn=20);
    
    // nut indentations
    translate([43.84/2,0]) 		cylinder(d=8, h=2, $fn=20);
    translate([-43.84/2,0]) 	cylinder(d=8, h=2, $fn=20);
    translate([0,43.84/2]) 		cylinder(d=8, h=2, $fn=20);
    translate([0,-43.84/2]) 	cylinder(d=8, h=2, $fn=20);
    
}

module arm_hole() {
    cube([arm_hole_width*2, arm_hole_width, arm_hole_height]);
}

module arm_holes(){
    offset_x = 15;
    offset_y = -arm_hole_width/2;
    pos_z = arm_hole_height;
    
    translate([offset_x, offset_y, pos_z]) arm_hole();
    rotate([0,0,90]) translate([offset_x, offset_y, pos_z]) arm_hole();
    rotate([0,0,180]) translate([offset_x, offset_y, pos_z]) arm_hole();
    rotate([0,0,270]) translate([offset_x, offset_y, pos_z]) arm_hole();
    
    rotate([0,0,45]) translate([offset_x, offset_y, pos_z]) arm_hole();
    rotate([0,0,135]) translate([offset_x, offset_y, pos_z]) arm_hole();
    rotate([0,0,225]) translate([offset_x, offset_y, pos_z]) arm_hole();
    rotate([0,0,315]) translate([offset_x, offset_y, pos_z]) arm_hole();
    
}

module center() {

    $fn=20;
    difference() {
        cylinder(d=center_width, h=height, $fn=20);
        arm_holes();
        rotate([0,0,45]) motor();
        gear_one_hole();
        rotate([0,0,45]) gear_one_hole();
        rotate([0,0,90]) gear_one_hole();
        rotate([0,0,135]) gear_one_hole();
        rotate([0,0,180]) gear_one_hole();
        rotate([0,0,225]) gear_one_hole();
        rotate([0,0,270]) gear_one_hole();
        rotate([0,0,315]) gear_one_hole();
        
        gear_one_nut_hole();
        rotate([0,0,45]) gear_one_nut_hole();
        rotate([0,0,90]) gear_one_nut_hole();
        rotate([0,0,135]) gear_one_nut_hole();
        rotate([0,0,180]) gear_one_nut_hole();
        rotate([0,0,225]) gear_one_nut_hole();
        rotate([0,0,270]) gear_one_nut_hole();
        rotate([0,0,315]) gear_one_nut_hole();
        motor();
    }
}

module arm() {
    offset_x = 15.1;
    $fn=20;
    union() {
        difference() {
            translate([offset_x, -arm_width/2, 0]) cube([arm_length-offset_x, arm_width, height]);
            translate([0, 0, arm_hole_height]) cylinder(d=center_width+0.1,h=arm_hole_height);
            gear_arm_holes();
            gear_one_hole(dia=5.6, height=2.4);
            gear_large_hole(dia=5.6, height=2.4);
            gear_large_nut_hole(z=height-2.4);
            translate([43.84/2,0]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
            translate([43.84/2,0]) cylinder(d=5.6, h=2.4, $fn=20);
        }
    
        difference() {
            translate([arm_length, -arm_width]) cube([arm_width, 2*arm_width, arm_hole_height]);
            translate([arm_length+(arm_width/2), -arm_width/2]) cylinder(d=bolt_hole_dia, h=arm_hole_height);
            translate([arm_length+(arm_width/2), arm_width/2]) cylinder(d=bolt_hole_dia, h=arm_hole_height);
            translate([arm_length+(arm_width/2), -arm_width/2]) nut();
            translate([arm_length+(arm_width/2), arm_width/2]) nut();
        }
    }    
}

module corner_arm(){
    offset_x = 15.1;
    $fn=20;
    
    corner_arm_offset = sqrt(arm_length*arm_length*2);
    echo(corner_arm_offset);
    edge_offset = sqrt((arm_width/2)*(arm_width/2)*2);
    echo(edge_offset);

    union() {
        rotate([0,0,45]) {

            difference() {
                translate([offset_x, -arm_width/2, 0]) cube([corner_arm_length-offset_x, arm_width, height]);
                translate([0, 0, arm_hole_height]) cylinder(d=center_width+0.1,h=arm_hole_height);
                gear_arm_holes();
                gear_one_hole(dia=5.6, height=2.4);
                gear_large_hole(dia=5.6, height=2.4);
                gear_large_nut_hole(z=height-2.4);
                translate([43.84/2, 0]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
                translate([43.84/2, 0]) cylinder(d=5.6, h=2.4, $fn=20);
                translate([148, 0]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
            }
        }

        difference() {
            translate([arm_length, arm_length-arm_width-extra_corner_offset, 0]) cube([arm_width, arm_width*2, arm_hole_height]);
            translate([arm_length+arm_width/2, arm_length-arm_width/2-extra_corner_offset]) cylinder(d=3, h=height, $fn=20);
            translate([arm_length+arm_width/2, arm_length-arm_width/2-extra_corner_offset]) nut();

        }
        
        difference() {
            translate([arm_length-arm_width-extra_corner_offset, arm_length, 0]) cube([arm_width*2, arm_width, arm_hole_height]);
            translate([arm_length-arm_width/2-extra_corner_offset, arm_length+arm_width/2]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
            translate([arm_length-arm_width/2-extra_corner_offset, arm_length+arm_width/2]) nut();
        }
    }
}

module edge_arm() {
    difference() {
        translate([arm_length+arm_width,0,0]) rotate([0,0,90]) cube([arm_length+5, arm_width, height]);
        //arm();
        #translate([arm_length, 0]) cube([arm_hole_width, arm_hole_width, arm_hole_height]);
        translate([0,0.5,0]) corner_arm();
        translate([arm_length+arm_width/2, arm_length-arm_width/2-4]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
        translate([arm_length+arm_width/2, arm_length-arm_width/2-4, height-2.4]) cylinder(d=5.6, h=3, $fn=20);
        translate([arm_length+(arm_width/2), arm_width/2]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
        translate([arm_length+(arm_width/2), arm_width/2, height-2.4]) cylinder(d=5.6, h=height, $fn=20);
        translate([arm_length+arm_width/2, arm_length-arm_width/2-4]) cube([7,7,height], center=true);
    }
    
}

module view_proper() {
    // attached
    translate([0,0,height]) rotate([180,0,0]) center();
    arm();
    corner_arm();
    edge_arm();
}

module view_parts() {
    // printable orientation. Print:
    // 1x center
    // 4x arm
    // 4x corner_arm
    // 4x edge_arm
    // 4x edge_arm mirrored
    center();
    translate([-50,-50]) arm();
    translate([-60,-70]) rotate([0,0,315]) corner_arm();
    translate([60,10, height]) rotate([0,180,90]) edge_arm();
}

//view_proper();
view_parts();