module fin (batteryBoxThickness, breadBoardThickness, flip) {
	thickness = 3;
	finheight = 55;
	finDepth = 40;

	componentSpacing = 6;

	holeDiameter = 4;
	clipWidth = 10;
	clipHeight = 12;


    echo (flip);
	if (flip > 0) {
		drawFin(180, (clipHeight - thickness) * -1, thickness);
    } else {
		drawFin(0, 0, 0);
	}

	module drawFin(flipValue, clipOffset, holeOffset) {
	rotate([0,flipValue,0])
	union() {
		difference() {
			intersection() { 
				translate([finDepth - finheight, finheight/7, thickness/2])
					cylinder(h=thickness, r=finheight, center=true);
				#cube([finDepth, finheight, thickness]);
			}

			translate([-15, thickness, thickness/-2])
			#cube([finDepth, batteryBoxThickness, thickness*2]);

			translate([-25, thickness + batteryBoxThickness + componentSpacing, thickness/-2])
				#cube([finDepth, breadBoardThickness, thickness*2]);
		}


		translate([finDepth - clipWidth,0, clipOffset])
		difference() {
			cube([clipWidth, thickness, clipHeight]);
			rotate([90,0,0])
				translate([clipWidth/2, clipHeight/2 + thickness/2 - holeOffset, thickness*-.5])
					#cylinder(h=thickness*2, r = holeDiameter/2, center=true);

		}	
	}
}

}