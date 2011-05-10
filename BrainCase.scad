containerHeight = 20;

padding = 0;
batteryBoxWidth = 67.5 + padding;
batteryBoxLength = 73.5 + padding;

baseThickness = 1.5;
wallThickness = 3;

containerWidth = batteryBoxWidth + wallThickness * 2;
echo(containerWidth);
containerLength = batteryBoxLength + wallThickness * 2;
echo(containerLength);
holeDiameter = 4;

screwLength = 16;
tslotHeight = screwLength - wallThickness;
tslotNutWidth = 5;
tslotNutHeight = 3;

translate([-containerWidth/2, -containerLength/2, 0])
difference() {
	cube([containerWidth, containerLength, containerHeight]);
	translate([wallThickness,wallThickness,baseThickness])
	#cube([batteryBoxWidth, batteryBoxLength, containerHeight]);

	// Swiss cheesing
    for (i = [containerWidth/2]) {
    //for (i = [containerWidth/2 - 10, containerWidth/2, containerWidth/2 + 10]) {
      for (j = [containerLength/2 - 10, containerLength/2, containerLength/2 + 10]) {
         translate([i, j, baseThickness/-2])
           #cylinder(r=holeDiameter/2, h=baseThickness*2);
      } 
    }

	// t-slots

	//for (i = [-wallThickness/2, containerWidth - wallThickness*1.5]) {
	//	for (j = [holeDiameter, containerLength - holeDiameter *2 - wallThickness * 2]) {
	//		translate([i, j + wallThickness, containerHeight-tslotHeight])
	//			#cube([wallThickness*2, holeDiameter, tslotHeight]);
	//		translate([i, j - holeDiameter/2 + wallThickness, containerHeight-tslotHeight])
	//			#cube([wallThickness*2, holeDiameter*2, tslotNutHeight]);
	//  	}
	//}

}