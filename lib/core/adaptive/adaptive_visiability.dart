import 'package:flutter/widgets.dart';

import 'adaptive_context.dart';
import 'window_size.dart';

/// Shows or hides a widget according to the current window size.
///
/// Use [AdaptiveVisibility] when a component should exist only at certain
/// window sizes.
///
/// Example:
///
/// ```dart
/// AdaptiveVisibility(
///   compact: false,
///   medium: true,
///   expanded: true,
///   child: DesktopSearchBar(),
/// )
/// ```
///
/// This is useful for secondary UI such as:
///
/// - desktop-only search controls
/// - additional filter controls
/// - secondary actions
/// - expanded navigation labels
///
/// Do not use this to replace major structural layouts. Use
/// [AdaptiveLayout] or [AdaptiveBuilder] for those cases.
class AdaptiveVisibility extends StatelessWidget {
  const AdaptiveVisibility({
    super.key,
    required this.child,
    this.compact = true,
    this.medium = true,
    this.expanded = true,
    this.maintainState = false,
    this.maintainAnimation = false,
    this.maintainSize = false,
  });

  /// The widget whose visibility is adaptive.
  final Widget child;

  /// Whether the widget is visible in compact layouts.
  final bool compact;

  /// Whether the widget is visible in medium layouts.
  final bool medium;

  /// Whether the widget is visible in expanded layouts.
  final bool expanded;

  /// Whether the child's state should be preserved while hidden.
  final bool maintainState;

  /// Whether animations should be preserved while hidden.
  final bool maintainAnimation;

  /// Whether the child's layout size should be preserved while hidden.
  final bool maintainSize;

  bool _visible(WindowSize size) {
    return switch (size) {
      WindowSize.compact => compact,
      WindowSize.medium => medium,
      WindowSize.expanded => expanded,
    };
  }

  @override
  Widget build(BuildContext context) {
    final visible = _visible(context.adaptive.windowSize);

    if (visible) {
      return child;
    }

    if (!maintainState && !maintainAnimation && !maintainSize) {
      return const SizedBox.shrink();
    }

    return Visibility(
      visible: false,
      maintainState: maintainState,
      maintainAnimation: maintainAnimation,
      maintainSize: maintainSize,
      child: child,
    );
  }
}