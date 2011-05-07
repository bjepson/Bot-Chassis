thickness = 3;
length = 105;
width = 80;

//servoHeight = 42.8;
//boxHeight = 31.8;
//mountHeight = (servoHeight - boxHeight)/2;
mountHeight = 6;
servoWidth = 16;
centerToCenter = 48.25;
flushOffset = 2.5;

holeDiameter = 4;

difference() {

	union() {
		intersection() {

			// Create two cones on their sides, with the thick section touching.
			//
			union() {
				translate([0,0,thickness/2]) {
					rotate([90,0,0])
						translate([0,0,length/-1.5+1])
							cylinder(r1=5, r2=width/2, h=length/1.5);
	
					rotate([270,0,0])
						translate([0,0,length/-2])
							cylinder(r1=5, r2=width*2, h=length/2);
				}
			}
	 		// Slice a layer off the cones, leaving just a flat polygon
		    	//
			translate([width/-2, length/-2, 0])
				cube([width, length, thickness]);

		}

		for (i = [0, 1]) {

			mirror([ i, 0, 0 ]) // do the same thing on each side
				union() {

					// Tapered decorative stuff on the rear
					//
					translate([width/2 - 25, length/-2, 0]) difference() 
					{
						cube([25, 12.5, thickness]); // drop in a cube
						rotate([0,0,90]) translate([-5,0,thickness/-2])
							cylinder(r=10, h=thickness*2); // carve a circular portion
					}

			}
		}
	}



	// Bracket mounts
	//
	for (l = [0, 1]) {

		mirror([ l, 0, 0 ]) // do the same thing on each side

			translate([5, mountHeight/-2 + 12.5, servoWidth/4 + thickness])
				rotate([0,90,0])
					for(i = [7]) { // TODO: add 0 here for a second mount hole
						for (j = [0, centerToCenter * -1 - 2]) { // go front to back
							translate([0, j, i])
								rotate([0, 90, 0]) translate([width/2 - 5,0,thickness])
									#cylinder(r=holeDiameter/2, h=thickness * 2);
						}
					}
	}

	// Swiss cheesing
    for (i = [0,]) {
      for (j = [-25,-15, -5]) {
         translate([i, j, thickness/-2])
           #cylinder(r=holeDiameter/2, h=thickness*2);
      } 
    }

	// FIXME - temporary hack to cut down on material used
	//
	translate([0, length/2-15, thickness/-2])
		for (i = [-10, 10]) {
			for (j = [-10, 10]) {
		         translate([i, j, 0])
	    		       #cylinder(r=holeDiameter/2, h=thickness*2);
			}
		}
	translate([-7.5,30,-thickness/2])
		#cube([15,15,thickness*2]);

	translate([-15,8,-thickness/2])
		#cube([30,12,thickness*2]);

	translate([-15,-44,-thickness/2])
		#cube([30,7.5,thickness*2]);

	translate([10,-30,-thickness/2])
		#cube([20,centerToCenter - 20,thickness*2]);
	translate([-30,-30,-thickness/2])
		#cube([20,centerToCenter - 20,thickness*2]);


}


