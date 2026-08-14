import 'package:flutter/material.dart';
import '../../extensions/my_sizes_extensions.dart';

import '../../utils/my_colors.dart';

class MyDropdownMenuTheme {
  MyDropdownMenuTheme._();

  // ============================================================
  // DROPDOWN MENU
  // ============================================================

  static DropdownMenuThemeData lightDropdownMenuTheme(BuildContext context) {
    final fontSize = context.bodyMd;

    return DropdownMenuThemeData(
      // ----------------------------------------------------------
      // CONTENT
      // ----------------------------------------------------------
      menuStyle: MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(MyColors.surfaceLight),

        elevation: const WidgetStatePropertyAll(6),

        shadowColor: WidgetStatePropertyAll(
          MyColors.black.withValues(alpha: 0.12),
        ),

        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            side: BorderSide(color: MyColors.borderLight, width: 1),
          ),
        ),

        // React: p-1
        padding: const WidgetStatePropertyAll(EdgeInsets.all(4)),

        // React: min-w-[8rem]
        minimumSize: const WidgetStatePropertyAll(Size(128, 0)),
      ),

      // ----------------------------------------------------------
      // TRIGGER
      // ----------------------------------------------------------
      inputDecorationTheme: InputDecorationTheme(
        fillColor: MyColors.inputBackgroundLight,
        filled: true,

        errorMaxLines: 3,

        prefixIconColor: MyColors.textPrimaryLight,
        suffixIconColor: MyColors.textPrimaryLight,
        iconColor: MyColors.textPrimaryLight,

        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

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

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: MyColors.borderLight, width: 1),
        ),

        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: MyColors.borderLight, width: 1),
        ),

        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: MyColors.primaryButtonLight,
            width: 1.5,
          ),
        ),

        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: MyColors.error),
        ),

        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: MyColors.error, width: 1.5),
        ),
      ),

      textStyle: TextStyle(
        fontSize: fontSize,
        color: MyColors.textPrimaryLight,
      ),
    );
  }

  // ============================================================
  // DARK MODE
  // ============================================================

  static DropdownMenuThemeData darkDropdownMenuTheme(BuildContext context) {
    final fontSize = context.bodyMd;

    return DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(MyColors.surfaceDark),

        elevation: const WidgetStatePropertyAll(6),

        shadowColor: WidgetStatePropertyAll(
          MyColors.black.withValues(alpha: 0.35),
        ),

        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            side: BorderSide(color: MyColors.borderDark, width: 1),
          ),
        ),

        padding: const WidgetStatePropertyAll(EdgeInsets.all(4)),

        minimumSize: const WidgetStatePropertyAll(Size(128, 0)),
      ),

      // ----------------------------------------------------------
      // TRIGGER
      // ----------------------------------------------------------
      inputDecorationTheme: InputDecorationTheme(
        fillColor: MyColors.inputBackgroundLight,
        filled: true,

        errorMaxLines: 3,

        prefixIconColor: MyColors.textPrimaryDark,
        suffixIconColor: MyColors.textPrimaryDark,
        iconColor: MyColors.textPrimaryDark,

        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

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

        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: MyColors.borderDark, width: 1),
        ),

        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: MyColors.borderDark, width: 1),
        ),

        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: MyColors.primaryButtonDark, width: 1.5),
        ),

        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: MyColors.errorDark),
        ),

        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(color: MyColors.errorDark, width: 1.5),
        ),
      ),

      textStyle: TextStyle(fontSize: fontSize, color: MyColors.textPrimaryDark),
    );
  }

  // ============================================================
  // POPUP MENU
  // ============================================================

  static PopupMenuThemeData lightPopupMenuTheme(BuildContext context) {
    return PopupMenuThemeData(
      color: MyColors.surfaceLight,
      elevation: 6,

      shadowColor: MyColors.black.withValues(alpha: 0.12),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        side: BorderSide(color: MyColors.borderLight, width: 1),
      ),

      // React: p-1
      menuPadding: const EdgeInsets.all(4),

      textStyle: TextStyle(
        fontSize: context.bodyMd,
        color: MyColors.textPrimaryLight,
      ),
    );
  }

  static PopupMenuThemeData darkPopupMenuTheme(BuildContext context) {
    return PopupMenuThemeData(
      color: MyColors.surfaceDark,
      elevation: 6,

      shadowColor: MyColors.black.withValues(alpha: 0.35),

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        side: BorderSide(color: MyColors.borderDark, width: 1),
      ),

      menuPadding: const EdgeInsets.all(4),

      textStyle: TextStyle(
        fontSize: context.bodyMd,
        color: MyColors.textPrimaryDark,
      ),
    );
  }

  // ============================================================
  // MENU ITEMS
  // ============================================================

  static MenuThemeData lightMenuTheme(BuildContext context) {
    return MenuThemeData(
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return MyColors.surfaceLight.withValues(alpha: 0.50);
          }

          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused)) {
            return MyColors.surfaceAltLight;
          }

          return MyColors.surfaceLight;
        }),

        // React: px-2 py-1.5
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),

        // React: rounded-sm
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),

        elevation: const WidgetStatePropertyAll(0),

        // React: disabled:opacity-50
        surfaceTintColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused)) {
            return MyColors.surfaceAltLight;
          }

          return Colors.transparent;
        }),
      ),
    );
  }

  static MenuThemeData darkMenuTheme(BuildContext context) {
    return MenuThemeData(
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return MyColors.surfaceDark.withValues(alpha: 0.50);
          }

          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused)) {
            return MyColors.surfaceAltDark;
          }

          return MyColors.surfaceDark;
        }),

        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),

        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),

        elevation: const WidgetStatePropertyAll(0),

        surfaceTintColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused)) {
            return MyColors.surfaceAltDark;
          }

          return Colors.transparent;
        }),
      ),
    );
  }
}
