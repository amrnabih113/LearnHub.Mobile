import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class FilterRadioItem extends StatelessWidget {
  const FilterRadioItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.radiusSm),
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
            Expanded(
              child: Text(
                label,
                style: context.bodyMedium.copyWith(
                  color: selected
                      ? MyColors.textPrimary(context)
                      : MyColors.textSecondary(context),
                  fontWeight: selected ? FontWeight.w600 : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
