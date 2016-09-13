
// case size settings. work in progress. currently only smallest supported
case_size=0; //small, i.e. one extention per side
//case_size=1; //large, i.e. two extention per side

// gear math
gearOne = 39.9;
// print the rev_gear_two
gearMiddle = case_size==0 ? 35.5 : gearOne;
gearLarge = 68.4;
tip_size = 5.5;
gear_middle_hole_offset = gearOne/2 + gearMiddle/2 - tip_size;
gear_large_hole_offset = gear_middle_hole_offset + gearMiddle/2 + gearLarge/2 - tip_size;


// debug calculations about how parts fit
gearLarge_outer = 76.5;
case_side_length = (case_size==0 ? 120 : 240) + 2*30;
twist_corner_twist_depth = 3.8;
twist_corner_width = 12.3 - twist_corner_twist_depth;
case_corner_to_corner = sqrt(2*(case_side_length*case_side_length));

echo("Case values:");
echo ("side length", case_side_length);
echo ("corner to corner", case_corner_to_corner);
// room for gears
echo ("room for gears", case_corner_to_corner - 2*twist_corner_width);
// room taken by gears
echo ("room taken by gears", 2*gear_large_hole_offset + gearLarge_outer);

// supposed gear large offset
echo("optimal large gear offset", case_corner_to_corner/2 - twist_corner_width - gearLarge_outer/2);

echo("Gear offsets:");
echo("middle");
echo (gear_middle_hole_offset);
echo("large");
echo (gear_large_hole_offset);

// piece dimensions
center_width = 77;

bolt_hole_dia = 3.2;
bolt_head_hole_dia = 5.8;

height = 12;
arm_width = 11;
arm_length = 105 - arm_width;;
corner_arm_length = 153;
arm_hole_width = arm_width+0.2;
arm_hole_height = height/2;

extra_corner_offset = 4;

motor_side_length = 43;

module nut() {
    hull() {
        cylinder(d = 6.5, h=2.4, $fn=6);
        translate([0,0,2.4]) cylinder(d = 3.2, h=1.2, $fn=20);
    }
}

module elongated_nut() {
    hull() {
        translate([-2,0,0]) nut();
        translate([2,0,0]) nut();
    }
}



//translate([50,50]) nut();
//translate([50,50]) elongated_nut();
//translate([50,47.2]) cube([5.6, 5.6, 2.4]);

module gear_middle_hole(dia=3, height=height) {
    translate([gear_middle_hole_offset,0,0]) {
        hull() {
            translate([-2,0,0]) cylinder(d=dia, h=height);
            translate([2,0,0]) cylinder(d=dia, h=height);
        }
    }
}

module gear_middle_nut_hole(z=0) {
    translate([gear_middle_hole_offset,0,z]) elongated_nut();
}

module gear_large_hole(dia=3, height=height) {
    translate([gear_large_hole_offset,0,0]) {
        hull() {
            translate([-2,0,0]) cylinder(d=dia, h=height);
            translate([2,0,0]) cylinder(d=dia, h=height);
        }
    }
}

module gear_large_nut_hole(z=0) {
    translate([gear_large_hole_offset,0,z]) elongated_nut();
}

module gear_arm_holes(){
	gear_middle_hole();
	gear_large_hole();
}

module motor_holes(){
    cylinder(d=25, h=height);
    translate([43.84/2,0]) 		cylinder(d=bolt_hole_dia, h=height, $fn=20);
    translate([-43.84/2,0]) 	cylinder(d=bolt_hole_dia, h=height, $fn=20);
    translate([0,43.84/2]) 		cylinder(d=bolt_hole_dia, h=height, $fn=20);
    translate([0,-43.84/2]) 	cylinder(d=bolt_hole_dia, h=height, $fn=20);
    
    // nut indentations
    translate([43.84/2,0]) 		cylinder(d=8, h=1, $fn=20);
    translate([-43.84/2,0]) 	cylinder(d=8, h=1, $fn=20);
    translate([0,43.84/2]) 		cylinder(d=8, h=1, $fn=20);
    translate([0,-43.84/2]) 	cylinder(d=8, h=1, $fn=20);
    
}

module arm_hole() {
    cube([arm_hole_width*3, arm_hole_width, arm_hole_height]);
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

