import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_grid.dart';
import '../../../../core/adaptive/adaptive_value.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../common/domain/entities/course.dart';
import '../../../common/widgets/course_card.dart';
import 'empty_courses.dart';

class CourseGrid extends StatelessWidget {
  const CourseGrid({super.key, required this.courses});

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    if (courses.isEmpty) {
      return const EmptyCourses();
    }

    return AdaptiveGrid(
      minItemWidth: 270,
      maxItemWidth: context.screenWidth * .25,
      spacing: context.spaceLg,
      runSpacing: context.spaceLg,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemHeight: AdaptiveValue(
        compact: context.responsive(410),
        medium: context.responsive(400),
        expanded: context.responsive(410),
      ).resolve(context),
      children: courses
          .map(
            (course) => SizedBox(
              width: 270,
              child: CourseCard(
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
              ),
            ),
          )
          .toList(),
    );
  }
}
