import 'package:flutter/material.dart';
import '../../extensions/my_sizes_extensions.dart';

import '../../utils/my_colors.dart';

class MyTextFieldTheme {
  MyTextFieldTheme._();

  // ============================================================
  // BORDER HELPER
  // ============================================================

  static OutlineInputBorder _border({
    Color color = MyColors.borderLight,
    double width = 1,
    double radius = 15,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static InputDecorationThemeData lightInputDecorationThemeData(
    BuildContext context,
  ) {
    final padding = context.spaceMd - 5;
    final iconSize = context.spaceXl;
    final fontSize = context.bodyMd;
    final borderRadius = context.radiusSm;

    return InputDecorationThemeData(
      fillColor: MyColors.inputBackgroundLight,
      filled: true,

      errorMaxLines: 3,

      prefixIconColor: MyColors.textPrimaryLight,
      suffixIconColor: MyColors.textPrimaryLight,
      iconColor: MyColors.textPrimaryLight,

      constraints: BoxConstraints(minHeight: iconSize),

      prefixIconConstraints: BoxConstraints(
        minWidth: iconSize,
        minHeight: iconSize,
      ),

      suffixIconConstraints: BoxConstraints(
        minWidth: iconSize,
        minHeight: iconSize,
      ),

      contentPadding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: padding,
      ),

      labelStyle: TextStyle(
        fontSize: fontSize,
        color: MyColors.textPrimaryLight,
      ),

      hintStyle: TextStyle(
        fontSize: fontSize,
        color: MyColors.textSecondaryLight,
      ),

      errorStyle: const TextStyle(
        fontStyle: FontStyle.normal,
        color: MyColors.error,
      ),

      floatingLabelStyle: TextStyle(
        color: MyColors.textPrimaryLight.withValues(alpha: 0.8),
      ),

      border: _border(color: MyColors.borderLight, radius: borderRadius),

      enabledBorder: _border(color: MyColors.borderLight, radius: borderRadius),

      focusedBorder: _border(
        color: MyColors.blue,
        width: 2,
        radius: borderRadius,
      ),

      errorBorder: _border(
        color: MyColors.error,
        width: 1,
        radius: borderRadius,
      ),

      focusedErrorBorder: _border(
        color: MyColors.error,
        width: 2,
        radius: borderRadius,
      ),
    );
  }

  // ============================================================
  // DARK MODE
  // ============================================================

  static InputDecorationThemeData darkInputDecorationThemeData(
    BuildContext context,
  ) {
    final padding = context.spaceMd - 5;
    final iconSize = context.spaceXl;
    final fontSize = context.bodyMd;
    final borderRadius = context.radiusSm;

    return InputDecorationThemeData(
      fillColor: MyColors.surfaceAltDark,
      filled: true,

      errorMaxLines: 3,

      prefixIconColor: MyColors.textPrimaryDark,
      suffixIconColor: MyColors.textPrimaryDark,
      iconColor: MyColors.textPrimaryDark,

      constraints: BoxConstraints(minHeight: iconSize),

      prefixIconConstraints: BoxConstraints(
        minWidth: iconSize,
        minHeight: iconSize,
      ),

      suffixIconConstraints: BoxConstraints(
        minWidth: iconSize,
        minHeight: iconSize,
      ),

      contentPadding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: padding,
      ),

      labelStyle: TextStyle(
        fontSize: fontSize,
        color: MyColors.textPrimaryDark,
      ),

      hintStyle: TextStyle(
        fontSize: fontSize,
        color: MyColors.textSecondaryDark,
      ),

      errorStyle: const TextStyle(
        fontStyle: FontStyle.normal,
        color: MyColors.errorDark,
      ),

      floatingLabelStyle: TextStyle(
        color: MyColors.textPrimaryDark.withValues(alpha: 0.8),
      ),

      border: _border(color: MyColors.borderDark, radius: borderRadius),

      enabledBorder: _border(color: MyColors.borderDark, radius: borderRadius),

      focusedBorder: _border(
        color: MyColors.blueDark,
        width: 2,
        radius: borderRadius,
      ),

      errorBorder: _border(
        color: MyColors.errorDark,
        width: 1,
        radius: borderRadius,
      ),

      focusedErrorBorder: _border(
        color: MyColors.errorDark,
        width: 2,
        radius: borderRadius,
      ),
    );
  }
}
