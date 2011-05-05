
thickness=6;
diameter = 64;
servoGripDiameter = 4.5;
servoGripDepth = 3;
screwHoleDiameter = 3;

difference() {
	cylinder(r=diameter/2, h=thickness);

	// Hole to grip the servo
	rotate([0,0,180]) // flip over
		translate([0, 0, thickness-servoGripDepth]) // back off the height of the hole
			#cylinder(r= (servoGripDiameter +.8)/2, h=servoGripDepth); // drill baby drill
		
	// Screw hole
	#cylinder(r=screwHoleDiameter/2, h=thickness);

}