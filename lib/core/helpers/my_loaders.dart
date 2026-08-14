import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/my_colors.dart';
import 'my_helper_functions.dart';

class MyLoaders {
  MyLoaders._();

  // ============================================================
  // SNACKBAR
  // ============================================================

  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  // ============================================================
  // CUSTOM TOAST
  // ============================================================

  static void customToast({
    required BuildContext context,
    required String message,
  }) {
    final isDark = MyHelperFunctions.isDarkMode(context);

    final backgroundColor = isDark
        ? MyColors.surfaceAltDark.withValues(alpha: 0.95)
        : MyColors.surfaceLight.withValues(alpha: 0.98);

    final textColor = isDark
        ? MyColors.textPrimaryDark
        : MyColors.textPrimaryLight;

    final borderColor = isDark
        ? MyColors.borderDark
        : MyColors.borderLight;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: backgroundColor,
              border: Border.all(
                color: borderColor,
              ),
              boxShadow: [
                BoxShadow(
                  color: MyColors.black.withValues(
                    alpha: isDark ? 0.25 : 0.08,
                  ),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                          color: textColor,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }

  // ============================================================
  // SUCCESS
  // ============================================================

  static void successSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    _showCustomOverlay(
      context,
      title: title,
      message: message,
      icon: Iconsax.tick_circle,
      backgroundColor: MyColors.successColor(context),
      duration: duration,
    );
  }

  // ============================================================
  // WARNING
  // ============================================================

  static void warningSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    _showCustomOverlay(
      context,
      title: title,
      message: message,
      icon: Iconsax.warning_2,
      backgroundColor: MyColors.warningColor(context),
      duration: duration,
    );
  }

  // ============================================================
  // ERROR
  // ============================================================

  static void errorSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    _showCustomOverlay(
      context,
      title: title,
      message: message,
      icon: Iconsax.close_circle,
      backgroundColor: MyColors.errorColor(context),
      duration: duration,
    );
  }

  // ============================================================
  // CUSTOM OVERLAY
  // ============================================================

  static void _showCustomOverlay(
    BuildContext context, {
    required String title,
    required String message,
    required IconData icon,
    required Color backgroundColor,
    int duration = 2,
  }) {
    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (context) {
        final textTheme = Theme.of(context).textTheme;

        return Positioned(
          bottom: 20,
          left: 16,
          right: 16,
          child: Material(
            color: Colors.transparent,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 200),
              offset: Offset.zero,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.black.withValues(alpha: 0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // ==================================================
                    // ICON
                    // ==================================================

                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: MyColors.white.withValues(alpha: 0.14),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        color: MyColors.white,
                        size: 18,
                      ),
                    ),

                    const SizedBox(width: 12),

                    // ==================================================
                    // CONTENT
                    // ==================================================

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: textTheme.bodyLarge?.copyWith(
                              color: MyColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          if (message.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              message,
                              style: textTheme.bodySmall?.copyWith(
                                color: MyColors.white.withValues(
                                  alpha: 0.95,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry);

    Future.delayed(Duration(seconds: duration)).then((_) {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}