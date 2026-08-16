import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/my_sizes_extensions.dart';
import '../../utils/my_colors.dart';

class MyTextTheme {
  MyTextTheme._();

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static TextTheme getLightTextTheme(BuildContext context, Locale? locale) {
    return TextTheme(
      // ==========================================================
      // DISPLAY
      // ==========================================================
      displayLarge: GoogleFonts.lato(
        fontSize: context.displayXl,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryLight,
      ),

      displayMedium: GoogleFonts.lato(
        fontSize: context.displayLg,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryLight,
      ),

      displaySmall: GoogleFonts.lato(
        fontSize: context.displayMd,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryLight,
      ),

      // ==========================================================
      // HEADLINES
      // ==========================================================
      headlineLarge: GoogleFonts.lato(
        fontSize: context.headlineXl,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryLight,
      ),

      headlineMedium: GoogleFonts.lato(
        fontSize: context.headlineLg,
        fontWeight: FontWeight.w600,
        color: MyColors.textPrimaryLight,
      ),

      headlineSmall: GoogleFonts.lato(
        fontSize: context.headlineMd,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight,
      ),

      // ==========================================================
      // TITLES
      // ==========================================================
      titleLarge: GoogleFonts.lato(
        fontSize: context.titleLg,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryLight,
      ),

      titleMedium: GoogleFonts.lato(
        fontSize: context.titleMd,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryLight,
      ),

      titleSmall: GoogleFonts.lato(
        fontSize: context.titleSm,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight,
      ),

      // ==========================================================
      // BODY
      // ==========================================================
      bodyLarge: GoogleFonts.lato(
        fontSize: context.bodyLg,
        fontWeight: FontWeight.w500,
        color: MyColors.textSecondaryLight,
      ),

      bodyMedium: GoogleFonts.lato(
        fontSize: context.bodyMd,
        fontWeight: FontWeight.normal,
        color: MyColors.textSecondaryLight,
      ),

      bodySmall: GoogleFonts.lato(
        fontSize: context.bodySm,
        fontWeight: FontWeight.w500,
        color: MyColors.textSecondaryLight.withValues(alpha: 0.6),
      ),

      // ==========================================================
      // LABELS
      // ==========================================================
      labelLarge: GoogleFonts.lato(
        fontSize: context.labelLg,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight,
      ),

      labelMedium: GoogleFonts.lato(
        fontSize: context.labelMd,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight,
      ),

      labelSmall: GoogleFonts.lato(
        fontSize: context.labelSm,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight.withValues(alpha: 0.6),
      ),
    );
  }

  // ============================================================
  // DARK MODE
  // ============================================================

  static TextTheme getDarkTextTheme(BuildContext context, Locale? locale) {
    return TextTheme(
      // ==========================================================
      // DISPLAY
      // ==========================================================
      displayLarge: GoogleFonts.lato(
        fontSize: context.displayXl,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryDark,
      ),

      displayMedium: GoogleFonts.lato(
        fontSize: context.displayLg,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryDark,
      ),

      displaySmall: GoogleFonts.lato(
        fontSize: context.displayMd,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryDark,
      ),

      // ==========================================================
      // HEADLINES
      // ==========================================================
      headlineLarge: GoogleFonts.lato(
        fontSize: context.headlineXl,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryDark,
      ),

      headlineMedium: GoogleFonts.lato(
        fontSize: context.headlineLg,
        fontWeight: FontWeight.w600,
        color: MyColors.textPrimaryDark,
      ),

      headlineSmall: GoogleFonts.lato(
        fontSize: context.headlineMd,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryDark,
      ),

      // ==========================================================
      // TITLES
      // ==========================================================
      titleLarge: GoogleFonts.lato(
        fontSize: context.titleLg,
        fontWeight: FontWeight.w600,
        color: MyColors.textPrimaryDark,
      ),

      titleMedium: GoogleFonts.lato(
        fontSize: context.titleMd,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryDark,
      ),

      titleSmall: GoogleFonts.lato(
        fontSize: context.titleSm,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryDark,
      ),

      // ==========================================================
      // BODY
      // ==========================================================
      bodyLarge: GoogleFonts.lato(
        fontSize: context.bodyLg,
        fontWeight: FontWeight.w500,
        color: MyColors.textSecondaryDark,
      ),

      bodyMedium: GoogleFonts.lato(
        fontSize: context.bodyMd,
        fontWeight: FontWeight.normal,
        color: MyColors.textSecondaryDark,
      ),

      bodySmall: GoogleFonts.lato(
        fontSize: context.bodySm,
        fontWeight: FontWeight.w500,
        color: MyColors.textSecondaryDark.withValues(alpha: 0.6),
      ),

      // ==========================================================
      // LABELS
      // ==========================================================
      labelLarge: GoogleFonts.lato(
        fontSize: context.labelLg,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryDark,
      ),

      labelMedium: GoogleFonts.lato(
        fontSize: context.labelMd,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryDark,
      ),

      labelSmall: GoogleFonts.lato(
        fontSize: context.labelSm,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryDark.withValues(alpha: 0.6),
      ),
    );
  }
}
