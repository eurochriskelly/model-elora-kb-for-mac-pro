


module side() {
  //color([0.7,0.7, 1.0])
  translate([0, 0, 3]) import("./sides.stl");
  color("red") 
  translate([2.7, 12, -5])
  cube([2, 8, 20]);
  color("red") 
  translate([2, -20, -5])
  cube([2.7, 8, 20]);
}

side();
