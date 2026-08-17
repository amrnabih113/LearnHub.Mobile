import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnhub/core/adaptive/adaptive_context.dart';
import 'package:learnhub/core/adaptive/adaptive_grid.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/app_routes.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/features/common/widgets/course_card.dart';
import 'package:learnhub/features/landing/presentation/widgets/topic_card.dart';

class FeaturedCoursesSection extends StatelessWidget {
  const FeaturedCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final adaptive = context.adaptive;

    // ADAPTIVE HEADER VALUES

    final double titleWidth = adaptive.isCompact
        ? adaptive.width - context.spaceXl * 2
        : adaptive.isMedium
        ? adaptive.width * 0.75
        : adaptive.width * 0.65;

    final double descriptionWidth = adaptive.isCompact
        ? adaptive.width - context.spaceXl * 2
        : adaptive.isMedium
        ? adaptive.width * 0.70
        : adaptive.width * 0.60;

    final TextStyle titleStyle = adaptive.isCompact
        ? context.headlineLarge.copyWith(fontWeight: FontWeight.w700)
        : adaptive.isMedium
        ? context.displaySmall.copyWith(fontWeight: FontWeight.w700)
        : context.displaySmall.copyWith(fontWeight: FontWeight.w700);

    final TextStyle descriptionStyle = adaptive.isCompact
        ? context.bodyMedium.copyWith(color: MyColors.textSecondary(context))
        : adaptive.isMedium
        ? context.bodyLarge.copyWith(color: MyColors.textSecondary(context))
        : context.bodyLarge.copyWith(color: MyColors.textSecondary(context));

    return Padding(
      padding: context.paddingXl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SECTION HEADER
          Padding(
            padding: context.paddingHorizontalLg,
            child: adaptive.isCompact
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionHeader(
                        titleWidth: titleWidth,
                        descriptionWidth: descriptionWidth,
                        titleStyle: titleStyle,
                        descriptionStyle: descriptionStyle,
                      ),

                      SizedBox(height: context.spaceLg),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: SeeAllButton(
                          onPressed: () {
                            context.push(AppRoutes.explore);
                          },
                          title: 'view all',
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: _SectionHeader(
                          titleWidth: titleWidth,
                          descriptionWidth: descriptionWidth,
                          titleStyle: titleStyle,
                          descriptionStyle: descriptionStyle,
                        ),
                      ),

                      SizedBox(width: context.spaceLg),

                      SeeAllButton(onPressed: () {}, title: 'view all'),
                    ],
                  ),
          ),

          SizedBox(height: context.responsive(40)),

          // COURSES
          AdaptiveGrid(
            shrinkWrap: true,
            itemHeight: context.responsive(430),
            minItemWidth: 280,
            spacing: 24,
            runSpacing: 24,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            children: [
              const CourseCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=1200&auto=format&fit=crop',
                category: 'Development',
                title: 'Full-Stack Web Development with React & Node.js',
                instructor: 'Ahmed Hassan',
                rating: 4.8,
                reviews: '3,241',
                duration: '42h',
                level: 'Beginner',
                price: 49,
                discountPrice: 39,
              ),

              const CourseCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1677442136019-21780ecad995?q=80&w=1200&auto=format&fit=crop',
                category: 'AI & Data',
                title: 'Machine Learning with Python & TensorFlow',
                instructor: 'Sara Ali',
                rating: 4.9,
                reviews: '1,842',
                duration: '38h',
                level: 'Intermediate',
                price: 59,
                discountPrice: 39,
              ),

              const CourseCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop',
                category: 'Development',
                title: 'ASP.NET Core Clean Architecture',
                instructor: 'Ahmed Hassan',
                rating: 4.9,
                reviews: '2,401',
                duration: '28h',
                level: 'Advanced',
                price: 79,
                discountPrice: 59,
              ),

              const CourseCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?q=80&w=1200&auto=format&fit=crop',
                category: 'Design',
                title: 'UI/UX Design Masterclass',
                instructor: 'Mariam Adel',
                rating: 4.7,
                reviews: '1,204',
                duration: '24h',
                level: 'Beginner',
                price: 49,
                discountPrice: 35,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.titleWidth,
    required this.descriptionWidth,
    required this.titleStyle,
    required this.descriptionStyle,
  });

  final double titleWidth;
  final double descriptionWidth;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FEATURED COURSES',
          style: context.labelLarge.copyWith(
            color: MyColors.primary(context),
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: context.spaceXs),

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: titleWidth),
          child: Text('Build skills that move you forward', style: titleStyle),
        ),

        SizedBox(height: context.spaceSm),

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: descriptionWidth),
          child: Text(
            'From practical career skills to in-demand technology, '
            'LearnHub helps you learn with courses built for your next step.',
            style: descriptionStyle,
          ),
        ),
      ],
    );
  }
}
