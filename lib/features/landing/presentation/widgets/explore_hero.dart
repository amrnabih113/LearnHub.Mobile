import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_content.dart';
import 'package:learnhub/core/adaptive/adaptive_value.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class ExploreHero extends StatelessWidget {
  const ExploreHero({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String?> onCategorySelected;

  static const String _heroImage =
      'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=1800&auto=format&fit=crop';

  @override
  Widget build(BuildContext context) {
    final heroHeight = context.responsive(400);

    final horizontalPadding = AdaptiveValue<double>(
      compact: 20,
      medium: 36,
      expanded: 50,
    ).resolve(context);

    final verticalPadding = AdaptiveValue<double>(
      compact: 30,
      medium: 40,
      expanded: 50,
    ).resolve(context);

    return SizedBox(
      height: heroHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Blurred background image
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Image.network(
              _heroImage,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(color: MyColors.surfaceAlt(context));
              },
            ),
          ),

          // Soft overlay to keep the content readable
          DecoratedBox(
            decoration: BoxDecoration(
              color: MyColors.navy.withValues(alpha: 0.72),
            ),
          ),

          SafeArea(
            bottom: false,
            child: Center(
              child: AdaptiveContent(
                maxWidth: 950,
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Find your next skill',
                      textAlign: TextAlign.center,
                      style: context.bodyLarge.copyWith(
                        color: MyColors.yellow,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: context.spaceSm),

                    Text(
                      'What do you want to learn?',
                      textAlign: TextAlign.center,
                      style: context.displayMedium.copyWith(
                        color: MyColors.textWhite,
                        fontWeight: FontWeight.w800,
                        height: 1.05,
                      ),
                    ),

                    SizedBox(height: context.spaceSm),

                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 620),
                      child: Text(
                        'Explore courses, learning paths, and practical skills to help you reach your goals.',
                        textAlign: TextAlign.center,
                        style: context.bodyLarge.copyWith(
                          color: MyColors.textWhite.withValues(alpha: 0.78),
                          height: 1.5,
                        ),
                      ),
                    ),

                    SizedBox(height: context.spaceXl),

                    // Search
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: TextField(
                        style: context.bodyLarge.copyWith(
                          color: MyColors.textPrimary(context),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search courses, topics, instructors...',
                          hintStyle: context.bodyLarge.copyWith(
                            color: MyColors.textSecondary(context),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: context.spaceMd),
                            child: Icon(
                              Icons.search_rounded,
                              color: MyColors.textSecondary(context),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: context.spaceLg),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
