import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_context.dart';
import 'package:learnhub/core/adaptive/adaptive_value.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class LearnerBanner extends StatelessWidget {
  const LearnerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompact = AdaptiveContext.of(context).isCompact;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.gap(isCompact ? 9 : 13),
        vertical: context.gap(isCompact ? 5 : 8),
      ),
      decoration: BoxDecoration(
        color: MyColors.textWhite.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(context.radiusXl),
        border: Border.all(color: MyColors.textWhite.withValues(alpha: 0.07)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.auto_awesome,
            size: context.gap(isCompact ? 12 : 18),
            color: MyColors.yellow,
          ),

          SizedBox(width: context.gap(isCompact ? 5 : 7)),

          Text(
            '25K+ active learners',
            style: context.adaptiveValue<TextStyle>(
              compact: context.bodySmall.copyWith(
                color: MyColors.yellow,
                fontSize: 10,
              ),
              medium: context.bodySmall.copyWith(color: MyColors.yellow),
              expanded: context.bodySmall.copyWith(color: MyColors.yellow),
            ),
          ),
        ],
      ),
    );
  }
}
