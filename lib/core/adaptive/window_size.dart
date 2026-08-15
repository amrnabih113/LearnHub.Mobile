import 'adaptive_breakpoints.dart';

/// Describes the amount of horizontal space currently available to the
/// application.
///
/// This is intentionally separate from the physical device type.
///
/// For example, a tablet running in split-screen mode may have a compact
/// window size, while a desktop browser may temporarily be resized to a
/// medium window size.
enum WindowSize {
  /// Compact layouts, typically phones and narrow windows.
  compact,

  /// Medium layouts, typically tablets and medium-sized windows.
  medium,

  /// Expanded layouts, typically desktop and large tablet layouts.
  expanded,
}

/// Extensions for [WindowSize].
extension WindowSizeX on WindowSize {
  /// Whether this is a compact layout.
  bool get isCompact => this == WindowSize.compact;

  /// Whether this is a medium layout.
  bool get isMedium => this == WindowSize.medium;

  /// Whether this is an expanded layout.
  bool get isExpanded => this == WindowSize.expanded;

  /// Resolves a [WindowSize] from the available width.
  static WindowSize fromWidth(double width) {
    if (width < AdaptiveBreakpoints.compact) {
      return WindowSize.compact;
    }

    if (width < AdaptiveBreakpoints.expanded) {
      return WindowSize.medium;
    }

    return WindowSize.expanded;
  }
}