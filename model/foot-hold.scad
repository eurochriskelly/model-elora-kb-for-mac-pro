use <./mouse-pad-cover.scad>;

module p1(x) {
  translate([-x,-47,-8.5]) rotate([0,-4,0]) cylinder(h= 8, d=6, $fn=30, center=true);
}

module feet(x, xs) {
  difference() {
    scale([xs, 1.54, 1.2])
    translate([0, 16.5, 0.5])
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
  // translate([-2.5, 0, 0]) feet(17);
  // translate([2.5, 0, 0]) feet(17);
  translate([0,0, -1.4]) {
    feet(25.2, 1.1);
    color("blue") translate([0,-48,-20]) cube([55,10, 10], center = true);
    translate([0,80,0]) {
      feet(12.5, 1.14);
      color("red") translate([0,-50,-20]) cube([30,10, 10], center = true);
    }
  }

  union() {
    difference() {
      translate([-2, -(85/2)-8, -13.6]) cube([4, 87, 3]);
      color("green") translate([-70, -(85/2)-40, -13.6 - 3]) cube([140, 150, 3]);
    }
    *mouse_pad_cover();
  }
}
 feet_assembly();

