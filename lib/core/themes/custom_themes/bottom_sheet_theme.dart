import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MyBottomSheetTheme {
  MyBottomSheetTheme._();

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static const lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: MyColors.surfaceLight,
    modalBackgroundColor: MyColors.surfaceLight,

    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
  );

  // ============================================================
  // DARK MODE
  // ============================================================

  static const darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: MyColors.surfaceDark,
    modalBackgroundColor: MyColors.surfaceDark,

    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
  );
}