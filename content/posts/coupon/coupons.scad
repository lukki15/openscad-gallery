/*
 * Gift Coupons - A parametric OpenSCAD design for laser cut coupons
 * Copyright (C) 2024 lukki15
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

$fn = $preview ? 32 : 128;
goldenRatio = (1 + sqrt(5)) / 2;
w = 4;
ripOffRation = 2 / 3;
h = w * ripOffRation / goldenRatio;
cornerCircles = h / 3;
decorationCircles = h / 24;

module mirrorCopy(c) {
  children();
  mirror(c) children();
}

module dividerDots() {
  count = 12;
  space = (h - (decorationCircles * (count + 1))) / (count + 1);
  translate([0, -h / 2])for (i = [1:count]) {
    translate([0, i * (decorationCircles + space), 0])
      circle(d=decorationCircles);
  }
}

module base() {
  difference() {
    square([w, h], true);

    mirrorCopy([0, 1, 0])
      mirrorCopy([1, 0, 0])
        translate([w / 2, h / 2])
          circle(d=cornerCircles);

    translate([w * ripOffRation - w / 2, 0])
      mirrorCopy([0, 1, 0])
        translate([0, h / 2])
          circle(d=decorationCircles);
  }
}

module cutout() {
  difference() {
    base();

    mirrorCopy([1, 0, 0])
      translate([w / 2, 0])
        dividerDots();
  }
}

module outline(outer, inner) {
  difference() {
    offset(r=outer)
      children();
    offset(r=inner)
      children();
  }
}

module multiLineText(size, line1, line2) {
  font = "DejaVu Sans:style=Bold";
  space = 0.05;
  translate([0, size / 2 + space])
    text(line1, size=size, halign="center", valign="center", font=font);
  translate([0, -size / 2 - space])
    text(line2, size=size, halign="center", valign="center", font=font);
}

module engraveOutlines() {
  translate([w * ripOffRation - w / 2, 0])
    dividerDots();

  outline(-decorationCircles, -decorationCircles * 2)
    difference() {
      base();

      translate([w * ripOffRation - w / 2, 0])
        square([decorationCircles * 2, h], true);
    }
}

module engraveText(line1, line2, size) {
  translate([w * (ripOffRation + (1 - ripOffRation) / 2) - w / 2, 0])
    rotate([0, 0, 90])
      multiLineText(0.18, "USE ANY", "TIME");

  translate([w * (ripOffRation / 2) - w / 2, 0])
    multiLineText(size, line1, line2);
}

module coupon(line1, line2, size = 0.4) {
  #cutout();
  engraveOutlines();
  engraveText(line1, line2, size);
}

scale([20, 20])
  union() {
    coupon("MOVIE", "NIGHT");

    translate([0, h + 0.15])
      coupon("COUPLE", "MASSAGE", 0.29);

    translate([0, 2 * (h + 0.15)])
      coupon("DINNER", "NIGHT", 0.34);
  }
