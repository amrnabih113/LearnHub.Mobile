import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class FormatCard extends StatelessWidget {
  const FormatCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spaceLg),
      decoration: BoxDecoration(
        color: MyColors.surface(context),
        borderRadius: BorderRadius.circular(context.cardRadiusLg),
        border: Border.all(color: MyColors.border(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: MyColors.primary(context), size: context.iconLg),
          SizedBox(height: context.spaceMd),
          Text(
            title,
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w800),
          ),
          SizedBox(height: context.spaceXs),
          Expanded(
            child: Text(
              description,
              style: context.bodySmall.copyWith(
                color: MyColors.textSecondary(context),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
