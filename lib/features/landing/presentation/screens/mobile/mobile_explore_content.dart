import 'package:flutter/material.dart';
import '../../../../../core/adaptive/adaptive_value.dart';
import '../../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../common/domain/entities/course.dart';
import '../../../domain/entities/explore_filters.dart';
import '../../../domain/entities/learning_path.dart';
import '../../widgets/category_section.dart';
import '../../widgets/course_grid.dart';
import '../../widgets/explore_cta.dart';
import '../../widgets/explore_toolbar.dart';
import '../../widgets/learning_formats_section.dart';
import '../../widgets/learning_paths_section.dart';
import '../../widgets/section_heading.dart';
import '../../widgets/trending_section.dart';

class MobileExploreContent extends StatelessWidget {
  const MobileExploreContent({
    super.key,
    required this.categories,
    required this.courses,
    required this.paths,
    required this.filters,
    required this.onOpenFilters,
    this.onCategorySelected,
  });

  final List<String> categories;
  final List<Course> courses;
  final List<LearningPath> paths;
  final ExploreFilters filters;
  final VoidCallback onOpenFilters;
  final ValueChanged<String?>? onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final double spacing = AdaptiveValue(
      compact: context.spaceXl,
      medium: context.spaceXxl,
    ).resolve(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          eyebrow: 'DISCOVER',
          title: 'Find your next skill',
          subtitle:
              'Courses, learning paths and practical skills in one place.',
        ),
        SizedBox(height: context.spaceLg),
        CategorySection(
          categories: categories,
          selectedCategory: filters.category,
          onSelected: onCategorySelected ?? (_) {},
        ),
        SizedBox(height: spacing),
        LearningPathsSection(paths: paths),
        SizedBox(height: spacing),
        ExploreToolbar(
          count: courses.length,
          hasFilters: filters.hasFilters,
          onFilterPressed: onOpenFilters,
        ),
        SizedBox(height: context.spaceLg),
        CourseGrid(courses: courses),
        SizedBox(height: spacing),
        TrendingSection(courses: courses),
        SizedBox(height: spacing),
        const LearningFormatsSection(),
        SizedBox(height: spacing),
        const ExploreCta(),
      ],
    );
  }
}
