import 'package:flutter/material.dart';

import '../utils/my_colors.dart';

class MyHelperFunctions {
  MyHelperFunctions._();

  // ============================================================
  // SNACKBAR
  // ============================================================

  static void showSnackBar(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final isDark = isDarkMode(context);

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      duration: duration,

      backgroundColor: isDark
          ? MyColors.surfaceDark
          : MyColors.surfaceLight,

      content: Text(
        message,
        style: TextStyle(
          color: isDark
              ? MyColors.textPrimaryDark
              : MyColors.textPrimaryLight,
          fontWeight: FontWeight.w500,
        ),
      ),

      action: (actionLabel != null && onAction != null)
          ? SnackBarAction(
              label: actionLabel,
              textColor: isDark
                  ? MyColors.blueDark
                  : MyColors.blue,
              onPressed: onAction,
            )
          : null,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  // ============================================================
  // ALERT DIALOG
  // ============================================================

  static Future<T?> showAlertDialog<T>(
    BuildContext context, {
    required String title,
    required String message,
    bool barrierDismissible = true,
    String confirmLabel = 'OK',
    String? cancelLabel,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    final isDark = isDarkMode(context);

    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) {
        return AlertDialog(
          elevation: 6,

          backgroundColor: isDark
              ? MyColors.surfaceDark
              : MyColors.surfaceLight,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          titlePadding: const EdgeInsets.fromLTRB(
            24,
            20,
            24,
            8,
          ),

          contentPadding: const EdgeInsets.fromLTRB(
            24,
            8,
            24,
            16,
          ),

          actionsPadding: const EdgeInsets.only(
            right: 16,
            bottom: 10,
          ),

          title: Text(
            title,
            style: TextStyle(
              color: isDark
                  ? MyColors.textPrimaryDark
                  : MyColors.textPrimaryLight,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Text(
            message,
            style: TextStyle(
              color: isDark
                  ? MyColors.textSecondaryDark
                  : MyColors.textSecondaryLight,
              height: 1.4,
            ),
          ),

          actions: <Widget>[
            if (cancelLabel != null)
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  onCancel?.call();
                },
                child: Text(
                  cancelLabel,
                  style: TextStyle(
                    color: isDark
                        ? MyColors.textSecondaryDark
                        : MyColors.textSecondaryLight,
                  ),
                ),
              ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                onConfirm?.call();
              },

              style: ElevatedButton.styleFrom(
                elevation: 0,

                backgroundColor: isDark
                    ? MyColors.blueDark
                    : MyColors.blue,

                foregroundColor: MyColors.white,

                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              child: Text(
                confirmLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // NAVIGATION
  // ============================================================

  static void navigateToScreen(
    BuildContext context,
    Widget screen,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => screen,
      ),
    );
  }

  // ============================================================
  // TEXT
  // ============================================================

  static String truncateText(
    String text,
    int maxChars, {
    String endWith = '...',
  }) {
    if (text.length <= maxChars) return text;

    return text.substring(0, maxChars) + endWith;
  }

  // ============================================================
  // THEME
  // ============================================================

  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;


  // ============================================================
  // LIST
  // ============================================================

  static List<T> removeDuplicates<T>(
    List<T> list,
  ) =>
      list.toSet().toList();

  // ============================================================
  // WIDGETS
  // ============================================================

  static List<Widget> wrapWidgets(
    List<Widget> widgets,
    int rowSize,
  ) {
    final wrapped = <Widget>[];

    for (int i = 0; i < widgets.length; i += rowSize) {
      wrapped.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widgets
              .sublist(
                i,
                i + rowSize > widgets.length
                    ? widgets.length
                    : i + rowSize,
              )
              .toList(),
        ),
      );
    }

    return wrapped;
  }
}