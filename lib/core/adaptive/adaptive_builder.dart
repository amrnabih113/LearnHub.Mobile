import 'package:flutter/widgets.dart';

import 'adaptive_context.dart';
import 'window_size.dart';

/// Builds different widgets according to the available window size.
///
/// Use [AdaptiveBuilder] when the structure of a widget needs to change
/// between compact, medium, and expanded layouts.
///
/// This is useful when the layouts are related but require custom logic.
///
/// Example:
///
/// ```dart
/// AdaptiveBuilder(
///   builder: (context, windowSize) {
///     return switch (windowSize) {
///       WindowSize.compact => const MobileView(),
///       WindowSize.medium => const TabletView(),
///       WindowSize.expanded => const DesktopView(),
///     };
///   },
/// )
/// ```
///
/// Use [AdaptiveLayout] instead when you simply need a straightforward
/// mobile/tablet/desktop selection.
///
/// Do not use this widget only to change a small value such as padding,
/// spacing, or icon size. Use [AdaptiveValue] for those cases.
class AdaptiveBuilder extends StatelessWidget {
  const AdaptiveBuilder({
    super.key,
    required this.builder,
  });

  /// Builds the widget for the current [WindowSize].
  final Widget Function(
    BuildContext context,
    WindowSize windowSize,
  ) builder;

  @override
  Widget build(BuildContext context) {
    final windowSize = context.adaptive.windowSize;

    return builder(context, windowSize);
  }
}