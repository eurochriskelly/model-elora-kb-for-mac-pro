
module mouse_pad_cover() {
  translate([0, -7, -13.6 - 1.4]) {
    difference() {
      cube([170 + 8, 100 + 8, 2], center=true);
      
      translate([-0.6, -1, -1]) 
      scale([1, 0.98, 1])
      union() {
        translate([-81, 48, 0]) hex_holes(8, 1.7, 12, 7);
        translate([-74, 41, 0]) hex_holes(5, 2.72, 11, 6);
      }
    }
    support();
    scale([-1,1,1]) support();
  }
}

module hex_holes(r, sp, cols, rows) {
  for (i = [0:cols], j = [0:rows]) {
    translate([i * (r * sp), j * -(r * sp), 0])
    cylinder(h=40, d=r, $fn=6, center=true);
  }
}

module support() {
    translate([-80 - 7.5, 0, -3])
    color("red") cube([3, 100 + 8, 4], center=true);
    // translate([-80 - 2.5, 0, -4])
    translate([-40 -3.5, +52.5, -3])
    color("red") cube([45, 3, 4], center=true);

    translate([-60, -52.5, -3])
    color("red") cube([25, 3, 4], center=true);

    translate([-71.5, -55.5, -6.5])
    color("blue") cube([35, 3, 15], center=true);
}
