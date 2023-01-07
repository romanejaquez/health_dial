import 'package:flutter/material.dart';

class DialDrawer extends CustomPainter {

  final double startAngle;
  Color color;
  bool selected = false;

  DialDrawer({ super.repaint, required this.startAngle, required this.color, required this.selected });

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
    ..color = selected ? color : Colors.white.withOpacity(0.2)
    ..strokeWidth = 120
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

    canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      startAngle, 0.75, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}