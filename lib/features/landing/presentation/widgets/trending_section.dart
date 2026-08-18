import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_value.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/features/common/domain/entities/course.dart';
import 'package:learnhub/features/common/widgets/course_card.dart';
import 'package:learnhub/features/landing/presentation/widgets/section_heading.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key, required this.courses});

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    final trending = courses.where((c) => c.isTrending).isNotEmpty
        ? courses.where((c) => c.isTrending).take(4).toList()
        : courses.take(4).toList();

    final carouselHeight = AdaptiveValue<double>(
      compact: 230,
      medium: 230,
      expanded: 210,
    ).resolve(context);

    final viewportFraction = AdaptiveValue<double>(
      compact: 0.92,
      medium: 0.72,
      expanded: 0.58,
    ).resolve(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          eyebrow: 'TRENDING NOW',
          title: 'What learners are watching',
          subtitle: 'Popular courses that are getting attention right now.',
        ),
        SizedBox(height: context.spaceLg),
        SizedBox(
          height: carouselHeight,
          child: CarouselSlider.builder(
            itemCount: trending.length,
            itemBuilder: (context, index, realIndex) {
              final course = trending[index];

              return Padding(
                padding: EdgeInsets.only(right: context.spaceMd),
                child: CourseCard.horizontal(
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
              );
            },
            options: CarouselOptions(
              height: carouselHeight,
              viewportFraction: viewportFraction,
              enlargeCenterPage: false,
              enableInfiniteScroll: trending.length > 1,
              autoPlay: trending.length > 1,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 700),
              autoPlayCurve: Curves.easeInOut,
              padEnds: false,
            ),
          ),
        ),
      ],
    );
  }
}
