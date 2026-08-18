import 'package:flutter/material.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../common/domain/entities/course.dart';
import 'course_grid.dart';
import 'section_heading.dart';

class CourseCollection extends StatelessWidget {
  const CourseCollection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.courses,
    required this.filtersVisible,
    required this.onToggleFilters,
  });

  final String title;
  final String subtitle;
  final List<Course> courses;
  final bool filtersVisible;
  final VoidCallback onToggleFilters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: SectionHeading(
                eyebrow: 'COURSES',
                title: title,
                subtitle: subtitle,
              ),
            ),
            OutlinedButton.icon(
              onPressed: onToggleFilters,
              icon: Icon(
                filtersVisible
                    ? Icons.filter_alt_off_outlined
                    : Icons.filter_alt_outlined,
              ),
              label: Text(filtersVisible ? 'Hide filters' : 'Filters'),
            ),
          ],
        ),
        SizedBox(height: context.spaceLg),
        CourseGrid(courses: courses),
      ],
    );
  }
}
