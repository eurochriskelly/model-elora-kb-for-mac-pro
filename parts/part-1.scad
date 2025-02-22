use <../model/foot-hold.scad>;

debug = 0;

module elora() {
  //color([0.7,0.7, 1.0])
  if (debug == 1) {
    translate([6,0,3])
    rotate([0,4,0])
    import("../reference/elora.stl");
  }
}

elora();
scale ([-1,1,1]) elora();
feet_assembly();

