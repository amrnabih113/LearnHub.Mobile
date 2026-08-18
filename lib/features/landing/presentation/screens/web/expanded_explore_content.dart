import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/features/landing/presentation/widgets/category_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/course_collection.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_cta.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_filter_sidebar.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_filters.dart';
import 'package:learnhub/features/landing/presentation/widgets/explore_mokeup_data.dart';
import 'package:learnhub/features/landing/presentation/widgets/learning_formats_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/learning_paths_section.dart';
import 'package:learnhub/features/landing/presentation/widgets/section_heading.dart';
import 'package:learnhub/features/landing/presentation/widgets/trending_section.dart';

class ExpandedExploreContent extends StatelessWidget {
  const ExpandedExploreContent({
    required this.categories,
    required this.courses,
    required this.paths,
    required this.filters,
    required this.filtersVisible,
    required this.onFilterChanged,
    required this.onClearFilters,
    required this.onToggleFilters,
  });

  final List<String> categories;
  final List<ExploreCourse> courses;
  final List<LearningPath> paths;
  final ExploreFilters filters;
  final bool filtersVisible;

  final ValueChanged<ExploreFilters> onFilterChanged;
  final VoidCallback onClearFilters;
  final VoidCallback onToggleFilters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          eyebrow: 'DISCOVER',
          title: 'Find your next skill',
          subtitle:
              'Explore courses, guided learning paths and expert-led content built to help you make real progress.',
        ),
        SizedBox(height: context.spaceXl),
        CategorySection(
          categories: categories,
          selectedCategory: filters.category,
          onSelected: (category) {
            onFilterChanged(filters.copyWith(category: category));
          },
        ),
        SizedBox(height: context.spaceXxl),
        LearningPathsSection(paths: paths),
        SizedBox(height: context.spaceXxl),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              width: filtersVisible ? 270 : 0,
              child: ClipRect(
                child: filtersVisible
                    ? Padding(
                        padding: EdgeInsets.only(right: context.spaceXl),
                        child: ExploreFilterSidebar(
                          filters: filters,
                          categories: categories,
                          onChanged: onFilterChanged,
                          onClear: onClearFilters,
                          onClose: onToggleFilters,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Expanded(
              child: CourseCollection(
                title: 'Popular courses',
                subtitle:
                    'Start with the courses learners are loving right now.',
                courses: courses,
                filtersVisible: filtersVisible,
                onToggleFilters: onToggleFilters,
              ),
            ),
          ],
        ),
        SizedBox(height: context.spaceXxl),
        TrendingSection(courses: courses),
        SizedBox(height: context.spaceXxl),
        const LearningFormatsSection(),
        SizedBox(height: context.spaceXxl),
        const ExploreCta(),
      ],
    );
  }
}
