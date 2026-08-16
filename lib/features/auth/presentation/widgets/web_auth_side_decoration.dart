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
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [MyColors.navy, MyColors.backgroundDark]
                      : [MyColors.navy, MyColors.navy],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // DECORATIVE CIRCLES
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
              opacity: 0.20,
            ),
          ),

          // DOT GRIDS
          Positioned(
            top: 100,
            right: 45,
            child: DotGrid(
              rows: 5,
              columns: 6,
              spacing: 18,
              color: MyColors.blue,
              opacity: 0.45,
            ),
          ),

          Positioned(
            bottom: 115,
            left: 45,
            child: DotGrid(
              rows: 5,
              columns: 6,
              spacing: 18,
              color: MyColors.blue,
              opacity: 0.35,
            ),
          ),

          // FLOWING LINES
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(painter: FlowLinesPainter()),
            ),
          ),

          // LOGO
          Positioned(
            top: context.gap(30),
            left: context.gap(30),
            child: AppLogo(),
          ),

          // HERO CONTENT
          // Centered vertically in the side panel
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.gap(50),
                vertical: context.gap(100),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Learn.',
                        style: context.displayLarge.copyWith(
                          color: MyColors.textPrimaryDark,
                          fontWeight: FontWeight.w800,
                          height: 0.95,
                        ),
                      ),

                      Text(
                        'Build.',
                        style: context.displayLarge.copyWith(
                          color: MyColors.textPrimaryDark,
                          fontWeight: FontWeight.w800,
                          height: 0.95,
                        ),
                      ),

                      Text(
                        'Grow.',
                        style: context.displayLarge.copyWith(
                          color: MyColors.yellow,
                          fontWeight: FontWeight.w800,
                          height: 0.95,
                        ),
                      ),

                      SizedBox(height: context.gap(24)),

                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 360),
                        child: Text(
                          'Join 25,000+ learners building real skills and turning knowledge into progress.',
                          style: context.titleMedium.copyWith(
                            color: MyColors.textSecondaryDark,
                            height: 1.5,
                          ),
                        ),
                      ),

                      SizedBox(height: context.gap(32)),

                      // ==================================================
                      // SMALL FEATURE ROW
                      // ==================================================
                      Row(
                        children: [
                          _FeatureItem(
                            icon: Icons.school_outlined,
                            label: 'Learn',
                          ),

                          SizedBox(width: context.gap(20)),

                          _FeatureItem(
                            icon: Icons.trending_up_rounded,
                            label: 'Improve',
                          ),

                          SizedBox(width: context.gap(20)),

                          _FeatureItem(
                            icon: Icons.emoji_events_outlined,
                            label: 'Achieve',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // BOTTOM LEARNING CARD
          Positioned(
            left: context.gap(40),
            right: context.gap(40),
            bottom: context.gap(35),
            child: _LearningCard(),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// FEATURE ITEM
// ============================================================================

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: context.iconSm, color: MyColors.yellow),
        SizedBox(width: context.gap(6)),
        Text(
          label,
          style: context.bodyMedium.copyWith(
            color: MyColors.textPrimaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// BOTTOM CARD
// ============================================================================

class _LearningCard extends StatelessWidget {
  const _LearningCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.gap(16)),
      decoration: BoxDecoration(
        color: MyColors.textWhite.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(context.radiusLg),
        border: Border.all(color: MyColors.textWhite.withValues(alpha: 0.10)),
      ),
      child: Row(
        children: [
          Container(
            width: context.iconXl,
            height: context.iconXl,
            decoration: BoxDecoration(
              color: MyColors.blue.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(context.radiusMd),
            ),
            child: Icon(
              Icons.auto_graph_rounded,
              color: MyColors.yellow,
              size: context.iconMd,
            ),
          ),

          SizedBox(width: context.gap(12)),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your learning journey',
                  style: context.bodyMedium.copyWith(
                    color: MyColors.textPrimaryDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: context.gap(4)),

                Text(
                  'Small steps. Real progress.',
                  style: context.bodySmall.copyWith(
                    color: MyColors.textSecondaryDark,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.arrow_forward_rounded,
            color: MyColors.textWhite.withValues(alpha: 0.55),
            size: context.iconSm,
          ),
        ],
      ),
    );
  }
}
