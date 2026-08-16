import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_context.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/core/utils/my_images.dart';
import 'package:learnhub/features/auth/presentation/widgets/decorative_circle.dart';
import 'package:learnhub/features/auth/presentation/widgets/dot_grid.dart';
import 'package:learnhub/features/auth/presentation/widgets/flow_lines_painter.dart';
import 'package:learnhub/features/landing/presentation/widgets/benefits.dart';
import 'package:learnhub/features/landing/presentation/widgets/hero_search.dart';
import 'package:learnhub/features/landing/presentation/widgets/learner_banner.dart';

class LandingHeroMobile extends StatelessWidget {
  const LandingHeroMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyColors.isDark(context);

    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [MyColors.navy, MyColors.backgroundDark]
              : [MyColors.textPrimaryLight, MyColors.textPrimaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -100,
            child: DecorativeCircle(
              size: 240,
              color: MyColors.blue,
              opacity: 0.28,
            ),
          ),

          Positioned(
            top: 170,
            right: 5,
            child: DotGrid(
              rows: 4,
              columns: 4,
              spacing: 12,
              color: MyColors.blue,
              opacity: 0.4,
            ),
          ),

          Positioned(
            bottom: -100,
            left: -100,
            child: DecorativeCircle(
              size: 250,
              color: MyColors.textWhite,
              opacity: 0.04,
            ),
          ),
          // Flowing lines at the bottom
          Positioned.fill(child: CustomPaint(painter: FlowLinesPainter())),

          Padding(
            padding: context.paddingXl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LearnerBanner(),

                          SizedBox(height: context.gap(30)),

                          Wrap(
                            children: [
                              Text(
                                'Learn.',
                                style: context.displayLarge.copyWith(
                                  color: MyColors.textPrimaryDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: context.gap(4)),
                              Text(
                                'Build.',
                                style: context.displayLarge.copyWith(
                                  color: MyColors.textPrimaryDark,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Grow.',
                            style: context.displayLarge.copyWith(
                              color: MyColors.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: context.gap(16)),
                          if (AdaptiveContext.of(context).isMedium) ...[
                            Text(
                              'Discover practical courses, build real skills, '
                              'and move closer to your goals — at your own pace.',
                              style: context.bodyLarge.copyWith(
                                color: MyColors.textSecondaryDark,
                              ),
                            ),
                            SizedBox(height: context.gap(30)),
                          ],
                        ],
                      ),
                    ),

                    const SizedBox(width: 4),

                    Expanded(
                      flex: 6,
                      child: Image.asset(
                        MyImages.landingImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                if (AdaptiveContext.of(context).isCompact) ...[
                  Text(
                    'Discover practical courses, build real skills, '
                    'and move closer to your goals — at your own pace.',
                    style: context.bodyLarge.copyWith(
                      color: MyColors.textSecondaryDark,
                    ),
                  ),
                  SizedBox(height: context.gap(30)),
                ],
                HeroSearch(),
                SizedBox(height: context.gap(40)),

                Benefits(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
