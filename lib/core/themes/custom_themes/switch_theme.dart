import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class MySwitchTheme {
  MySwitchTheme._();

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static final SwitchThemeData lightSwitchTheme = SwitchThemeData(
    // ------------------------------------------------------------
    // TRACK
    // React: h-[1.15rem] w-8
    // ------------------------------------------------------------
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

    trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),

    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return MyColors.borderLight.withValues(alpha: 0.50);
      }

      if (states.contains(WidgetState.selected)) {
        return MyColors.primaryButtonLight;
      }

      if (states.contains(WidgetState.hovered)) {
        return MyColors.borderLight.withValues(alpha: 0.85);
      }

      return MyColors.borderLight;
    }),

    // ------------------------------------------------------------
    // THUMB
    // React: size-4 = 16px
    // ------------------------------------------------------------
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return MyColors.white.withValues(alpha: 0.65);
      }

      return MyColors.white;
    }),

    // ------------------------------------------------------------
    // INTERACTION
    // ------------------------------------------------------------
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return MyColors.primaryButtonLight.withValues(alpha: 0.12);
      }

      if (states.contains(WidgetState.hovered)) {
        return MyColors.primaryButtonLight.withValues(alpha: 0.06);
      }

      if (states.contains(WidgetState.pressed)) {
        return MyColors.primaryButtonLight.withValues(alpha: 0.12);
      }

      return Colors.transparent;
    }),

    mouseCursor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return SystemMouseCursors.basic;
      }

      return SystemMouseCursors.click;
    }),
  );

  // ============================================================
  // DARK MODE
  // ============================================================

  static final SwitchThemeData darkSwitchTheme = SwitchThemeData(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

    trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),

    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return MyColors.surfaceAltDark.withValues(alpha: 0.50);
      }

      if (states.contains(WidgetState.selected)) {
        return MyColors.primaryButtonDark;
      }

      if (states.contains(WidgetState.hovered)) {
        return MyColors.surfaceAltDark.withValues(alpha: 0.90);
      }

      return MyColors.surfaceAltDark;
    }),

    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return MyColors.foregroundDark.withValues(alpha: 0.60);
      }

      return MyColors.foregroundDark;
    }),

    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return MyColors.primaryButtonDark.withValues(alpha: 0.12);
      }

      if (states.contains(WidgetState.hovered)) {
        return MyColors.primaryButtonDark.withValues(alpha: 0.06);
      }

      if (states.contains(WidgetState.pressed)) {
        return MyColors.primaryButtonDark.withValues(alpha: 0.12);
      }

      return Colors.transparent;
    }),

    mouseCursor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return SystemMouseCursors.basic;
      }

      return SystemMouseCursors.click;
    }),
  );
}
