import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class RatingFilterItem extends StatelessWidget {
  const RatingFilterItem({
    required this.rating,
    required this.selected,
    required this.onTap,
  });

  final double rating;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.spaceXxs),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_unchecked_rounded,
              size: context.iconSm,
              color: selected
                  ? MyColors.primary(context)
                  : MyColors.textSecondary(context),
            ),
            SizedBox(width: context.spaceXs),
            ...List.generate(
              5,
              (index) => Icon(
                index < rating.floor()
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                size: context.iconXs,
                color: MyColors.yellow,
              ),
            ),
            SizedBox(width: context.spaceXs),
            Text('$rating+', style: context.bodySmall),
          ],
        ),
      ),
    );
  }
}
