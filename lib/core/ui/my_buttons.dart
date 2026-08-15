import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/text_theme_extension.dart';

import '../utils/my_colors.dart';

class MyButtons {
  MyButtons._();
  static Widget primary({
    required VoidCallback? onPressed,
    required Widget child,
  }) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }

  static Widget accent({
    required VoidCallback? onPressed,
    required Widget child,
    BuildContext? context,
  }) {
    final isDark = context != null ? MyColors.isDark(context) : false;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.accentButton,
        foregroundColor: isDark
            ? MyColors.textPrimaryLight
            : MyColors.textPrimaryLight,
        disabledBackgroundColor: MyColors.accentButton.withValues(alpha: 0.6),
        disabledForegroundColor: MyColors.textPrimaryLight.withValues(
          alpha: 0.6,
        ),
        textStyle: context != null
            ? context.titleSmall
            : TextStyle(fontWeight: FontWeight.bold),
      ),
      child: child,
    );
  }
}
