import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(context.radiusMd),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(
          horizontal: context.spaceMd,
          vertical: context.spaceSm,
        ),
        decoration: BoxDecoration(
          color: selected
              ? MyColors.primary(context).withValues(alpha: .10)
              : MyColors.surface(context),
          borderRadius: BorderRadius.circular(context.radiusMd),
          border: Border.all(
            color: selected
                ? MyColors.primary(context)
                : MyColors.border(context),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: context.iconSm,
              color: selected
                  ? MyColors.primary(context)
                  : MyColors.textSecondary(context),
            ),
            SizedBox(width: context.spaceXs),
            Text(
              title,
              style: context.bodyMedium.copyWith(
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
