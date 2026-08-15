import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_images.dart';

class WebLoginSideBar extends StatelessWidget {
  const WebLoginSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // BACKGROUND
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF082F49), MyColors.navy],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // CIRCLES
          Positioned(
            top: -180,
            right: -150,
            child: _DecorativeCircle(
              size: 420,
              color: MyColors.blue,
              opacity: 0.28,
            ),
          ),

          Positioned(
            bottom: -220,
            left: -190,
            child: _DecorativeCircle(
              size: 430,
              color: MyColors.blue,
              opacity: 0.25,
            ),
          ),

          // DOT GRID
          Positioned(
            top: 100,
            right: 45,
            child: _DotGrid(
              rows: 5,
              columns: 6,
              spacing: 18,
              color: MyColors.blue,
              opacity: 0.55,
            ),
          ),

          // DOT GRID
          Positioned(
            bottom: 115,
            left: 45,
            child: _DotGrid(
              rows: 5,
              columns: 6,
              spacing: 18,
              color: MyColors.blue,
              opacity: 0.45,
            ),
          ),

          // FLOWING LINES
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(painter: _FlowLinesPainter()),
            ),
          ),

          // LOGO
          Positioned(
            top: 50,
            left: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  MyImages.appLogoDark,
                  width: context.iconLg,
                  height: context.iconLg,
                ),
                SizedBox(width: context.gap(10)),
                RichText(
                  text: TextSpan(
                    text: 'Learn',
                    style: context.titleMedium.copyWith(
                      color: MyColors.textPrimaryDark,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Hub',
                        style: context.titleMedium.copyWith(
                          color: MyColors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // HERO TEXT
          Positioned(
            top: 250,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Learn.',
                  style: context.displayLarge.copyWith(
                    color: MyColors.textPrimaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Build.',
                  style: context.displayLarge.copyWith(
                    color: MyColors.textPrimaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Grow.',
                  style: context.displayLarge.copyWith(
                    color: MyColors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: context.gap(20)),
                SizedBox(
                  width: context.screenWidth * 0.2,
                  child: Text(
                    'Join 25,000+ learners building real skills on LearnHub.',
                    style: context.titleMedium.copyWith(
                      color: MyColors.textSecondaryDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;

  const _DecorativeCircle({
    required this.size,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 1),
        ),
      ),
    );
  }
}

// ==========================================================================
// DOT GRID
// ==========================================================================

class _DotGrid extends StatelessWidget {
  final int rows;
  final int columns;
  final double spacing;
  final Color color;
  final double opacity;

  const _DotGrid({
    required this.rows,
    required this.columns,
    required this.spacing,
    required this.color,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          rows,
          (_) => Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              columns,
              (_) => Padding(
                padding: EdgeInsets.all(spacing / 2),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================================================
// FLOWING LINES
// ==========================================================================

class _FlowLinesPainter extends CustomPainter {
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
