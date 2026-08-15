import 'package:flutter/widgets.dart';
import 'adaptive_value.dart';

/// Constrains and centers application content according to the available
/// window width.
///
/// Use [AdaptiveContent] for page-level content that should remain readable
/// on large desktop and web screens.
///
/// Example:
///
/// ```dart
/// AdaptiveContent(
///   child: Column(
///     children: [
///       const PageHeader(),
///       const CourseSection(),
///     ],
///   ),
/// )
/// ```
///
/// On compact screens, the content uses the available width with the
/// configured horizontal padding.
///
/// On larger screens, the content is centered and constrained by [maxWidth].
///
/// Use this for page/content boundaries, not for every individual widget.
/// For grids of items, prefer [AdaptiveGrid].
class AdaptiveContent extends StatelessWidget {
  const AdaptiveContent({
    super.key,
    required this.child,
    this.maxWidth = 1440,
    this.padding,
    this.alignment = Alignment.topCenter,
  });

  /// The content displayed inside the adaptive container.
  final Widget child;

  /// Maximum width of the content on larger screens.
  final double maxWidth;

  /// Optional horizontal/vertical padding around the content.
  ///
  /// If omitted, a responsive padding is selected automatically.
  final EdgeInsetsGeometry? padding;

  /// Alignment of the constrained content.
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    final resolvedPadding = padding ??
        EdgeInsets.symmetric(
          horizontal: context.adaptiveValue<double>(
            compact: 16,
            medium: 24,
            expanded: 32,
          ),
        );

    return Align(
      alignment: alignment,
      child: Padding(
        padding: resolvedPadding,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: SizedBox(
            width: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }
}