import 'package:flutter/material.dart';
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

class LandingHeroWeb extends StatelessWidget {
  const LandingHeroWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyColors.isDark(context);
    return Container(
      height: context.screenHeight * 0.85,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [MyColors.navy, MyColors.backgroundDark]
              : [MyColors.textPrimaryLight, MyColors.navy],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            // Large circle
            Positioned(
              top: 55,
              right: 360,
              child: DecorativeCircle(
                size: 300,
                color: MyColors.blue,
                opacity: 0.35,
              ),
            ),

            // Second circle
            Positioned(
              top: 130,
              right: 40,
              child: DecorativeCircle(
                size: 420,
                color: MyColors.textWhite,
                opacity: 0.12,
              ),
            ),

            // Dot grid
            Positioned(
              top: 260,
              right: 520,
              child: DotGrid(
                rows: 7,
                columns: 6,
                spacing: 16,
                color: MyColors.blue,
                opacity: 0.55,
              ),
            ),

            // Flowing lines at the bottom
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(painter: FlowLinesPainter()),
              ),
            ),

            // MAIN HERO CONTENT
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.gap(70),
                vertical: context.gap(55),
              ),
              child: Row(
                children: [
                  // LEFT
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .center,
                      children: [
                        LearnerBanner(),

                        SizedBox(height: context.gap(30)),

                        Text(
                          'Learn. Build.',
                          style: context.displayLarge.copyWith(
                            color: MyColors.textPrimaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          'Grow.',
                          style: context.displayLarge.copyWith(
                            color: MyColors.yellow,
                          ),
                        ),

                        const SizedBox(height: 22),

                        SizedBox(
                          width: context.screenWidth * 0.35,
                          child: Text(
                            'Discover practical courses, build real skills, '
                            'and move closer to your goals — at your own pace.',
                            style: context.bodyLarge.copyWith(
                              color: MyColors.textSecondaryDark,
                            ),
                          ),
                        ),

                        SizedBox(height: context.gap(30)),

                        HeroSearch(),

                        SizedBox(height: context.gap(30)),

                        Benefits(),
                      ],
                    ),
                  ),
                  SizedBox(width: context.gap(50)),
                  // RIGHT
                  Expanded(
                    flex: 5,
                    child: Image.asset(
                      MyImages.landingImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
