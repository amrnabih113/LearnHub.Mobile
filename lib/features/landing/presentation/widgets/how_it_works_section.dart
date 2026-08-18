import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_context.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final adaptive = context.adaptive;

    final bool isCompact = adaptive.isCompact;
    final bool isMedium = adaptive.isMedium;
    final double cardWidth = isCompact
        ? double.infinity
        : isMedium
        ? context.responsive(270)
        : context.responsive(400);

    final double contentWidth = isCompact
        ? adaptive.width - context.spaceXl * 2
        : isMedium
        ? adaptive.width * 0.78
        : adaptive.width * 0.68;

    return Container(
      width: double.infinity,
      color: MyColors.background(context),
      padding: EdgeInsets.symmetric(
        vertical: isCompact ? context.spaceSection : context.spaceSectionLg,
      ),
      child: Column(
        children: [
          // HEADER
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: contentWidth),
            child: Column(
              children: [
                Text(
                  'HOW IT WORKS',
                  textAlign: TextAlign.center,
                  style: context.labelLarge.copyWith(
                    color: MyColors.primary(context),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),

                SizedBox(height: context.spaceSm),

                Text(
                  'Your learning journey, made simple',
                  textAlign: TextAlign.center,
                  style:
                      (isCompact
                              ? context.headlineLarge
                              : isMedium
                              ? context.displaySmall
                              : context.displaySmall)
                          .copyWith(
                            color: MyColors.textPrimary(context),
                            fontWeight: FontWeight.w700,
                          ),
                ),

                SizedBox(height: context.spaceSm),

                Text(
                  'Discover courses, learn at your own pace, and build '
                  'skills that help you take the next step in your career.',
                  textAlign: TextAlign.center,
                  style: (isCompact ? context.bodyMedium : context.bodyLarge)
                      .copyWith(
                        color: MyColors.textSecondary(context),
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),

          SizedBox(height: isCompact ? context.spaceXl : context.spaceSection),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isCompact
                  ? context.spaceXl
                  : isMedium
                  ? context.spaceXl
                  : context.spaceSection,
            ),
            child: Wrap(
              spacing: context.spaceMd,
              runSpacing: context.spaceMd,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                _HowItWorksCard(
                  width: cardWidth,
                  number: '01',
                  icon: Icons.search_rounded,
                  title: 'Discover & Enroll',
                  description:
                      'Explore courses that match your goals and '
                      'enroll in the ones that help you move forward.',
                ),

                _HowItWorksCard(
                  width: cardWidth,
                  number: '02',
                  icon: Icons.play_arrow_rounded,
                  title: 'Learn at Your Pace',
                  description:
                      'Learn whenever it works for you. Track your '
                      'progress and continue your courses whenever '
                      'you are ready.',
                ),

                _HowItWorksCard(
                  width: cardWidth,
                  number: '03',
                  icon: Icons.workspace_premium_outlined,
                  title: 'Complete & Grow',
                  description:
                      'Finish your courses, earn certificates, and '
                      'turn what you learn into skills you can use.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HowItWorksCard extends StatelessWidget {
  const _HowItWorksCard({
    required this.width,
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
  });

  final double width;
  final String number;
  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      constraints: BoxConstraints(minHeight: context.responsive(300)),
      padding: EdgeInsets.all(context.responsive(30)),
      decoration: BoxDecoration(
        color: MyColors.surface(context),
        borderRadius: BorderRadius.circular(context.radiusLg),
        border: Border.all(
          color: MyColors.border(context),
          width: context.borderWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NUMBER
          Text(
            number,
            style: context.titleSmall.copyWith(
              color: MyColors.yellow,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: context.spaceLg),

          // ICON
          Icon(icon, size: context.iconLg, color: MyColors.primary(context)),

          SizedBox(height: context.spaceLg),

          // TITLE
          Text(
            title,
            style: context.titleLarge.copyWith(
              color: MyColors.textPrimary(context),
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: context.spaceSm),

          // DESCRIPTION
          Text(
            description,
            style: context.bodyLarge.copyWith(
              color: MyColors.textSecondary(context),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
