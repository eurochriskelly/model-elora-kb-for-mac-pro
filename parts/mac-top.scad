d = -4;

module cyls(x, y) {
  union() {
    color("green") translate([31.9, -26, d]) cylinder(h=x, d=y, center=true, $fn=24);
    color("red") translate([75.3, -8, d])  cylinder(h=x, d=y, center=true, $fn=24);
    color("red") translate([119.4, -10, d]) cylinder(h=x, d=y, center=true, $fn=24);
    color("red") translate([142, 0.3, d]) cylinder(h=x, d=y, center=true, $fn=24);
    color("red") translate([142, 57.5, d]) cylinder(h=x, d=y, center=true, $fn=24);
    color("red") translate([62.5, 70, d])  cylinder(h=x, d=y, center=true, $fn=24);
    // before
    // color("green") translate([31.8, -26, d]) cylinder(h=x, d=y, center=true, $fn=24);
    // color("red") translate([75.3, -8, d])  cylinder(h=x, d=y, center=true, $fn=24);
    // color("red") translate([119.4, -10, d]) cylinder(h=x, d=y, center=true, $fn=24);
    // color("red") translate([142, 0.3, d]) cylinder(h=x, d=y, center=true, $fn=24);
    // color("red") translate([142, 57.5, d]) cylinder(h=x, d=y, center=true, $fn=24);
    // color("red") translate([62.5, 70, d])  cylinder(h=x, d=y, center=true, $fn=24);
  }
}
module wider_cyls() {
  color("green") cyls(78, 15);
}
module wide_cyls() {
  cyls(68, 9.4);
}
module narrow_cyls() {
  cyls(78, 6);
}
module side() {
  rotate([0,180,0])
  translate([-200, -200, 0])
  import("../reference/cover-right.stl");
}
module base() {
  translate([-46, -28,7])
  import("../reference/elora.stl");
}

module holes_in() {
  translate([-64, -24, 17])
  cyls(68, 10.1);
}
module holes() {
  translate([-46, -28, 17])
  difference() {
    wide_cyls();
    narrow_cyls();
  }
}
module holes_out() {
  translate([-46, -28, 17])
  color("green") difference() {
    wider_cyls();
    wide_cyls();
  }
}

module hex_grid(side=10, thickness=2, rows=5, cols=5, col_spacing=0, row_spacing=0) {
    h_spacing = 1.5 * side + col_spacing;
    v_spacing = sqrt(3) * side + row_spacing;

    for (r = [0 : rows - 1]) {
        for (c = [0 : cols - 1]) {
            x_offset = c * h_spacing + (r % 2 == 1 ? h_spacing / 2 : 0) + (r * 0.195);
            y_offset = r * v_spacing * 0.5;

            translate([x_offset, y_offset, 0]) rotate([0, 0, 90])
                hexagon_prism(side, thickness);
        }
    }
}
module hexagon_prism(s, h) {
    linear_extrude(height = h)
        offset(r = 0.01) 
            polygon(points = [
                for (i = [0 : 5])
                    [s * cos(i * 60), s * sin(i * 60)]
            ]);
}

module causeway(s) {
  translate([-48, -32, -20])
  color("green") hex_grid(side=s, thickness=80, rows=7, cols=9, col_spacing=(5.208*2), row_spacing=(10.28*2));
  translate([-44.34, -38.5, -20])
  color("green") hex_grid(side=s, thickness=80, rows=7, cols=9, col_spacing=(5.208*2), row_spacing=(10.28*2));
  translate([-52, -38.5, -20])
  color("green") hex_grid(side=s, thickness=80, rows=7, cols=9, col_spacing=(5.208*2), row_spacing=(10.28*2));
}

module my_hull() {
  hull() {
    rotate([0, 0, 5]) translate([-55, -49, 0]) color("green") cube([20, 20, 2]);
    rotate([0, 0, 0]) translate([-50, 0, 0]) color("green") cube([20, 20, 2]);
    rotate([0, 0, 0]) translate([-18, 34, 0]) color("green") cube([20, 20, 2]);
    rotate([0, 0, 0]) translate([70, 24, 0]) color("green") cube([20, 20, 2]);
    rotate([0, 0, 0]) translate([70, -34, 0]) color("green") cube([20, 20, 2]);
  }
}

debug=0;
if (debug == 1) {
  difference() {
    side();
    narrow_cyls();
  }

  intersection() {
    color("blue") hull() {
      holes();
    }
    import("../reference/elora.stl");
  }
}

module rest() {
  s=3.18;
  dd=10;
  //side();
  difference() {
    union() {
      translate([-40.55, -31.94, -2])
      color("blue") hex_grid(side=s, thickness=3, rows=6, cols=7, col_spacing=(5.208*2), row_spacing=(10.28*2));
      union() {
        color("red") my_hull();
        translate([-18, 4, 0])
        intersection(){
          my_hull();
           color("blue") holes_out();
        }
      }
    }
    holes_in();
  }
}

module protruding() {
  s=3.18;
  dd=10;
  translate([-17, 4, dd]) union() {
    difference() {
      difference() { 
        scale([0.99, 1, 1]) translate([0.2,0,0]) rotate([0,9,0]) holes();
        translate([0,0,-(dd - 2)]) color("blue") translate([-30,-70,-102]) cube([140, 120,100]);
      }
      color("green") rotate([0, 15, 0]) translate([-30,-70,18]) cube([140, 120,100]);
    }
    rotate([0,5,0])
    import("../parts/kb-plate-right.stl");
  }
  // translate([-18, 4, 2.4]) scale([1, 1, 0.014])       color("blue") holes_out();
}

//rest();
*difference() {
  translate([0,0,25.6]) rotate([0, 170.7, 0]) protruding();
  translate([-90,-90,-10]) color("blue") cube([180, 180, 10]);
}
protruding();

/*
*intersection() {
  hull() {
    scale([1,1,1.05])
    translate([0,0,12]) rotate([0,9,0]) intersection() {
      base();
      holes();
    }
  };
  translate([0,0,12]) rotate([0,9,0]) base();
}
*/
