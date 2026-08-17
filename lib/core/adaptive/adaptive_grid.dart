import 'package:flutter/widgets.dart';

/// A responsive grid that determines its column count from the available
/// width.
///
/// [AdaptiveGrid] is useful for collections such as:
///
/// - Course cards
/// - Category cards
/// - Instructor cards
/// - Dashboard cards
/// - Learning resources
///
/// Example:
///
/// ```dart
/// AdaptiveGrid(
///   minItemWidth: 280,
///   children: courses
///       .map((course) => CourseCard(course: course))
///       .toList(),
/// )
/// ```
///
/// The grid does not depend on phone/tablet/desktop classifications.
/// Instead, it uses the actual width available to the grid.
///
/// This means the same widget behaves correctly when:
///
/// - A tablet changes orientation.
/// - A desktop browser is resized.
/// - A web application is displayed in a narrow window.
/// - A desktop sidebar reduces the available content width.
class AdaptiveGrid extends StatelessWidget {
  const AdaptiveGrid({
    super.key,
    required this.children,
    this.minItemWidth = 280,
    this.maxItemWidth,
    this.spacing = 16,
    this.runSpacing = 16,
    this.padding = EdgeInsets.zero,
    this.physics,
    this.shrinkWrap = false,
    this.childAspectRatio,
    this.itemHeight,
  });
  final double? itemHeight;
  final double? childAspectRatio;

  /// Items displayed by the grid.
  final List<Widget> children;

  /// Minimum desired width for each item.
  ///
  /// The grid calculates the number of columns based on this value.
  final double minItemWidth;

  /// Optional maximum width for each item.
  ///
  /// When provided, the grid will avoid making individual items wider than
  /// this value where possible.
  final double? maxItemWidth;

  /// Horizontal spacing between grid items.
  final double spacing;

  /// Vertical spacing between grid rows.
  final double runSpacing;

  /// Padding around the entire grid.
  final EdgeInsetsGeometry padding;

  /// Scroll physics used by the underlying grid.
  final ScrollPhysics? physics;

  /// Whether the grid should shrink-wrap its vertical extent.
  final bool shrinkWrap;

  int _calculateColumns(double availableWidth) {
    if (children.isEmpty) {
      return 1;
    }

    final usableWidth = availableWidth - padding.horizontal;

    if (usableWidth <= minItemWidth) {
      return 1;
    }

    final columns = ((usableWidth + spacing) / (minItemWidth + spacing))
        .floor();

    return columns.clamp(1, children.length);
  }

  double _calculateItemWidth(double availableWidth, int columns) {
    final usableWidth = availableWidth - padding.horizontal;
    final totalSpacing = spacing * (columns - 1);

    final width = (usableWidth - totalSpacing) / columns;

    if (maxItemWidth != null) {
      return width > maxItemWidth! ? maxItemWidth! : width;
    }

    return width;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;

        final columns = _calculateColumns(availableWidth);

        final itemWidth = _calculateItemWidth(availableWidth, columns);

        return GridView.builder(
          padding: padding,
          physics: physics,
          shrinkWrap: shrinkWrap,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisExtent: itemHeight ?? itemWidth * 1.25,
            crossAxisSpacing: spacing,
            mainAxisSpacing: runSpacing,
            childAspectRatio: itemWidth / (itemWidth * 0.75),
          ),
          itemCount: children.length,
          itemBuilder: (context, index) {
            return children[index];
          },
        );
      },
    );
  }
}
