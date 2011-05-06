holeDiameter = 4;
thickness = 4;
centerToCenter = 10;
heightToFirstHoleCenter = 7;
bracketHeight = heightToFirstHoleCenter + holeDiameter/2 + centerToCenter + holeDiameter;

difference() {
	cube ([bracketHeight,thickness*2,8,]);
	# rotate(a=[90,0,0])
		translate([heightToFirstHoleCenter, 4, -thickness])
			cylinder(r=holeDiameter/2,h=thickness*3,center=true);

	# rotate(a=[90,0,0])
		translate([heightToFirstHoleCenter+centerToCenter, 4, -thickness])
			cylinder(r=holeDiameter/2,h=thickness*3,center=true);
}

difference() {
	#cube ([thickness,23+thickness,8]);

	for (i = [11, 18]) {
		# translate([thickness/2,i + thickness,thickness])
			rotate(a=[90,0,90])
				#cylinder(r=holeDiameter/2,h=thickness*2,center=true);
	}

}
