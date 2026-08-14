import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MyOutlinedButtonTheme {
  MyOutlinedButtonTheme._();

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static const OutlinedButtonThemeData lightTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(MyColors.primaryButtonLight),

      backgroundColor: WidgetStatePropertyAll(Colors.transparent),

      side: WidgetStatePropertyAll(
        BorderSide(color: MyColors.primaryButtonLight, width: 1.0),
      ),

      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
      ),

      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),

      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
      ),
    ),
  );

  // ============================================================
  // DARK MODE
  // ============================================================

  static const OutlinedButtonThemeData darkTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(MyColors.primaryButtonDark),

      backgroundColor: WidgetStatePropertyAll(Colors.transparent),

      side: WidgetStatePropertyAll(
        BorderSide(color: MyColors.primaryButtonDark, width: 1.0),
      ),

      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
      ),

      textStyle: WidgetStatePropertyAll(
        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
      ),

      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
      ),
    ),
  );
}
