holeDiameter = 4;
thickness = 4;

difference() {
	cube ([20,thickness,8,]);
	# rotate(a=[90,0,0])
		translate([7, 4, -thickness/2])
			cylinder(r=holeDiameter/2,h=thickness*2,center=true);

	# rotate(a=[90,0,0])
		translate([15, 4, -thickness/2])
			cylinder(r=holeDiameter/2,h=thickness*2,center=true);
}

difference() {
	cube ([thickness,23,8]);

	for (i = [11, 18]) {
		# translate([thickness/2,i,thickness])
			rotate(a=[90,0,90])
				#cylinder(r=holeDiameter/2,h=thickness*2,center=true);
	}

}
