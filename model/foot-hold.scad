
module p1(x) {
  color("red") translate([-x,-47,-10]) rotate([0,-4,0]) cylinder(h= 5, d=6, $fn=30, center=true);
}

module feet(x) {

  difference() {
    color("red")
    scale([1.043, 1.3, 1])
    translate([0, 10.85, -1])
    hull() {
      p1(x);
      scale([-1, 1, 1]) p1(x);
    }

    hull() {
      p1(x);
      scale([-1, 1, 1]) p1(x);
    }
  }
}

module feet_assembly() {
  //translate([-18,-53,-24]) cube([36,10,12]);
  // %color("red") translate([-16,-47,3]) rotate([0,-4,0]) cylinder(h= 30, d=3, $fn=30, center=true);
  feet(15);
  translate([0,80,0]) feet(6);

  difference() {
    translate([-2, -(85/2)-8, -13.6]) cube([4, 87, 3]);
    color("green") translate([-70, -(85/2)-40, -13.6 - 3]) cube([140, 150, 3]);
  }
}
