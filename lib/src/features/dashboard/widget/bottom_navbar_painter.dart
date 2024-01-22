import 'package:fitness_app/src/themes/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.lightGray;
    Radius topLeftRadius = const Radius.circular(12.0);
    Radius topRightRadius = const Radius.circular(12.0);
    Rect rect = Rect.fromPoints(
      const Offset(0, 0),
      Offset(size.width, size.height),
    );
    RRect rRect = RRect.fromRectAndCorners(
      rect,
      topLeft: topLeftRadius,
      topRight: topRightRadius,
    );

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
