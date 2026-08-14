import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MyAppBarTheme {
  MyAppBarTheme._();

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: MyColors.navLight,
    surfaceTintColor: Colors.transparent,

    iconTheme: IconThemeData(
      color: MyColors.navTextLight,
      size: 24,
    ),

    actionsIconTheme: IconThemeData(
      color: MyColors.navTextLight,
      size: 24,
    ),

    titleTextStyle: TextStyle(
      color: MyColors.textPrimaryLight,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
  );

  // ============================================================
  // DARK MODE
  // ============================================================

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: MyColors.navDark,
    surfaceTintColor: Colors.transparent,

    iconTheme: IconThemeData(
      color: MyColors.navTextDark,
      size: 24,
    ),

    actionsIconTheme: IconThemeData(
      color: MyColors.navTextDark,
      size: 24,
    ),

    titleTextStyle: TextStyle(
      color: MyColors.textPrimaryDark,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
  );
}