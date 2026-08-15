import 'package:flutter/widgets.dart';

import 'adaptive_context.dart';
import 'window_size.dart';

/// Resolves a value according to the current available window size.
///
/// Use [AdaptiveValue] when the widget structure remains the same but one
/// or more values need to change between compact, medium, and expanded
/// layouts.
///
/// Example:
///
/// ```dart
/// final padding = AdaptiveValue<double>(
///   compact: 16,
///   medium: 24,
///   expanded: 32,
/// ).resolve(context);
///
/// Padding(
///   padding: EdgeInsets.all(padding),
///   child: child,
/// )
/// ```
///
/// Prefer this over manually checking MediaQuery width throughout the UI.
///
/// Do not use [AdaptiveValue] when the entire widget structure needs to
/// change. Use [AdaptiveBuilder] or [AdaptiveLayout] instead.
class AdaptiveValue<T> {
  const AdaptiveValue({
    required this.compact,
    this.medium,
    this.expanded,
  });

  /// Value used for compact layouts.
  final T compact;

  /// Value used for medium layouts.
  ///
  /// When omitted, [compact] is used.
  final T? medium;

  /// Value used for expanded layouts.
  ///
  /// When omitted, [medium] is used if available; otherwise [compact]
  /// is used.
  final T? expanded;

  /// Resolves the appropriate value for the current [BuildContext].
  T resolve(BuildContext context) {
    return switch (context.adaptive.windowSize) {
      WindowSize.compact => compact,
      WindowSize.medium => medium ?? compact,
      WindowSize.expanded => expanded ?? medium ?? compact,
    };
  }
}

/// Convenience extensions for resolving adaptive values directly from
/// [BuildContext].
extension AdaptiveValueBuildContextX on BuildContext {
  /// Resolves an adaptive value for the current window size.
  ///
  /// Example:
  ///
  /// ```dart
  /// final padding = context.adaptiveValue(
  ///   compact: 16.0,
  ///   medium: 24.0,
  ///   expanded: 32.0,
  /// );
  /// ```
  T adaptiveValue<T>({
    required T compact,
    T? medium,
    T? expanded,
  }) {
    return AdaptiveValue<T>(
      compact: compact,
      medium: medium,
      expanded: expanded,
    ).resolve(this);
  }
}