import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class LearnerBanner extends StatelessWidget {
  const LearnerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: MyColors.textWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: MyColors.textWhite.withValues(alpha: 0.07)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.auto_awesome,
            size: context.iconSm,
            color: MyColors.yellow,
          ),
          SizedBox(width: context.gap(7)),
          Text(
            '25K+ active learners',
            style: context.bodySmall.copyWith(color: MyColors.yellow),
          ),
        ],
      ),
    );
  }
}
