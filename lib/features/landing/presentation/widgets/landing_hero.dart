import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/ui/my_buttons.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/core/utils/my_images.dart';
import 'package:learnhub/features/auth/presentation/widgets/decorative_circle.dart';
import 'package:learnhub/features/auth/presentation/widgets/dot_grid.dart';
import 'package:learnhub/features/auth/presentation/widgets/flow_lines_painter.dart';
import 'package:learnhub/features/landing/presentation/widgets/learner_banner.dart';

class LandingHero extends StatelessWidget {
  const LandingHero({super.key});

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
              : [MyColors.textPrimaryLight, MyColors.textPrimaryLight],
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
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 55),
              child: Row(
                children: [
                  // LEFT
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LearnerBanner(),

                        const SizedBox(height: 30),

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
                          width: 520,
                          child: Text(
                            'Discover practical courses, build real skills, '
                            'and move closer to your goals — at your own pace.',
                            style: context.bodyLarge.copyWith(
                              color: MyColors.textSecondaryDark,
                            ),
                          ),
                        ),

                        SizedBox(height: 30),

                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText:
                                      'Search courses, topics, instructors...',
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(14),
                                    child: Icon(Icons.search),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: context.gap(14),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: context.gap(10)),
                            SizedBox(
                              height: context.buttonHeightLg,
                              width: context.gap(140),
                              child: MyButtons.accent(
                                onPressed: () {},
                                child: const Text('Search'),
                                context: context,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 30),

                        Row(
                          children: [
                            Expanded(
                              child: Benefit(
                                icon: Icons.play_circle_outline,
                                text: 'Free courses\navailable',
                              ),
                            ),

                            Expanded(
                              child: Benefit(
                                icon: Icons.bookmark_border,
                                text: 'Progress\nalways saved',
                              ),
                            ),

                            Expanded(
                              child: Benefit(
                                icon: Icons.verified_outlined,
                                text: 'Certificates\nincluded',
                              ),
                            ),

                            Expanded(
                              child: Benefit(
                                icon: Icons.phone_android,
                                text: 'Learn on any\ndevice',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 50),
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

class Benefit extends StatelessWidget {
  final IconData icon;
  final String text;

  const Benefit({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: MyColors.textWhite, size: 25),

        const SizedBox(width: 10),

        Flexible(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: MyColors.textWhite, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
