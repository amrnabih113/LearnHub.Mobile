import 'dart:math' as MathHelper;

import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.size = 18,
    this.spacing = 2,
    this.activeColor = const Color(0xFFFFB52E),
    this.inactiveColor = const Color(0xFFE1E7EB),
  });

  final double rating;
  final double size;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    // Keep rating between 0 and 5.
    final value = rating.clamp(0.0, 5.0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1;

        // How much of this particular star should be filled.
        //
        // rating = 4.7
        //
        // star 1 -> 1.0
        // star 2 -> 1.0
        // star 3 -> 1.0
        // star 4 -> 1.0
        // star 5 -> 0.7
        final fill = (value - (starValue - 1)).clamp(0.0, 1.0);

        return Padding(
          padding: EdgeInsets.only(right: index == 4 ? 0 : spacing),
          child: CustomPaint(
            size: Size.square(size),
            painter: _StarPainter(
              fill: fill,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
            ),
          ),
        );
      }),
    );
  }
}

class _StarPainter extends CustomPainter {
  const _StarPainter({
    required this.fill,
    required this.activeColor,
    required this.inactiveColor,
  });

  final double fill;
  final Color activeColor;
  final Color inactiveColor;

  @override
  void paint(Canvas canvas, Size size) {
    final starPath = _createStarPath(size);

    // ------------------------------------------------------------
    // Draw empty star
    // ------------------------------------------------------------
    final inactivePaint = Paint()
      ..color = inactiveColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(starPath, inactivePaint);

    // ------------------------------------------------------------
    // Draw only the required percentage of the star
    // ------------------------------------------------------------
    if (fill <= 0) {
      return;
    }

    final activePaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.fill;

    canvas.save();

    // Clip horizontally according to the fractional value.
    //
    // fill = 0.7
    // ┌──────────────┐
    // │█████████░░░░░│
    // └──────────────┘
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width * fill, size.height));

    canvas.drawPath(starPath, activePaint);

    canvas.restore();
  }

  Path _createStarPath(Size size) {
    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);

    final outerRadius = size.width / 2;

    // Slightly smaller inner radius gives a nice star shape.
    final innerRadius = outerRadius * 0.42;

    // Start at the top.
    const startAngle = -90.0;

    for (int i = 0; i < 10; i++) {
      final angle = (startAngle + i * 36) * 3.141592653589793 / 180;

      final radius = i.isEven ? outerRadius : innerRadius;

      final point = Offset(
        center.dx + radius * _cos(angle),
        center.dy + radius * _sin(angle),
      );

      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    path.close();

    return path;
  }

  double _cos(double angle) {
    return MathHelper.cos(angle);
  }

  double _sin(double angle) {
    return MathHelper.sin(angle);
  }

  @override
  bool shouldRepaint(covariant _StarPainter oldDelegate) {
    return oldDelegate.fill != fill ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.inactiveColor != inactiveColor;
  }
}

