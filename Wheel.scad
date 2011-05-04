
thickness=4;
diameter = 20;
servoGripDiameter = 4.75;
screwHoleDiameter = 2.5;

difference() {
	cylinder(r=diameter/2, h=thickness);
	translate([0,0,thickness/2])
		cylinder(r= (servoGripDiameter +.8)/2, h=thickness + 1);
	translate([0,0,thickness/-1])
		#cylinder(r=screwHoleDiameter/2, h=thickness * 3);

}