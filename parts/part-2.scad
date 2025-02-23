
debug = 1;

module elora() {
  //color([0.7,0.7, 1.0])
  if (debug == 1) {
    import("../reference/elora.stl");
  }
}
module sides() {
  intersection() {
    translate([0, 0, -20]) elora();
    color("blue")  translate([166.5,-10,-34]) cube([30, 40, 20]);
  }
}
// elora();
translate([-166.5, -10, 14]) sides();

