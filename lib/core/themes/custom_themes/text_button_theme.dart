import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';

import '../../utils/my_colors.dart';

class MyTextButtonTheme {
  MyTextButtonTheme._();

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static TextButtonThemeData lightTextButtonTheme(BuildContext context) {
    final double fontSize = context.bodyMd;

    final double verticalPadding = context.spaceMd - 5;

    final double horizontalPadding = context.spaceLg;

    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: MyColors.primaryButtonLight,

        disabledForegroundColor: MyColors.primaryButtonLight.withValues(
          alpha: 0.45,
        ),

        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),

        textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }

  // ============================================================
  // DARK MODE
  // ============================================================

  static TextButtonThemeData darkTextButtonTheme(BuildContext context) {
    final double fontSize = context.bodyMd;

    final double verticalPadding = context.spaceMd - 5;

    final double horizontalPadding = context.spaceLg;
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: MyColors.primaryButtonDark,

        disabledForegroundColor: MyColors.primaryButtonDark.withValues(
          alpha: 0.45,
        ),

        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),

        textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}
