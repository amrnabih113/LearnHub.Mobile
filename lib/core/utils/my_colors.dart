import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  // ============================================================
  // BRAND COLORS
  // ============================================================

  /// LearnHub deep navy
  static const Color navy = Color(0xFF082F49);

  /// LearnHub primary blue
  static const Color blue = Color(0xFF0B5A7A);

  /// LearnHub dark-mode blue
  static const Color blueDark = Color(0xFF3D87AA);

  /// LearnHub accent yellow
  static const Color yellow = Color(0xFFF6AE3C); //#F6AE3C

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static const Color backgroundLight = Color(0xFFF4F7FA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceAltLight = Color(0xFFEBF5FB);

  static const Color foregroundLight = Color(0xFF012248);
  static const Color mutedLight = Color(0xFF576976);

  static const Color borderLight = Color(0x1A012248);

  static const Color inputBackgroundLight = Color(0xFFF0F4F8);

  // ============================================================
  // DARK MODE
  // ============================================================

  static const Color backgroundDark = Color(0xFF0C1722);
  static const Color surfaceDark = Color(0xFF142333);
  static const Color surfaceAltDark = Color(0xFF1C3042);

  static const Color foregroundDark = Color(0xFFEEF3F7);
  static const Color mutedDark = Color(0xFF95A9B7);

  static const Color borderDark = Color(0x16FFFFFF);

  // ============================================================
  // TEXT
  // ============================================================

  static const Color textPrimaryLight = Color(0xFF01324A); //#01324A
  static const Color textSecondaryLight = Color(0xFF576976);

  static const Color textPrimaryDark = Color(0xFFEEF3F7);
  static const Color textSecondaryDark = Color(0xFF95A9B7);

  static const Color textWhite = Color(0xFFFFFFFF);

  // ============================================================
  // BUTTONS
  // ============================================================

  /// Primary actions use the LearnHub accent yellow.
  static const Color primaryButtonLight = blue;
  static const Color primaryButtonDark = blueDark;

  /// Text displayed on yellow buttons.
  static const Color primaryButtonText = textWhite;

  static const Color accentButton = Color(0xFFF2B84B);
  static const Color accentButtonText = Color(0xFF082F49);

  // ============================================================
  // SECONDARY
  // ============================================================

  static const Color secondaryLight = Color(0xFFEBF5FB);
  static const Color secondaryDark = Color(0xFF1C3042);

  // ============================================================
  // NAVIGATION
  // ============================================================

  static const Color navLight = Color(0xFFFFFFFF);
  static const Color navDark = Color(0xFF142333);

  static const Color navTextLight = Color(0xFF012248);
  static const Color navTextDark = Color(0xFFEEF3F7);

  // ============================================================
  // SIDEBAR / ADMIN
  // ============================================================

  static const Color sidebarLight = Color(0xFFFFFFFF);
  static const Color sidebarDark = Color(0xFF0A141E);

  static const Color sidebarAccent = Color(0xFFF2B84B);

  // ============================================================
  // SEMANTIC COLORS
  // ============================================================

  // ------------------------------------------------------------
  // SUCCESS
  // ------------------------------------------------------------

  static const Color success = Color(0xFF2E8B57);
  static const Color successDark = Color(0xFF47A56E);

  static const Color successBackground = Color(0xFFE4F3EA);
  static const Color successBackgroundDark = Color(0x262E8B57);

  // ------------------------------------------------------------
  // WARNING
  // ------------------------------------------------------------

  static const Color warning = Color(0xFFD18A24);
  static const Color warningDark = Color(0xFFE3A83B);

  static const Color warningBackground = Color(0xFFFFF3D6);
  static const Color warningBackgroundDark = Color(0x26D18A24);

  // ------------------------------------------------------------
  // ERROR
  // ------------------------------------------------------------

  static const Color error = Color(0xFFD94A4A);
  static const Color errorDark = Color(0xFFEF6B6B);

  static const Color errorBackground = Color(0xFFFCE4E4);
  static const Color errorBackgroundDark = Color(0x26D94A4A);

  // ------------------------------------------------------------
  // INFO
  // ------------------------------------------------------------

  static const Color info = Color(0xFF1677A8);
  static const Color infoDark = Color(0xFF55A9D0);

  static const Color infoBackground = Color(0xFFE1F1F8);
  static const Color infoBackgroundDark = Color(0x261677A8);

  // ============================================================
  // SUBSCRIPTION COLORS
  // ============================================================

  /// Pro subscription
  static const Color pro = Color(0xFF5513F0);
  static const Color proDark = Color(0xFFA78BFA);

  static const Color proBackground = Color.fromARGB(255, 193, 179, 255);
  static const Color proBackgroundDark = Color(0x268B5CF6);

  /// Premium subscription
  static const Color premium = Color(0xFFB8871E);
  static const Color premiumDark = Color(0xFFF2B84B);

  static const Color premiumBackground = Color(0xFFFFF8E8);
  static const Color premiumBackgroundDark = Color(0x26F2B84B);

  // ============================================================
  // CHART COLORS
  // ============================================================

  static const Color chart1Light = Color(0xFFF2B84B);
  static const Color chart2Light = Color(0xFF0B5A7A);
  static const Color chart3Light = Color(0xFF2E8B57);
  static const Color chart4Light = Color(0xFF8B5CF6);
  static const Color chart5Light = Color(0xFFD94A4A);

  static const Color chart1Dark = Color(0xFFF2B84B);
  static const Color chart2Dark = Color(0xFF3D87AA);
  static const Color chart3Dark = Color(0xFF47A56E);
  static const Color chart4Dark = Color(0xFFA78BFA);
  static const Color chart5Dark = Color(0xFFEF6B6B);

  // ============================================================
  // NEUTRALS
  // ============================================================

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  static const Color transparent = Colors.transparent;

  // ============================================================
  // HELPERS
  // ============================================================

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color background(BuildContext context) =>
      isDark(context) ? backgroundDark : backgroundLight;

  static Color surface(BuildContext context) =>
      isDark(context) ? surfaceDark : surfaceLight;

  static Color surfaceAlt(BuildContext context) =>
      isDark(context) ? surfaceAltDark : surfaceAltLight;

  static Color textPrimary(BuildContext context) =>
      isDark(context) ? textPrimaryDark : textPrimaryLight;

  static Color textSecondary(BuildContext context) =>
      isDark(context) ? textSecondaryDark : textSecondaryLight;

  static Color border(BuildContext context) =>
      isDark(context) ? borderDark : borderLight;

  /// LearnHub brand blue.
  ///
  /// Light mode → blue
  /// Dark mode → blueDark
  static Color primary(BuildContext context) =>
      isDark(context) ? blueDark : blue;

  static Color secondary(BuildContext context) =>
      isDark(context) ? secondaryDark : secondaryLight;

  // ============================================================
  // SUBSCRIPTION HELPERS
  // ============================================================

  static Color proColor(BuildContext context) =>
      isDark(context) ? proDark : pro;

  static Color premiumColor(BuildContext context) =>
      isDark(context) ? premiumDark : premium;

  // ============================================================
  // SEMANTIC HELPERS
  // ============================================================

  static Color successColor(BuildContext context) =>
      isDark(context) ? successDark : success;

  static Color warningColor(BuildContext context) =>
      isDark(context) ? warningDark : warning;

  static Color errorColor(BuildContext context) =>
      isDark(context) ? errorDark : error;

  static Color infoColor(BuildContext context) =>
      isDark(context) ? infoDark : info;
}
