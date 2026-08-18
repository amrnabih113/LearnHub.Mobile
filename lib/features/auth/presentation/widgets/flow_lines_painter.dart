import 'package:flutter/material.dart';
import '../../../../core/utils/my_colors.dart';

class FlowLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7
      ..color = MyColors.blue.withValues(alpha: 0.35);

    for (int i = 0; i < 5; i++) {
      final path = Path();

      final y = size.height - 110 + (i * 18);

      path.moveTo(-80, y + 50);

      path.cubicTo(
        size.width * 0.25,
        y - 20,
        size.width * 0.55,
        y + 60,
        size.width * 0.95,
        y - 20,
      );

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
