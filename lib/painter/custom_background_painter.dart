import 'package:flutter/material.dart';

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()

      ..color = Colors.black.withOpacity(0.05)
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double spacing = 20.0;

    double start = -size.height;
    double end = size.width;

    while (start < size.width) {
      final path = Path()
        ..moveTo(start, 0)
        ..lineTo(end, start + size.height)
        ..moveTo(start + size.height, 0)
        ..lineTo(end + size.height, start + size.height);

      canvas.drawPath(path, paint);
      start += spacing;
      end += spacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}