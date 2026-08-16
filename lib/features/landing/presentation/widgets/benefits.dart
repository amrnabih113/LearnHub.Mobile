import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_context.dart';
import 'package:learnhub/core/adaptive/adaptive_value.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class Benefits extends StatelessWidget {
  const Benefits({super.key});

  @override
  Widget build(BuildContext context) {
    final benifitsList = [
      Expanded(
        child: Benefit(
          icon: Icons.play_circle_outline,
          text: 'Free courses\navailable',
        ),
      ),

      Expanded(
        child: Benefit(
          icon: Icons.bookmark_border,
          text: 'Progress\nalways saved',
        ),
      ),

      Expanded(
        child: Benefit(
          icon: Icons.verified_outlined,
          text: 'Certificates\nincluded',
        ),
      ),

      Expanded(
        child: Benefit(icon: Icons.phone_android, text: 'Learn on any\ndevice'),
      ),
    ];
    final double spacing = AdaptiveValue<double>(
      compact: 20,
      medium: 40,
      expanded: 60,
    ).resolve(context);
    return AdaptiveContext.of(context).isExpanded
        ? Row(children: benifitsList)
        : Wrap(
            runSpacing: context.gap(20),
            spacing: spacing,
            children: benifitsList,
          );
  }
}

class Benefit extends StatelessWidget {
  final IconData icon;
  final String text;

  const Benefit({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: MyColors.textWhite, size: context.iconMd),

        SizedBox(width: context.gap(10)),

        Flexible(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.bodySmall.copyWith(color: MyColors.textWhite),
          ),
        ),
      ],
    );
  }
}
