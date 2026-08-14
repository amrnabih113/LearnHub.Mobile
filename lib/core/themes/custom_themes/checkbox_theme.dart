import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MyCheckboxTheme {
  MyCheckboxTheme._();

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static final lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),

    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return MyColors.white;
      }

      return MyColors.textPrimaryLight;
    }),

    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return MyColors.primaryButtonLight;
      }

      return Colors.transparent;
    }),

    side: const BorderSide(
      color: MyColors.borderLight,
      width: 1.5,
    ),
  );

  // ============================================================
  // DARK MODE
  // ============================================================

  static final darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),

    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return MyColors.white;
      }

      return MyColors.textPrimaryDark;
    }),

    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return MyColors.primaryButtonDark;
      }

      return Colors.transparent;
    }),

    side: const BorderSide(
      color: MyColors.borderDark,
      width: 1.5,
    ),
  );
}