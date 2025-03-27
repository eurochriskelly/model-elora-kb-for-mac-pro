union() {
  intersection() {
    union() {
      translate([0,0,2])
      import("../parts/kb-layer-2.stl");
      rotate([0, 180, 0])
      translate([-130,0,0])
      import("../parts/kb-layer-2.stl");
    }
    color("red") translate([-20,-80,-0]) cube([170, 300, 2]);

  }
  scale([0.5, 0.5, 1]) color("blue") translate([40,-80,-0]) cube([170, 140, 2]);
}

