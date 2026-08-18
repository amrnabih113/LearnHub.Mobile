import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class ExploreToolbar extends StatelessWidget {
  const ExploreToolbar({
    required this.count,
    required this.hasFilters,
    required this.onFilterPressed,
  });

  final int count;
  final bool hasFilters;
  final VoidCallback onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular courses',
              style: context.titleLarge.copyWith(fontWeight: FontWeight.w800),
            ),
            SizedBox(height: context.spaceXxs),
            Text(
              '$count courses',
              style: context.bodySmall.copyWith(
                color: MyColors.textSecondary(context),
              ),
            ),
          ],
        ),
        const Spacer(),
        OutlinedButton.icon(
          onPressed: onFilterPressed,
          icon: Icon(
            hasFilters ? Icons.filter_alt_rounded : Icons.tune_rounded,
          ),
          label: const Text('Filters'),
        ),
      ],
    );
  }
}