    $fn=30;
    difference() {
        cylinder(d=center_width, h=height, $fn=60);
        arm_holes();
        rotate([0,0,45]) motor_holes();
        gear_middle_hole();
        rotate([0,0,45]) gear_middle_hole();
        rotate([0,0,90]) gear_middle_hole();
        rotate([0,0,135]) gear_middle_hole();
        rotate([0,0,180]) gear_middle_hole();
        rotate([0,0,225]) gear_middle_hole();
        rotate([0,0,270]) gear_middle_hole();
        rotate([0,0,315]) gear_middle_hole();
        
        /*gear_middle_nut_hole();
        rotate([0,0,45]) gear_middle_nut_hole();
        rotate([0,0,90]) gear_middle_nut_hole();
        rotate([0,0,135]) gear_middle_nut_hole();
        rotate([0,0,180]) gear_middle_nut_hole();
        rotate([0,0,225]) gear_middle_nut_hole();
        rotate([0,0,270]) gear_middle_nut_hole();
        rotate([0,0,315]) gear_middle_nut_hole();
        */
        motor_holes();
    }
}

module arm() {
    offset_x = 15.1;
    $fn=30;
    union() {
        difference() {
            translate([offset_x, -arm_width/2, 0]) cube([arm_length-offset_x-0.1, arm_width, height]);
            translate([0, 0, arm_hole_height]) cylinder(d=center_width+0.2,h=arm_hole_height, $fn=60);
            gear_arm_holes();
            //gear_middle_hole(dia=bolt_head_hole_dia, height=2.4);
            //gear_large_hole(dia=bolt_head_hole_dia, height=2.4);
            //gear_large_nut_hole(z=height-2.4);
            translate([43.84/2,0]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
            translate([43.84/2,0]) cylinder(d=bolt_head_hole_dia, h=2.4, $fn=20);
        }
    
        difference() {
            translate([arm_length-0.1, -arm_width]) cube([arm_hole_width, 2*arm_width, arm_hole_height]);
            translate([arm_length+(arm_width/2), -arm_width/2]) cylinder(d=bolt_hole_dia, h=arm_hole_height);
            translate([arm_length+(arm_width/2), arm_width/2]) cylinder(d=bolt_hole_dia, h=arm_hole_height);
            translate([arm_length+(arm_width/2), -arm_width/2]) nut();
            translate([arm_length+(arm_width/2), arm_width/2]) nut();
        }
    }
}

module corner_arm(){
    offset_x = 15.1;
    $fn=30;
    
    corner_arm_offset = sqrt(arm_length*arm_length*2);
    edge_offset = sqrt((arm_width/2)*(arm_width/2)*2);

