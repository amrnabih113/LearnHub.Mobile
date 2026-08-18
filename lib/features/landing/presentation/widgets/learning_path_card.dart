import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/features/landing/domain/entities/learning_path.dart';

class LearningPathCard extends StatelessWidget {
  const LearningPathCard({super.key, required this.path});

  final LearningPath path;

  @override
  Widget build(BuildContext context) {
    final accent = switch (path.colorType) {
      PathColor.blue => MyColors.blue,
      PathColor.yellow => MyColors.yellow,
      PathColor.purple => MyColors.primary(context),
    };

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
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: .12),
                  borderRadius: BorderRadius.circular(context.radiusMd),
                ),
                child: Icon(path.icon, color: accent),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_rounded),
            ],
          ),
          SizedBox(height: context.spaceMd),
          Text(
            path.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.titleMedium.copyWith(fontWeight: FontWeight.w800),
          ),
          SizedBox(height: context.spaceXs),
          Expanded(
            child: Text(
              path.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.bodySmall.copyWith(
                color: MyColors.textSecondary(context),
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: context.spaceSm),
          Row(
            children: [
              Icon(
                Icons.menu_book_outlined,
                size: context.iconXs,
                color: MyColors.textSecondary(context),
              ),
              SizedBox(width: context.spaceXxs),
              Text(
                path.courses,
                style: context.bodySmall.copyWith(
                  color: MyColors.textSecondary(context),
                ),
              ),
              SizedBox(width: context.spaceMd),
              Icon(
                Icons.access_time_rounded,
                size: context.iconXs,
                color: MyColors.textSecondary(context),
              ),
              SizedBox(width: context.spaceXxs),
              Text(
                path.duration,
                style: context.bodySmall.copyWith(
                  color: MyColors.textSecondary(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
