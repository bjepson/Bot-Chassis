containerHeight = 34;

padding = 0;
batteryBoxWidth = 30 + padding;
batteryBoxLength = 62 + padding;

thickness = 2.5;
containerWidth = batteryBoxWidth + thickness * 2;
echo(containerWidth);
containerLength = batteryBoxLength + thickness * 2;
echo(containerLength);
holeDiameter = 4;

tslotHeight = 12;
tslotNutWidth = 6;
tslotNutHeight = 4;

translate([-containerWidth/2, -containerLength/2, 0])
difference() {
	cube([containerWidth, containerLength, containerHeight]);
	translate([thickness,thickness,thickness])
	cube([batteryBoxWidth, batteryBoxLength, containerHeight]);

	// Swiss cheesing
    for (i = [containerWidth/2 - 10, containerWidth/2, containerWidth/2 + 10]) {
      for (j = [containerLength/2 - 10, containerLength/2, containerLength/2 + 10]) {
         translate([i, j, thickness/-2])
           #cylinder(r=holeDiameter/2, h=thickness*2);
      } 
    }

	// t-slots
	for (i = [-thickness/2, containerLength - thickness*1.5]) {
		translate([containerWidth/2 - holeDiameter/2, i, containerHeight-tslotHeight])
			#cube([holeDiameter, thickness*2, tslotHeight]);
		translate([containerWidth/2 - holeDiameter, i, containerHeight-tslotHeight])
			#cube([holeDiameter*2, thickness*2, tslotNutHeight]);
	}

}