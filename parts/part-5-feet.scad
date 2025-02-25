// 
// PART-5: 
// Feet to increase height at center

debug = 1;

module elora() {
  //color([0.7,0.7, 1.0])
  if (debug == 1) {
    translate([13,0,3])
    rotate([0,4,0])
    import("../reference/elora.stl");
  }
}
module side() {
  translate([0.6, 65.3, 0])
  union() {
    color("blue")
    rotate([180, 0, 0])
    rotate([0, 180, 0])
    translate([-6.28, 33, -11])
    import("../ready/sides-plus-5.stl");
    
  }
}

module handle_cable_holes() {
  // Create subractive piece for cable holes
  drop=7;
  union() {
    color("red") translate([25, 28, drop]) cube([10, 85, 10], center=true);
    color("yellow") translate([5, -3, drop+0.5]) cube([80, 35, 15], center=true);
    scale([-1, 1, 1])
    color("red") translate([25, 28, drop]) cube([10, 85, 10], center=true);
  }
}

//color("blue") translate([0, 08, 17]) cube([35, 35, 3], center=true);
module cutter() {
  difference() {
    difference() {
      union() {
        tz=14.3;
        dz=16;
        color("blue") translate([0, 2, tz]) cube([49.5, 39, 16], center=true);
        color("blue") translate([0, 50, tz]) cube([49.5, 12, dz], center=true);
        color("green") translate([0, 21.5, tz]) cube([9, 65, dz], center=true);
      }
      handle_cable_holes();
    }
    union() {
      translate([16, 0, 14.6])
      rotate([0,45,0])
      color("green") translate([0, 21.5, 15]) cube([9, 95, 9], center=true);
      scale([-1,1,1])
      translate([16, 0, 14.6])
      rotate([0,45,0])
      color("green") translate([0, 21.5, 15]) cube([9, 95, 9], center=true);
    }
  }
}

module rotated_feet() {
  translate([13,0,3])
  rotate([0,4,0])
  union() {
    *%import("../reference/elora.stl");
    side();
    translate([16.1,-32.1,0])
    rotate([0, 0, 45])
    translate([-15,-40,0])
    side();
  }
}

module base() {
  translate([4, -36, -16])
  union() {
    translate([25, -15, 0])
    cylinder(h = 12, d = 40, $fn = 100, center = true);
    translate([9, 74, 0])
    cylinder(h = 12, d = 40, $fn = 100, center = true);
  }
}

*difference() {
  // cutter();
  union() {
    elora();
    scale ([-1,1,1]) elora();
  }
}
*rotated_feet();
*scale([-1,1,1]) rotated_feet();

#difference() {
  difference() {
    hull() {
      base();
      scale([-1, 1, 1]) base();
    }
    color("red")
    union() {
      translate([0,0,-10]) cube([39, 65, 44], center=true);
      hull() {
        intersection() {
          color("red")
          translate([0,-50,-10]) cube([100, 50, 10], center=true);
          union() {
            rotated_feet();
            scale([-1,1,1]) rotated_feet();
          }
        }
      }
      hull() {
        intersection() {
          color("red")
          translate([0,30,-10]) cube([100, 50, 10], center=true);
          union() {
            rotated_feet();
            scale([-1,1,1]) rotated_feet();
          }
        }
      }
    }
  }
}
