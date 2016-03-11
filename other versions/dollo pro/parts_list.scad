/*

Everything in this file is in CM not inches because metric is better, so get used to it.
This file will make you a cut list and parts list of everything that you need.
I will include a google drive folder that has all of the parts links on amazon

https://docs.google.com/spreadsheets/d/1-G3lTz2momu0fgvHpuDHGbcx_qaqVSa7IFPzIRnKb9Y/edit?usp=sharing

*/

printer_height					= 30;
printer_width						= 30;
printer_depth						= 30;
number_of_z_motors			= 1;
number_of_extruders			= 1;
motor_height_include_shaft	= 0;


print_height				= printer_height-.4;
print_width				= printer_width-.4;
print_depth				= printer_depth-.4;


text(str("nema 17 motors = ", number_of_z_motors+3+number_of_extruders));
translate([0,-15,0]) text(str("608 bearings = ", number_of_extruders+12));
translate([0,-15*2,0]) text(str("RJM-01-10 10 mm ID = ", 8));
translate([0,-15*3,0]) text(str("20mm T-slot aluminum = 4 at ", print_height,"cm"));
translate([0,-15*4,0]) text(str("20mm T-slot aluminum = 4 at ", print_width,"cm"));
translate([0,-15*5,0]) text(str("20mm T-slot aluminum = 4 at ", print_depth,"cm"));
translate([0,-15*6,0]) text(str("belt = 2 at ", print_depth*2,"cm"));
translate([0,-15*7,0]) text(str("belt = 1 at ", print_depth*2,"cm"));
translate([0,-15*8,0]) text(str("10mm smooth rod = 2 at ", print_width,"cm"));
translate([0,-15*9,0]) text(str("10mm smooth rod = 2 at ", print_height,"cm"));
translate([0,-15*10,0]) text(str("threaded rod =  ", print_height-motor_height_include_shaft,"cm"));
translate([0,-15*11,0]) text(str("t-nuts =  ", 12*8));
translate([0,-15*12,0]) text(str("m5x6 screws =  ", 12*10));
translate([0,-15*13,0]) text(str("m3 nuts =  ", 16));
translate([0,-15*14,0]) text(str("m3x5 screws =  ", 16*2+(number_of_extruders*4)));
translate([0,-15*15,0]) text(str("m8 bolts =  ", 12));
translate([0,-15*16,0]) text(str("m8 nuts =  ", 12*2));
translate([0,-15*17,0]) text(str("m3x60 =  ", 4*number_of_extruders));
translate([0,-15*18,0]) text(str("Aluminum GT2 Timing Belt Pulley =  ", 3*number_of_extruders));

