import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_grid.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/features/landing/presentation/widgets/format_card.dart';
import 'package:learnhub/features/landing/presentation/widgets/section_heading.dart';

class LearningFormatsSection extends StatelessWidget {
  const LearningFormatsSection();

  @override
  Widget build(BuildContext context) {
    const formats = [
      (
        Icons.play_circle_outline_rounded,
        'Video courses',
        'Learn at your own pace with structured lessons.',
      ),
      (
        Icons.route_outlined,
        'Learning paths',
        'Follow a curated path from beginner to confident.',
      ),
      (
        Icons.code_rounded,
        'Hands-on projects',
        'Build real things instead of only watching tutorials.',
      ),
      (
        Icons.verified_outlined,
        'Certificates',
        'Showcase the skills you have worked to develop.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          eyebrow: 'LEARN YOUR WAY',
          title: 'More than just courses',
          subtitle:
              'Choose the learning experience that fits the way you learn best.',
        ),
        SizedBox(height: context.spaceLg),
        AdaptiveGrid(
          minItemWidth: 230,
          maxItemWidth: 340,
          spacing: context.spaceMd,
          runSpacing: context.spaceMd,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemHeight: 180,
          children: formats
              .map(
                (format) => FormatCard(
                  icon: format.$1,
                  title: format.$2,
                  description: format.$3,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
