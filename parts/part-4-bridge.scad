// 
// PART-4
// A bridge from left to right

debug = 1;
elora_angle=4;
elora_angle=20;

module elora() {
  //color([0.7,0.7, 1.0])
  if (debug == 1) {
    translate([13,0,3])
    rotate([0, elora_angle, 0])
    import("../reference/elora.stl");
  }
}
module part_x(dummy) {
  if (dummy == 1) {
    color("blue")
    cube([1000,1000,1000], center=true);
  } else {
    render() difference() {
      union() {
        tz=14.3;
        dz=17;
        color("blue") translate([0, 2, tz+2]) cube([51.5, 39, 13], center=true);
        color("blue") translate([0, 50, tz]) cube([51.5, 12, dz], center=true);
        color("blue") translate([0, 21.5, tz]) cube([9, 65, dz], center=true);
      }
      handle_cable_holes();
    }
  }
}
// removals and trimmings
module part_y(dummy) {
    union() {
      translate([16, 0, 14.6])
      rotate([0,45,0])
      color("yellow") translate([0, 21.5, 15]) cube([9, 95, 7], center=true);
      scale([-1,1,1])
      translate([16, 0, 14.6])
      rotate([0,45,0])
      color("green") translate([0, 21.5, 15]) cube([9, 95, 7], center=true);

      color("red") translate([0, -10, 0]) cube([6, 2,  90], center=true);
      color("red") translate([0, 50, 0]) cube([6, 2,  90], center=true);
    }
}
module handle_cable_holes() {
  // Create subractive piece for cable holes
  drop=5;
  union() {
    color("green") translate([25, 28, drop]) cube([10, 85, 10], center=true);
    color("yellow") translate([5, -3, drop+2.8]) cube([80, 35, 15], center=true);
    scale([-1, 1, 1])
    color("red") translate([25, 28, drop]) cube([10, 85, 10], center=true);
  }
}
//color("blue") translate([0, 08, 17]) cube([35, 35, 3], center=true);
module cutter(dummy) {
  if (dummy == 1) {
    intersection() {
      part_x(1);
      part_y(1);
    }
  } else {
    difference() {
      part_x(0);
      part_y(0);
    }
  }
}

module show(dummy) {
  if (dummy == 1) {
    union() {
      elora();
      color("white") scale ([-1,1,1]) elora();
    }
  } else {
    difference() {
      cutter(0);
      union() {
        elora();
        color("white") scale ([-1,1,1]) elora();
      }
    }
  }
}

show(0);
