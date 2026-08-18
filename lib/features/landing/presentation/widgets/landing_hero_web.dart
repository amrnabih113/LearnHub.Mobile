import 'package:flutter/material.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../../core/utils/my_images.dart';
import '../../../auth/presentation/widgets/decorative_circle.dart';
import '../../../auth/presentation/widgets/dot_grid.dart';
import '../../../auth/presentation/widgets/flow_lines_painter.dart';
import 'benefits.dart';
import 'hero_search.dart';
import 'learner_banner.dart';

class LandingHeroWeb extends StatelessWidget {
  const LandingHeroWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MyColors.isDark(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: context.gap(70),
        vertical: context.gap(55),
      ),
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
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 360,
            child: DecorativeCircle(
              size: 300,
              color: MyColors.blue,
              opacity: 0.35,
            ),
          ),

          Positioned(
            top: 75,
            right: 40,
            child: DecorativeCircle(
              size: 420,
              color: MyColors.textWhite,
              opacity: 0.12,
            ),
          ),

          Positioned(
            top: 205,
            right: 520,
            child: DotGrid(
              rows: 7,
              columns: 6,
              spacing: 16,
              color: MyColors.blue,
              opacity: 0.55,
            ),
          ),

          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(painter: FlowLinesPainter()),
            ),
          ),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1400),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
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

                        SizedBox(height: context.gap(22)),

                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 550),
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
          ),
        ],
      ),
    );
  }
}
