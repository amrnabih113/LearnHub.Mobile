import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/adaptive/adaptive_context.dart';
import '../../../../core/adaptive/adaptive_grid.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/my_colors.dart';
import '../../../common/domain/entities/course.dart';
import '../../../common/widgets/course_card.dart';
import '../cubit/explore_cubit.dart';
import 'topic_card.dart';

class FeaturedCoursesSection extends StatelessWidget {
  const FeaturedCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final adaptive = context.adaptive;

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
        : context.displaySmall.copyWith(fontWeight: FontWeight.w700);

    final TextStyle descriptionStyle = adaptive.isCompact
        ? context.bodyMedium.copyWith(color: MyColors.textSecondary(context))
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
                      SeeAllButton(
                        onPressed: () {
                          context.push(AppRoutes.explore);
                        },
                        title: 'view all',
                      ),
                    ],
                  ),
          ),

          SizedBox(height: context.responsive(40)),

          // COURSES
          BlocBuilder<ExploreCubit, ExploreState>(
            builder: (context, state) {
              final featured = state.allCourses
                  .where((c) => c.isFeatured)
                  .take(4)
                  .toList();

              final coursesToRender =
                  featured.isNotEmpty ? featured : _fallbackFeatured;

              return AdaptiveGrid(
                shrinkWrap: true,
                itemHeight: context.responsive(430),
                minItemWidth: 280,
                spacing: 24,
                runSpacing: 24,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                children: coursesToRender.map((course) {
                  return CourseCard(
                    imageUrl: course.imageUrl,
                    category: course.category,
                    title: course.title,
                    instructor: course.instructor,
                    instructorImageUrl: course.instructorImageUrl,
                    rating: course.rating,
                    reviews: course.reviews,
                    duration: course.duration,
                    level: course.level,
                    price: course.price,
                    discountPrice: course.discountPrice,
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  static const List<Course> _fallbackFeatured = [
    Course(
      id: 'f1',
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
    Course(
      id: 'f2',
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
    Course(
      id: 'f3',
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
    Course(
      id: 'f4',
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
  ];
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
