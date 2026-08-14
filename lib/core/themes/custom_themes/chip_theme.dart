import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MyChipTheme {
  MyChipTheme._();

  // ============================================================
  // LIGHT MODE
  // ============================================================
  static final lightChipTheme = ChipThemeData(
    backgroundColor: MyColors.surfaceAltLight,
    disabledColor: MyColors.borderLight.withValues(alpha: 0.6),

    // Normal chip label
    labelStyle: const TextStyle(color: MyColors.textPrimaryLight),

    // Selected chip label
    secondaryLabelStyle: const TextStyle(color: MyColors.white),

    selectedColor: MyColors.primaryButtonLight,

    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

    checkmarkColor: MyColors.white,

    side: const BorderSide(color: MyColors.borderLight, width: 1),
  );
  // ============================================================
  // DARK MODE
  // ============================================================

  static final darkChipTheme = ChipThemeData(
    backgroundColor: MyColors.surfaceAltDark,
    disabledColor: MyColors.borderDark.withValues(alpha: 0.6),

    labelStyle: const TextStyle(color: MyColors.textPrimaryDark),

    selectedColor: MyColors.primaryButtonDark,

    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

    checkmarkColor: MyColors.white,

    side: const BorderSide(color: MyColors.borderDark, width: 1),
  );
}
