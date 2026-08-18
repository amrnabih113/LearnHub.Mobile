import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_grid.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../domain/entities/learning_path.dart';
import 'learning_path_card.dart';
import 'section_heading.dart';

class LearningPathsSection extends StatelessWidget {
  const LearningPathsSection({super.key, required this.paths});

  final List<LearningPath> paths;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeading(
          eyebrow: 'LEARNING PATHS',
          title: 'Learn with a clear direction',
          subtitle:
              'Follow a curated sequence of courses instead of figuring out what to learn next.',
        ),
        SizedBox(height: context.spaceLg),
        AdaptiveGrid(
          minItemWidth: 280,
          maxItemWidth: 460,
          spacing: context.spaceMd,
          runSpacing: context.spaceMd,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemHeight: context.responsive(250),
          children: paths.map((path) => LearningPathCard(path: path)).toList(),
        ),
      ],
    );
  }
}