    union() {
        rotate([0,0,45]) {

            difference() {
                translate([offset_x, -arm_width/2, 0]) cube([corner_arm_length-offset_x, arm_width, height]);
                translate([0, 0, arm_hole_height]) cylinder(d=center_width+0.2,h=arm_hole_height, $fn=60);
                gear_arm_holes();
                //gear_middle_hole(dia=bolt_head_hole_dia, height=2.4);
                //gear_large_hole(dia=bolt_head_hole_dia, height=2.4);
                //gear_large_nut_hole(z=height-2.4);
                translate([43.84/2, 0]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
                translate([43.84/2, 0]) cylinder(d=bolt_head_hole_dia, h=2.4, $fn=20);
                translate([148, 0]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
                translate([148, 0, height-2.4]) nut();
            }
        }

        difference() {
            translate([arm_length, arm_length-arm_width-extra_corner_offset, 0]) cube([arm_width, arm_width*2, arm_hole_height]);
            translate([arm_length+arm_width/2, arm_length-arm_width/2-extra_corner_offset]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
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
        translate([arm_length, 0]) cube([arm_hole_width, arm_hole_width, arm_hole_height]);
        translate([0,-0.5,0]) corner_arm();
        translate([arm_length+arm_width/2, arm_length-arm_width/2-4]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
        translate([arm_length+arm_width/2, arm_length-arm_width/2-4, height-2.4]) cylinder(d=bolt_head_hole_dia, h=3, $fn=20);
        translate([arm_length+(arm_width/2), arm_width/2]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
        translate([arm_length+(arm_width/2), arm_width/2, height-2.4]) cylinder(d=bolt_head_hole_dia, h=height, $fn=20);
        translate([arm_length+arm_width/2, arm_length-arm_width/2-4]) cube([7,7,height], center=true);
    }
    
}

module center_motor() {
    outer_length = motor_side_length + 2*arm_width + 2;
    $fn=30;
    difference() {
        union() {
            translate([0, 0, height/4]) cube([outer_length, outer_length, height/2], center=true);
            translate([outer_length/2, 0, height/4]) cube([10, 15, height/2], center=true);
            rotate([0,0,90]) translate([outer_length/2, 0, height/4]) cube([10, 15, height/2], center=true);
            rotate([0,0,180]) translate([outer_length/2, 0, height/4]) cube([10, 15, height/2], center=true);
            rotate([0,0,270]) translate([outer_length/2, 0, height/4]) cube([10, 15, height/2], center=true);
        }
        translate([0, 0, height/4]) cube([motor_side_length+2, motor_side_length+2, height/2], center=true);
        
        //holes
        translate([outer_length/2 - arm_width/2, 0, height/1.6]) cube([arm_hole_width+10, arm_hole_width,5], center=true);
        gear_middle_hole();
        gear_middle_nut_hole();
        
        rotate([0,0,90]) translate([outer_length/2 - arm_width/2, 0, height/1.6]) cube([arm_hole_width+10, arm_hole_width,5], center=true);
        rotate([0,0,90]) gear_middle_hole();
        rotate([0,0,90]) gear_middle_nut_hole();
        
        rotate([0,0,180]) translate([outer_length/2 - arm_width/2, 0, height/1.6]) cube([arm_hole_width+10, arm_hole_width,5], center=true);
        rotate([0,0,180]) gear_middle_hole();
        rotate([0,0,180]) gear_middle_nut_hole();

        rotate([0,0,270]) translate([outer_length/2 - arm_width/2, 0, height/1.6]) cube([arm_hole_width+10, arm_hole_width,5], center=true);
        rotate([0,0,270]) gear_middle_hole();
        rotate([0,0,270]) gear_middle_nut_hole();
    }
}

module motor_arm() {
    offset_x = motor_side_length/2 + 1;
    outer_length = motor_side_length + 2*arm_width + 2;
    $fn=30;
    difference() {
        translate([offset_x, -arm_width/2, 0]) cube([arm_length-offset_x-0.1, arm_width, height/2]);
        gear_middle_hole();
        translate([0,0,height/2-0.4]) gear_middle_hole(dia=bolt_head_hole_dia, height=2.5);
        
        gear_large_hole(dia=bolt_hole_dia, height=height);
        translate([0,0,height/2-0.4]) gear_large_hole(dia=bolt_head_hole_dia, height=2.5);
        gear_large_nut_hole(z=0);
        //gear_large_nut_hole(z=height-2.4);
        //translate([outer_length/2 - arm_width/2, 0, 0]) cylinder(d=bolt_hole_dia, h=height, $fn=20);
        //translate([outer_length/2 - arm_width/2, 0, height/2-2.4]) nut();
    }
}

module boltholder(h=10) {
    difference() {
        translate([0,1.4,0]) cube([arm_hole_width+4.2, height+0.6+6.8, h], center=true);
        cube([arm_hole_width+0.2, height+0.6, h], center=true);
        translate([0,10,h/2 - 5]) rotate([90,0,0]) cylinder(d=bolt_hole_dia, h=30, $fn=30);
        translate([0, height/2+0.6+2+1.5, 0]) cube([5.65, 3, h], center=true);
    }
}

module boltholder_center() {
    difference() {
        translate([0, 0, 12]) boltholder(h=16);
        translate([0, 0, 12]) cube([arm_hole_width+6, height+0.6, 16], center=true);
    }
    difference() {
        translate([0,1.4,0]) cube([arm_hole_width+4.2, height+0.6+6.8, 10], center=true);
        cube([arm_hole_width+0.2, height+0.6, 10], center=true);
    }
}


module view_proper() {
    // attached
    translate([0,0,height]) rotate([180,0,0]) center();
    arm();
    corner_arm();
    edge_arm();
    
    translate([0,0,30]) center_motor();
    translate([0,0,35]) motor_arm();
    translate([150, 50]) boltholder();
    translate([150, 30]) boltholder_center();
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
    translate([60,-205, height]) mirror([0,1,0]) rotate([0,180,90]) edge_arm();
    translate([center_width+5,0,0]) center_motor();
    translate([-40,-120,0]) motor_arm();
    translate([70, -100]) boltholder();
    translate([90, -100]) boltholder_center();
    
}

//view_proper();
view_parts();