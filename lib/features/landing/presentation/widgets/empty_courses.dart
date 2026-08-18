import 'package:flutter/material.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';

class EmptyCourses extends StatelessWidget {
  const EmptyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: context.spaceXxl),
      child: Column(
        children: [
          Icon(
            Icons.search_off_rounded,
            size: context.iconXl,
            color: MyColors.textSecondary(context),
          ),
          SizedBox(height: context.spaceMd),
          Text(
            'No courses found',
            style: context.titleLarge.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: context.spaceXs),
          Text(
            'Try changing your filters to find more courses.',
            textAlign: TextAlign.center,
            style: context.bodyMedium.copyWith(
              color: MyColors.textSecondary(context),
            ),
          ),
        ],
      ),
    );
  }
}
