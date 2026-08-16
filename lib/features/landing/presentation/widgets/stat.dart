import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';
import 'package:learnhub/core/utils/my_colors.dart';

class Stat extends StatelessWidget {
  final String number;
  final String title;
  final bool showDivider;

  const Stat({
    super.key,
    required this.number,
    required this.title,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.responsive(120),
      decoration: BoxDecoration(
        border: showDivider
            ? Border(
                right: BorderSide(color: MyColors.border(context), width: 1),
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: context.headlineMedium.copyWith(
              fontWeight: FontWeight.w900,
              color: MyColors.textPrimary(context),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            title,
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
