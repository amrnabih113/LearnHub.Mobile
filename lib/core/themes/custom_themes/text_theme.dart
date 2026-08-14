import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extensions/my_sizes_extensions.dart';
import '../../utils/my_colors.dart';

class MyTextTheme {
  MyTextTheme._();

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static TextTheme getLightTextTheme(
    BuildContext context,
    Locale? locale,
  ) {
    return TextTheme(
      // ==========================================================
      // DISPLAY
      // ==========================================================

      displayLarge: GoogleFonts.inter(
        fontSize: context.displayXl,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryLight,
      ),

      displayMedium: GoogleFonts.inter(
        fontSize: context.displayLg,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryLight,
      ),

      displaySmall: GoogleFonts.inter(
        fontSize: context.displayMd,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryLight,
      ),

      // ==========================================================
      // HEADLINES
      // ==========================================================

      headlineLarge: GoogleFonts.inter(
        fontSize: context.headlineXl,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryLight,
      ),

      headlineMedium: GoogleFonts.inter(
        fontSize: context.headlineLg,
        fontWeight: FontWeight.w600,
        color: MyColors.textPrimaryLight,
      ),

      headlineSmall: GoogleFonts.inter(
        fontSize: context.headlineMd,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight,
      ),

      // ==========================================================
      // TITLES
      // ==========================================================

      titleLarge: GoogleFonts.inter(
        fontSize: context.titleLg,
        fontWeight: FontWeight.w600,
        color: MyColors.textPrimaryLight,
      ),

      titleMedium: GoogleFonts.inter(
        fontSize: context.titleMd,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight,
      ),

      titleSmall: GoogleFonts.inter(
        fontSize: context.titleSm,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight,
      ),

      // ==========================================================
      // BODY
      // ==========================================================

      bodyLarge: GoogleFonts.inter(
        fontSize: context.bodyLg,
        fontWeight: FontWeight.w500,
        color: MyColors.textSecondaryLight,
      ),

      bodyMedium: GoogleFonts.inter(
        fontSize: context.bodyMd,
        fontWeight: FontWeight.normal,
        color: MyColors.textSecondaryLight,
      ),

      bodySmall: GoogleFonts.inter(
        fontSize: context.bodySm,
        fontWeight: FontWeight.w500,
        color: MyColors.textSecondaryLight.withValues(alpha: 0.6),
      ),

      // ==========================================================
      // LABELS
      // ==========================================================

      labelLarge: GoogleFonts.inter(
        fontSize: context.labelLg,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight,
      ),

      labelMedium: GoogleFonts.inter(
        fontSize: context.labelMd,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight,
      ),

      labelSmall: GoogleFonts.inter(
        fontSize: context.labelSm,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryLight.withValues(alpha: 0.6),
      ),
    );
  }

  // ============================================================
  // DARK MODE
  // ============================================================

  static TextTheme getDarkTextTheme(
    BuildContext context,
    Locale? locale,
  ) {
    return TextTheme(
      // ==========================================================
      // DISPLAY
      // ==========================================================

      displayLarge: GoogleFonts.inter(
        fontSize: context.displayXl,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryDark,
      ),

      displayMedium: GoogleFonts.inter(
        fontSize: context.displayLg,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryDark,
      ),

      displaySmall: GoogleFonts.inter(
        fontSize: context.displayMd,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryDark,
      ),

      // ==========================================================
      // HEADLINES
      // ==========================================================

      headlineLarge: GoogleFonts.inter(
        fontSize: context.headlineXl,
        fontWeight: FontWeight.bold,
        color: MyColors.textPrimaryDark,
      ),

      headlineMedium: GoogleFonts.inter(
        fontSize: context.headlineLg,
        fontWeight: FontWeight.w600,
        color: MyColors.textPrimaryDark,
      ),

      headlineSmall: GoogleFonts.inter(
        fontSize: context.headlineMd,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryDark,
      ),

      // ==========================================================
      // TITLES
      // ==========================================================

      titleLarge: GoogleFonts.inter(
        fontSize: context.titleLg,
        fontWeight: FontWeight.w600,
        color: MyColors.textPrimaryDark,
      ),

      titleMedium: GoogleFonts.inter(
        fontSize: context.titleMd,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryDark,
      ),

      titleSmall: GoogleFonts.inter(
        fontSize: context.titleSm,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryDark,
      ),

      // ==========================================================
      // BODY
      // ==========================================================

      bodyLarge: GoogleFonts.inter(
        fontSize: context.bodyLg,
        fontWeight: FontWeight.w500,
        color: MyColors.textSecondaryDark,
      ),

      bodyMedium: GoogleFonts.inter(
        fontSize: context.bodyMd,
        fontWeight: FontWeight.normal,
        color: MyColors.textSecondaryDark,
      ),

      bodySmall: GoogleFonts.inter(
        fontSize: context.bodySm,
        fontWeight: FontWeight.w500,
        color: MyColors.textSecondaryDark.withValues(alpha: 0.6),
      ),

      // ==========================================================
      // LABELS
      // ==========================================================

      labelLarge: GoogleFonts.inter(
        fontSize: context.labelLg,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryDark,
      ),

      labelMedium: GoogleFonts.inter(
        fontSize: context.labelMd,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryDark,
      ),

      labelSmall: GoogleFonts.inter(
        fontSize: context.labelSm,
        fontWeight: FontWeight.w500,
        color: MyColors.textPrimaryDark.withValues(alpha: 0.6),
      ),
    );
  }
}