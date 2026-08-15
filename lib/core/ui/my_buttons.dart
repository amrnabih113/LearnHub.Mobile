import 'package:flutter/material.dart';

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
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.accentButton,
        foregroundColor: MyColors.textPrimaryLight,
        disabledBackgroundColor: MyColors.accentButton.withValues(alpha: 0.6),
        disabledForegroundColor: MyColors.textPrimaryLight.withValues(
          alpha: 0.6,
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      child: child,
    );
  }
}
