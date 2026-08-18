import 'package:flutter/material.dart';
import '../../../../core/extensions/text_theme_extension.dart';
import '../../../../core/utils/my_colors.dart';

class FilterTitle extends StatelessWidget {
  const FilterTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.bodyMedium.copyWith(
        fontWeight: FontWeight.w700,
        color: MyColors.textPrimary(context),
      ),
    );
  }
}
