// this the bridg between left and right

debug = 1;

module elora() {
  //color([0.7,0.7, 1.0])
  if (debug == 1) {
    translate([13,0,3])
    rotate([0,4,0])
    import("../reference/elora.stl");
  }
}

//color("blue") translate([0, 08, 17]) cube([35, 35, 3], center=true);
module cutter() {
  difference() {
    union() {
      tz=13.8;
      dz=15;
      color("blue") translate([0, 2, tz + 4.5]) cube([47.5, 38, 6], center=true);
      color("blue") translate([0, 50, tz]) cube([47.5, 12, dz], center=true);
      color("green") translate([0, 15.5, tz]) cube([9, 65, dz], center=true);
    }
    union() {
      color("red") translate([25, 28, 10]) cube([10, 85, 10], center=true);
      scale([-1, 1, 1])
      color("red") translate([25, 28, 10]) cube([10, 85, 10], center=true);
    }
  }
}

rotate([0, 180, 0])
difference() {
  cutter();
  union() {
    elora();
    scale ([-1,1,1]) elora();
  }
}
