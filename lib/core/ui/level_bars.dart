import 'package:flutter/material.dart';

class LevelBars extends StatelessWidget {
  const LevelBars({
    super.key,
    required this.level,
    this.width = 20,
    this.height = 22,
    this.spacing = 3,

    this.inactiveColor = const Color(0xFFE8EDF1),
  });

  final CourseLevel level;
  final double width;
  final double height;
  final double spacing;
  final Color inactiveColor;

  int get activeBars {
    switch (level) {
      case CourseLevel.beginner:
        return 1;
      case CourseLevel.intermediate:
        return 2;
      case CourseLevel.advanced:
        return 3;
    }
  }

  Color get activeColor {
    switch (level) {
      case CourseLevel.advanced:
        return const Color(0xFFE52B35);
      case CourseLevel.intermediate:
        return const Color(0xFFF5A623);
      case CourseLevel.beginner:
        return const Color(0xFF2D9CDB);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _LevelBarsPainter(
        activeBars: activeBars,
        spacing: spacing,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
      ),
    );
  }
}

enum CourseLevel { beginner, intermediate, advanced }

class _LevelBarsPainter extends CustomPainter {
  const _LevelBarsPainter({
    required this.activeBars,
    required this.spacing,
    required this.activeColor,
    required this.inactiveColor,
  });

  final int activeBars;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;

  @override
  void paint(Canvas canvas, Size size) {
    const numberOfBars = 3;

    final barWidth = (size.width - spacing * (numberOfBars - 1)) / numberOfBars;

    // Heights of the three bars.
    //
    // Small → Medium → Large
    final barHeights = [size.height * 0.45, size.height * 0.70, size.height];

    for (int index = 0; index < numberOfBars; index++) {
      final isActive = index < activeBars;

      final left = index * (barWidth + spacing);

      // Align every bar to the bottom.
      final top = size.height - barHeights[index];

      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(left, top, barWidth, barHeights[index]),
        const Radius.circular(3.5),
      );

      final paint = Paint()
        ..color = isActive ? activeColor : inactiveColor
        ..style = PaintingStyle.fill;

      canvas.drawRRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _LevelBarsPainter oldDelegate) {
    return oldDelegate.activeBars != activeBars ||
        oldDelegate.spacing != spacing ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.inactiveColor != inactiveColor;
  }
}
