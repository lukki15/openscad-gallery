---
title: "Gift Coupons"
date: 2024-09-10
draft: false
tags: ["laser-engrave", "laser-cut"]
---

Create personalized gift coupons that can be laser cut and engraved. The design features a classic coupon style with a perforated tear-off section and decorative elements.

## Design Details
The coupons are designed with:

- A golden ratio-based rectangular shape
- Rounded corners for a softer look
- A perforated tear-off section marked by small circles
- Two text sections - one for the main message and one for "USE ANY TIME"
- Decorative border elements

## Technical Implementation
The OpenSCAD code generates two distinct outputs:

- Cutting lines - for the outer shape and perforation dots
- Engraving paths - for the text and decorative elements

The design is parameterized, allowing you to:

- Adjust the overall size (currently scaled to 20mm)
- Customize the text content and size
- Modify the ratio of the tear-off section (currently 2/3)

## Sample Coupons
The example includes three different coupons:
- Movie Night
- Couple Massage
- Dinner Night

Each coupon's text size is optimized for readability while maintaining the overall aesthetic.

## Usage
To use these files with your laser cutter:

1. Export the OpenSCAD file to SVG
1. Use different colors/layers for the cutting and engraving paths
1. Configure your laser cutter settings accordingly:
    - Red lines (#FF0000) for cutting
    - Black elements (#000000) for engraving

These coupons make perfect personalized gifts for special occasions like anniversaries, birthdays, or Valentine's Day.

{{< highlight openscad "linenos=true" >}}
{{< include "posts/coupon/coupons.scad" >}}
{{< /highlight >}}

