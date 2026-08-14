import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';

import '../../utils/my_colors.dart';

class MyElevationButtonTheme {
  MyElevationButtonTheme._();

  // ============================================================
  // LIGHT MODE
  // ============================================================

  static ElevatedButtonThemeData lightElevatedButtonTheme(
    BuildContext context,
  ) {
    final double fontSize = context.bodyMd;

    return ElevatedButtonThemeData(
      style: ButtonStyle(
        // --------------------------------------------------------
        // SIZE
        // React default:
        // h-9 px-4 py-2
        // --------------------------------------------------------
        minimumSize: const WidgetStatePropertyAll(Size(0, 36)),

        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),

        // --------------------------------------------------------
        // COLORS
        // --------------------------------------------------------
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return MyColors.primaryButtonLight.withValues(alpha: 0.50);
          }

          if (states.contains(WidgetState.hovered)) {
            return MyColors.primaryButtonLight.withValues(alpha: 0.90);
          }

          if (states.contains(WidgetState.pressed)) {
            return MyColors.primaryButtonLight.withValues(alpha: 0.85);
          }

          return MyColors.primaryButtonLight;
        }),

        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return MyColors.primaryButtonText.withValues(alpha: 0.50);
          }

          return MyColors.primaryButtonText;
        }),

        elevation: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return 2;
          }

          return 5;
        }),

        shadowColor: const WidgetStatePropertyAll(Colors.transparent),

        // --------------------------------------------------------
        // BORDER
        // --------------------------------------------------------
        side: const WidgetStatePropertyAll(BorderSide.none),

        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),

        // --------------------------------------------------------
        // TYPOGRAPHY
        // text-sm font-medium
        // --------------------------------------------------------
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
        ),

        // --------------------------------------------------------
        // FOCUS / HOVER OVERLAY
        // --------------------------------------------------------
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return MyColors.primaryButtonLight.withValues(alpha: 0.12);
          }

          if (states.contains(WidgetState.hovered)) {
            return Colors.white.withValues(alpha: 0.06);
          }

          if (states.contains(WidgetState.pressed)) {
            return Colors.black.withValues(alpha: 0.08);
          }

          return Colors.transparent;
        }),

        // --------------------------------------------------------
        // MOUSE CURSOR
        // --------------------------------------------------------
        mouseCursor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return SystemMouseCursors.basic;
          }

          return SystemMouseCursors.click;
        }),
      ),
    );
  }

  // ============================================================
  // DARK MODE
  // ============================================================

  static ElevatedButtonThemeData darkElevatedButtonTheme(BuildContext context) {
    final double fontSize = context.bodyMd;

    return ElevatedButtonThemeData(
      style: ButtonStyle(
        // --------------------------------------------------------
        // SIZE
        // --------------------------------------------------------
        minimumSize: const WidgetStatePropertyAll(Size(0, 36)),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),

        // --------------------------------------------------------
        // COLORS
        // --------------------------------------------------------
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return MyColors.primaryButtonDark.withValues(alpha: 0.50);
          }

          if (states.contains(WidgetState.hovered)) {
            return MyColors.primaryButtonDark.withValues(alpha: 0.90);
          }

          if (states.contains(WidgetState.pressed)) {
            return MyColors.primaryButtonDark.withValues(alpha: 0.85);
          }

          return MyColors.primaryButtonDark;
        }),

        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return MyColors.primaryButtonText.withValues(alpha: 0.50);
          }

          return MyColors.primaryButtonText;
        }),

        // --------------------------------------------------------
        // SHADOW
        // --------------------------------------------------------
        elevation: WidgetStateProperty.resolveWith((states) {
          return 0;
        }),

        shadowColor: const WidgetStatePropertyAll(Colors.transparent),

        // --------------------------------------------------------
        // BORDER
        // --------------------------------------------------------
        side: const WidgetStatePropertyAll(BorderSide.none),

        // --------------------------------------------------------
        // SHAPE
        // --------------------------------------------------------
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),

        // --------------------------------------------------------
        // TYPOGRAPHY
        // --------------------------------------------------------
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
        ),

        // --------------------------------------------------------
        // INTERACTION
        // --------------------------------------------------------
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return MyColors.primaryButtonDark.withValues(alpha: 0.12);
          }

          if (states.contains(WidgetState.hovered)) {
            return Colors.white.withValues(alpha: 0.06);
          }

          if (states.contains(WidgetState.pressed)) {
            return Colors.black.withValues(alpha: 0.12);
          }

          return Colors.transparent;
        }),

        mouseCursor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return SystemMouseCursors.basic;
          }

          return SystemMouseCursors.click;
        }),
      ),
    );
  }
}
