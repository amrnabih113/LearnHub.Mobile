import 'package:flutter/material.dart';
import 'package:learnhub/core/ui/app_logo.dart';
import 'package:learnhub/features/auth/presentation/widgets/decorative_circle.dart';
import 'package:learnhub/features/auth/presentation/widgets/dot_grid.dart';
import 'package:learnhub/features/auth/presentation/widgets/flow_lines_painter.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';

class WebAuthSideDecoration extends StatelessWidget {
  const WebAuthSideDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = MyColors.isDark(context);
    return Expanded(
      flex: 1,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // BACKGROUND
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [MyColors.navy, MyColors.backgroundDark]
                      : [MyColors.textPrimaryLight, MyColors.textPrimaryLight],
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
            child: DecorativeCircle(
              size: 420,
              color: MyColors.blue,
              opacity: 0.28,
            ),
          ),

          Positioned(
            bottom: -220,
            left: -190,
            child: DecorativeCircle(
              size: 430,
              color: MyColors.blue,
              opacity: 0.25,
            ),
          ),

          // DOT GRID
          Positioned(
            top: 100,
            right: 45,
            child: DotGrid(
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
            child: DotGrid(
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
              child: CustomPaint(painter: FlowLinesPainter()),
            ),
          ),

          // LOGO
          Positioned(top: 50, left: 50, child: AppLogo()),

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
