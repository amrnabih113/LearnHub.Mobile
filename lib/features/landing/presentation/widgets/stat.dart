import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class Stat extends StatelessWidget {
  final IconData icon;
  final String number;
  final String title;
  final String subtitle;

  const Stat({
    required this.icon,
    required this.number,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: MyColors.surfaceAlt(context),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 30),
        ),

        const SizedBox(width: 18),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(number, style: context.titleLarge),
            Text(title, style: context.bodyMedium),
            Text(subtitle, style: context.bodySmall),
          ],
        ),
      ],
    );
  }
}
