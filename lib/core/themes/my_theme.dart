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

      //  --primary
      primaryColor: MyColors.blue,

      scaffoldBackgroundColor: MyColors.backgroundLight,

      colorScheme: const ColorScheme.light(
        //  --primary
        primary: MyColors.blue,

        //  --primary-foreground
        onPrimary: MyColors.foregroundDark,

        //  --secondary
        secondary: MyColors.secondaryLight,

        //  --secondary-foreground
        onSecondary: MyColors.blue,

        //  --card
        surface: MyColors.surfaceLight,

        //  --card-foreground
        onSurface: MyColors.foregroundLight,

        //  --destructive
        error: MyColors.error,

        //  --destructive-foreground
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

      //  --primary
      primaryColor: MyColors.blueDark,

      scaffoldBackgroundColor: MyColors.backgroundDark,

      colorScheme: const ColorScheme.dark(
        //  --primary
        primary: MyColors.blueDark,
        
      

        //  --primary-foreground
        onPrimary: MyColors.foregroundDark,

        //  --secondary
        secondary: MyColors.secondaryDark,

        //  --secondary-foreground
        onSecondary: MyColors.textSecondaryDark,

        //  --card
        surface: MyColors.surfaceDark,

        //  --card-foreground
        onSurface: MyColors.foregroundDark,

        //  --destructive
        error: MyColors.errorDark,

        //  --destructive-foreground
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
        color: MyColors.yellow,
        circularTrackColor: MyColors.secondaryDark,
        linearTrackColor: MyColors.secondaryDark,
        linearMinHeight: 8,
        borderRadius: BorderRadius.all(Radius.circular(4)),
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
