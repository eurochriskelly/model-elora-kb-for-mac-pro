// A side held by an m5 nut and bold and with a hole for a TRRS cable
use <../model/side.scad>;

module hole_cutter_cyl() {
  rotate([90, 0, 90])
  cylinder(h=18, d=3, center=true, $fn=24);
}

difference() {
  side(5);

  color("red")
  translate([2,-10, 10])
  hull() {
    hole_cutter_cyl();
    translate([0, 0, 5]) hole_cutter_cyl();
  }
}
