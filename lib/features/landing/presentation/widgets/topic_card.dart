import 'package:flutter/material.dart';
import '../../../../core/extensions/my_sizes_extensions.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({super.key, required this.topic});
  final Topic topic;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(context.radiusLg),
      onTap: () {},
      child: Container(
        height: context.responsive(150),
        width: context.responsive(150),
        padding: context.paddingMd,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.radiusLg),
          border: Border.all(color: MyColors.border(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(topic.icon, size: context.iconMd, color: MyColors.blue),
            SizedBox(height: context.spaceLg),
            Text(topic.title, style: context.titleSmall),
            const SizedBox(height: 6),
            Text('${topic.courses} courses', style: context.labelMedium),
          ],
        ),
      ),
    );
  }
}

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key, required this.onPressed, required this.title});

  final VoidCallback onPressed;
  final String title ;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        side: BorderSide(color: MyColors.border(context)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.titleSmall.copyWith(
              color: MyColors.textPrimary(context),
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.arrow_forward,
            size: 18,
            color: MyColors.textPrimary(context),
          ),
        ],
      ),
    );
  }
}

class Topic {
  final IconData icon;
  final String title;
  final int courses;

  const Topic({required this.icon, required this.title, required this.courses});
}
