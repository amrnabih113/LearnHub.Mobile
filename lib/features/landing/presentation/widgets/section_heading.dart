import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    required this.eyebrow,
    required this.title,
    required this.subtitle,
  });

  final String eyebrow;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: context.labelLarge.copyWith(
            color: MyColors.primary(context),
            fontWeight: FontWeight.w800,
            letterSpacing: 1.4,
          ),
        ),
        SizedBox(height: context.spaceXs),
        Text(
          title,
          style: context.headlineMedium.copyWith(fontWeight: FontWeight.w800),
        ),
        SizedBox(height: context.spaceXs),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            subtitle,
            style: context.bodyLarge.copyWith(
              color: MyColors.textSecondary(context),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
