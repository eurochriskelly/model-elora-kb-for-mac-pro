module p3_side(extend) {
  translate([2.7, 9, -5])
  union() {
    difference() {
      difference() {
        cube([4, 11, 14 + extend]);
        rotate([0, 0, -60])
        scale([1,1,2])
        translate([0,0,-3])
        cube([4, 8, 24 + extend]);
      }
      translate([0, -4, 14 + extend])
      rotate([0, 25, 0])
      cube([8, 18, 4]);
    }
  }
}

module side(extend) {
  if (extend > 0) {
   union() {
     translate([0, 0, 3]) import("../ready/sides.stl");
     translate([0, 0, 3 + extend]) import("../ready/sides.stl");
   }
  } else {
    translate([0, 0, 3]) import("../ready/sides.stl");
  }
  p3_side(extend);
  scale([1, -1, 1]) p3_side(extend);
}

side(10);
