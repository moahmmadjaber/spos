import 'package:flutter/material.dart';

class ClipperShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double h = size.height;
    double w = size.width;

    var p = Path();
    p.lineTo(0, 0);
    p.cubicTo(11 * 2 / 4, 220, 3 * 80 * 1 / 1, 25, w - 10, h - 10);
    p.lineTo(w, h);
    p.lineTo(0, h);
    p.lineTo(0, 0);
    p.close();

    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
