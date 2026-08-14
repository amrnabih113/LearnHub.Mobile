import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  // ============================================================
  // BRAND COLORS
  // ============================================================

  /// LearnHub deep navy
  static const Color navy = Color(0xFF01324A);

  /// LearnHub primary blue
  static const Color blue = Color(0xFF024F70);

  /// LearnHub dark-mode blue
  static const Color blueDark = Color(0xFF3B8DC0);

  /// LearnHub accent yellow
  static const Color yellow = Color(0xFFF5B238);

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static const Color backgroundLight = Color(0xFFF4F7FA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceAltLight = Color(0xFFEEF4F7);

  static const Color foregroundLight = Color(0xFF01324A);
  static const Color mutedLight = Color(0xFF576976);

  static const Color borderLight = Color(0xFFE2E8F0);

  static const Color inputBackgroundLight = Color(0xFFEEF2F7);

  // ============================================================
  // DARK MODE
  // ============================================================

  static const Color backgroundDark = Color(0xFF0B1116);
  static const Color surfaceDark = Color(0xFF101A21);
  static const Color surfaceAltDark = Color(0xFF1B2D38);

  static const Color foregroundDark = Color(0xFFF0F6FA);
  static const Color mutedDark = Color(0xFFA9BAC4);

  static const Color borderDark = Color(0xFF29404C);

  // ============================================================
  // TEXT
  // ============================================================

  static const Color textPrimaryLight = Color(0xFF01324A);
  static const Color textSecondaryLight = Color(0xFF576976);

  static const Color textPrimaryDark = Color(0xFFF0F6FA);
  static const Color textSecondaryDark = Color(0xFFA9BAC4);

  static const Color textWhite = Color(0xFFFFFFFF);

  // ============================================================
  // BUTTONS
  // ============================================================

  static const Color primaryButtonLight = Color(0xFF024F70);
  static const Color primaryButtonDark = Color(0xFF3B8DC0);

  static const Color primaryButtonText = Color(0xFFFFFFFF);

  static const Color accentButton = Color(0xFFF5B238);
  static const Color accentButtonText = Color(0xFF01324A);

  // ============================================================
  // SECONDARY
  // ============================================================

  static const Color secondaryLight = Color(0xFFE8F1F6);
  static const Color secondaryDark = Color(0xFF1B2D38);

  // ============================================================
  // NAVIGATION
  // ============================================================

  static const Color navLight = Color(0xFFFFFFFF);
  static const Color navDark = Color(0xFF0F1E27);

  static const Color navTextLight = Color(0xFF01324A);
  static const Color navTextDark = Color(0xFFF0F6FA);

  // ============================================================
  // SIDEBAR / ADMIN
  // ============================================================

  static const Color sidebarLight = Color(0xFF01324A);
  static const Color sidebarDark = Color(0xFF0F1E27);

  static const Color sidebarAccent = Color(0xFFF5B238);

  // ============================================================
  // SEMANTIC COLORS
  // ============================================================

  static const Color success = Color(0xFF16A34A);
  static const Color successDark = Color(0xFF22C55E);

  static const Color successBackground = Color(0xFFDCFCE7);
  static const Color successBackgroundDark = Color(0x2E16A34A);

  static const Color warning = Color(0xFFD97706);
  static const Color warningDark = Color(0xFFF59E0B);

  static const Color warningBackground = Color(0xFFFEF3C7);
  static const Color warningBackgroundDark = Color(0x2ED97706);

  static const Color error = Color(0xFFDC2626);
  static const Color errorDark = Color(0xFFEF4444);

  static const Color errorBackground = Color(0xFFFEE2E2);
  static const Color errorBackgroundDark = Color(0x2EDC2626);

  static const Color info = Color(0xFF0284C7);
  static const Color infoDark = Color(0xFF38BDF8);

  static const Color infoBackground = Color(0xFFE0F2FE);
  static const Color infoBackgroundDark = Color(0x2E0369A1);

  // ============================================================
  // SUBSCRIPTION COLORS
  // ============================================================

  /// Pro subscription
  static const Color pro = Color(0xFF7C3AED);
  static const Color proDark = Color(0xFFA78BFA);

  static const Color proBackground = Color(0xFFEDE9FE);
  static const Color proBackgroundDark = Color(0x2E7C3AED);

  /// Premium subscription
  static const Color premium = Color(0xFFB45309);
  static const Color premiumDark = Color(0xFFD97706);

  static const Color premiumBackground = Color(0xFFFEF3C7);
  static const Color premiumBackgroundDark = Color(0x2EB45309);

  // ============================================================
  // CHART COLORS
  // ============================================================

  static const Color chart1Light = Color(0xFF024F70);
  static const Color chart2Light = Color(0xFFF5B238);
  static const Color chart3Light = Color(0xFF16A34A);
  static const Color chart4Light = Color(0xFF01324A);
  static const Color chart5Light = Color(0xFF7C3AED);

  static const Color chart1Dark = Color(0xFF3B8DC0);
  static const Color chart2Dark = Color(0xFFF5B238);
  static const Color chart3Dark = Color(0xFF34D399);
  static const Color chart4Dark = Color(0xFFA78BFA);
  static const Color chart5Dark = Color(0xFFFB7185);

  // ============================================================
  // NEUTRALS
  // ============================================================

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  static const Color transparent = Colors.transparent;

  // ============================================================
  // HELPERS
  // ============================================================

  static Color background(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? backgroundDark
          : backgroundLight;

  static Color surface(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? surfaceDark
          : surfaceLight;

  static Color surfaceAlt(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? surfaceAltDark
          : surfaceAltLight;

  static Color textPrimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? textPrimaryDark
          : textPrimaryLight;

  static Color textSecondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? textSecondaryDark
          : textSecondaryLight;

  static Color border(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? borderDark
          : borderLight;

  static Color primary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? blueDark
          : blue;

  static Color secondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? secondaryDark
          : secondaryLight;

  // ============================================================
  // SUBSCRIPTION HELPERS
  // ============================================================

  static Color proColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? proDark
          : pro;

  static Color premiumColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? premiumDark
          : premium;

  // ============================================================
  // SEMANTIC HELPERS
  // ============================================================

  static Color successColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? successDark
          : success;

  static Color warningColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? warningDark
          : warning;

  static Color errorColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? errorDark
          : error;

  static Color infoColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? infoDark
          : info;
}