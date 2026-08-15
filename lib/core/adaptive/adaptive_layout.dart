import 'package:flutter/widgets.dart';

import 'adaptive_context.dart';
import 'window_size.dart';

/// Selects a layout according to the available window size.
///
/// [AdaptiveLayout] is intended for major structural differences between
/// compact, medium, and expanded layouts.
///
/// Example:
///
/// ```dart
/// AdaptiveLayout(
///   compact: const MobileHome(),
///   medium: const TabletHome(),
///   expanded: const DesktopHome(),
/// )
/// ```
///
/// If [medium] is not provided, the compact layout is used for medium
/// windows as a fallback.
///
/// If [expanded] is not provided, the medium layout is used when available;
/// otherwise the compact layout is used.
///
/// Use [AdaptiveLayout] when the actual structure of the UI changes.
///
/// For smaller differences such as padding, spacing, or icon size, prefer
/// [AdaptiveValue].
///
/// For custom breakpoint logic, prefer [AdaptiveBuilder].
class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.compact,
    this.medium,
    required this.expanded,
  });

  /// Layout used for compact windows.
  ///
  /// Typically used for phones and narrow windows.
  final Widget compact;

  /// Layout used for medium windows.
  ///
  /// Typically used for tablets.
  ///
  /// If omitted, [compact] is used.
  final Widget? medium;

  /// Layout used for expanded windows.
  ///
  /// Typically used for desktop and large-screen layouts.
  final Widget expanded;

  @override
  Widget build(BuildContext context) {
    return switch (context.adaptive.windowSize) {
      WindowSize.compact => compact,
      WindowSize.medium => medium ?? compact,
      WindowSize.expanded => expanded,
    };
  }
}