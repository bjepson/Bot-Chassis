containerHeight = 23;

padding = 0;
batteryBoxWidth = 65 + padding;
batteryBoxLength = 71 + padding;

thickness = 3;
containerWidth = batteryBoxWidth + thickness * 2;
echo(containerWidth);
containerLength = batteryBoxLength + thickness * 2;
echo(containerLength);
holeDiameter = 4;

screwLength = 16;
tslotHeight = screwLength - thickness;
tslotNutWidth = 5;
tslotNutHeight = 3;

translate([-containerWidth/2, -containerLength/2, 0])
difference() {
	cube([containerWidth, containerLength, containerHeight]);
	translate([thickness,thickness,thickness])
	cube([batteryBoxWidth, batteryBoxLength, containerHeight]);

	// Swiss cheesing
    for (i = [containerWidth/2]) {
    //for (i = [containerWidth/2 - 10, containerWidth/2, containerWidth/2 + 10]) {
      for (j = [containerLength/2 - 10, containerLength/2, containerLength/2 + 10]) {
         translate([i, j, thickness/-2])
           #cylinder(r=holeDiameter/2, h=thickness*2);
      } 
    }

	// t-slots

	//for (i = [-thickness/2, containerWidth - thickness*1.5]) {
	//	for (j = [holeDiameter, containerLength - holeDiameter *2 - thickness * 2]) {
	//		translate([i, j + thickness, containerHeight-tslotHeight])
	//			#cube([thickness*2, holeDiameter, tslotHeight]);
	//		translate([i, j - holeDiameter/2 + thickness, containerHeight-tslotHeight])
	//			#cube([thickness*2, holeDiameter*2, tslotNutHeight]);
	//	}
	//}

}