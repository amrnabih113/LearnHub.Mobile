import 'package:flutter/material.dart';

import '../utils/my_colors.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/dropdown_menu_theme.dart';
import 'custom_themes/elevation_button_theme.dart';
import 'custom_themes/outlined_buttom_theme.dart';
import 'custom_themes/switch_theme.dart';
import 'custom_themes/text_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class MyTheme {
  MyTheme._();

  // ============================================================
  // LIGHT THEME
  // ============================================================

  static ThemeData lightTheme(BuildContext context, Locale? locale) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // ----------------------------------------------------------
      // COLORS
      // ----------------------------------------------------------
      primaryColor: MyColors.blue,

      scaffoldBackgroundColor: MyColors.backgroundLight,

      colorScheme: const ColorScheme.light(
        primary: MyColors.blue,
        onPrimary: MyColors.white,

        secondary: MyColors.yellow,
        onSecondary: MyColors.foregroundLight,

        surface: MyColors.surfaceLight,
        onSurface: MyColors.foregroundLight,

        error: MyColors.error,
        onError: MyColors.white,
      ),

      // ----------------------------------------------------------
      // TYPOGRAPHY
      // ----------------------------------------------------------
      textTheme: MyTextTheme.getLightTextTheme(context, locale),

      // ----------------------------------------------------------
      // COMPONENT THEMES
      // ----------------------------------------------------------
      appBarTheme: MyAppBarTheme.lightAppBarTheme,

      bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,

      checkboxTheme: MyCheckboxTheme.lightCheckboxTheme,

      chipTheme: MyChipTheme.lightChipTheme,

      switchTheme: MySwitchTheme.lightSwitchTheme,

      elevatedButtonTheme: MyElevationButtonTheme.lightElevatedButtonTheme(
        context,
      ),

      outlinedButtonTheme: MyOutlinedButtonTheme.lightTheme,

      textButtonTheme: MyTextButtonTheme.lightTextButtonTheme(context),

      inputDecorationTheme: MyTextFieldTheme.lightInputDecorationThemeData(
        context,
      ),

      dropdownMenuTheme: MyDropdownMenuTheme.lightDropdownMenuTheme(context),

      popupMenuTheme: MyDropdownMenuTheme.lightPopupMenuTheme(context),

      menuTheme: MyDropdownMenuTheme.lightMenuTheme(context),

      // ----------------------------------------------------------
      // PROGRESS INDICATORS
      // ----------------------------------------------------------
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: MyColors.yellow,
        linearTrackColor: MyColors.surfaceAltLight,
        linearMinHeight: 8,
        circularTrackColor: MyColors.surfaceAltLight,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      // ----------------------------------------------------------
      // DIVIDERS
      // ----------------------------------------------------------
      dividerTheme: const DividerThemeData(
        color: MyColors.borderLight,
        thickness: 1,
        space: 1,
      ),

      // ----------------------------------------------------------
      // ICONS
      // ----------------------------------------------------------
      iconTheme: const IconThemeData(color: MyColors.foregroundLight),
    );
  }

  // ============================================================
  // DARK THEME
  // ============================================================

  static ThemeData darkTheme(BuildContext context, Locale? locale) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // ----------------------------------------------------------
      // COLORS
      // ----------------------------------------------------------
      primaryColor: MyColors.blueDark,

      scaffoldBackgroundColor: MyColors.backgroundDark,

      colorScheme: const ColorScheme.dark(
        primary: MyColors.blueDark,
        onPrimary: MyColors.white,

        secondary: MyColors.yellow,
        onSecondary: MyColors.foregroundDark,

        surface: MyColors.surfaceDark,
        onSurface: MyColors.foregroundDark,

        error: MyColors.errorDark,
        onError: MyColors.white,
      ),

      // ----------------------------------------------------------
      // TYPOGRAPHY
      // ----------------------------------------------------------
      textTheme: MyTextTheme.getDarkTextTheme(context, locale),

      // ----------------------------------------------------------
      // COMPONENT THEMES
      // ----------------------------------------------------------
      appBarTheme: MyAppBarTheme.darkAppBarTheme,

      bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,

      checkboxTheme: MyCheckboxTheme.darkCheckboxTheme,

      chipTheme: MyChipTheme.darkChipTheme,

      switchTheme: MySwitchTheme.darkSwitchTheme,

      elevatedButtonTheme: MyElevationButtonTheme.darkElevatedButtonTheme(
        context,
      ),

      outlinedButtonTheme: MyOutlinedButtonTheme.darkTheme,

      textButtonTheme: MyTextButtonTheme.darkTextButtonTheme(context),

      inputDecorationTheme: MyTextFieldTheme.darkInputDecorationThemeData(
        context,
      ),

      dropdownMenuTheme: MyDropdownMenuTheme.darkDropdownMenuTheme(context),

      popupMenuTheme: MyDropdownMenuTheme.darkPopupMenuTheme(context),

      menuTheme: MyDropdownMenuTheme.darkMenuTheme(context),

      // ----------------------------------------------------------
      // PROGRESS INDICATORS
      // ----------------------------------------------------------
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: MyColors.blueDark,
        circularTrackColor: MyColors.secondaryDark,
      ),

      // ----------------------------------------------------------
      // DIVIDERS
      // ----------------------------------------------------------
      dividerTheme: const DividerThemeData(
        color: MyColors.borderDark,
        thickness: 1,
        space: 1,
      ),

      // ----------------------------------------------------------
      // ICONS
      // ----------------------------------------------------------
      iconTheme: const IconThemeData(color: MyColors.foregroundDark),
    );
  }
}
