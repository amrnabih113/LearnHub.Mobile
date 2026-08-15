import 'package:flutter/foundation.dart';

/// Centralized breakpoints used by LearnHub's adaptive UI system.
///
/// Breakpoints are based on the available window width, not the physical
/// device type. This is important for responsive web windows, tablet
/// split-screen mode, and different orientations.
///
/// The breakpoints should be used through the adaptive system rather than
/// hardcoded throughout feature widgets.
@immutable
class AdaptiveBreakpoints {
  const AdaptiveBreakpoints._();

  /// Width below which the layout is considered compact.
  ///
  /// Typical use:
  /// - Phones
  /// - Narrow browser windows
  /// - Compact layouts
  static const double compact = 600;

  /// Width at which the layout enters the medium range.
  ///
  /// Typical use:
  /// - Tablets
  /// - Larger mobile landscape layouts
  static const double medium = 840;

  /// Width at which the layout enters the expanded range.
  ///
  /// Typical use:
  /// - Large tablets
  /// - Smaller desktop/browser windows
  static const double expanded = 1200;

  /// Optional large-screen reference point.
  ///
  /// This is not a separate WindowSize by itself. It can be used by
  /// components that need to distinguish large desktop layouts.
  static const double large = 1440;
}