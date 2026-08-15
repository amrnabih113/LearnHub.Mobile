import 'package:flutter/material.dart';
import 'adaptive_context.dart';
import 'window_size.dart';
import '../navigation/adaptive_navigation_bar.dart';
import '../navigation/adaptive_navigation_rail.dart';
import '../navigation/adaptive_sidebar.dart';
import '../navigation/destinations.dart';


/// The presentation used by [AdaptiveNavigation].
enum AdaptiveNavigationType {
  /// Mobile bottom navigation.
  bar,

  /// Tablet side navigation.
  rail,

  /// Desktop expanded sidebar.
  sidebar,
}

/// Selects the appropriate LearnHub navigation presentation.
///
/// The widget itself does not perform routing. The parent owns the selected
/// destination and provides [onDestinationSelected].
///
/// The navigation presentation is:
///
/// ```text
/// Compact
///     ↓
/// NavigationBar
///
/// Medium
///     ↓
/// NavigationRail
///
/// Expanded
///     ↓
/// Desktop Sidebar
/// ```
///
/// Example:
///
/// ```dart
/// AdaptiveNavigation(
///   destinations: LearnHubNavigation.primary,
///   selectedIndex: selectedIndex,
///   onDestinationSelected: onDestinationSelected,
/// )
/// ```
///
/// For tablet layouts, [railExtended] controls whether labels appear beside
/// the rail icons.
///
/// For advanced layouts, [type] can be provided to explicitly select the
/// navigation presentation.
class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.type,
    this.railExtended = false,
    this.sidebarWidth = 260,
    this.sidebarHeader,
    this.sidebarFooter,
    this.backgroundColor,
    this.elevation,
    this.railLeading,
    this.railTrailing,
  });

  /// Navigation destinations shared by all adaptive presentations.
  final List<LearnHubNavigationDestination> destinations;

  /// Currently selected destination index.
  final int selectedIndex;

  /// Called when a destination is selected.
  final ValueChanged<int> onDestinationSelected;

  /// Explicitly selects a navigation presentation.
  ///
  /// When null, the presentation is determined automatically from the
  /// current window size.
  final AdaptiveNavigationType? type;

  /// Whether the tablet rail displays labels beside its icons.
  final bool railExtended;

  /// Width of the desktop sidebar.
  final double sidebarWidth;

  /// Optional desktop sidebar header.
  final Widget? sidebarHeader;

  /// Optional desktop sidebar footer.
  final Widget? sidebarFooter;

  /// Shared background color.
  final Color? backgroundColor;

  /// Shared elevation.
  final double? elevation;

  /// Optional tablet rail leading widget.
  final Widget? railLeading;

  /// Optional tablet rail trailing widget.
  final Widget? railTrailing;

  AdaptiveNavigationType _resolveType(BuildContext context) {
    if (type != null) {
      return type!;
    }

    return switch (context.adaptive.windowSize) {
      // Mobile / narrow web window.
      WindowSize.compact => AdaptiveNavigationType.bar,

      // Tablet / medium window.
      WindowSize.medium => AdaptiveNavigationType.rail,

      // Desktop / expanded web window.
      WindowSize.expanded => AdaptiveNavigationType.sidebar,
    };
  }

  @override
  Widget build(BuildContext context) {
    final resolvedType = _resolveType(context);

    switch (resolvedType) {
      case AdaptiveNavigationType.bar:
        return AdaptiveNavigationBar(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          backgroundColor: backgroundColor,
          elevation: elevation,
        );

      case AdaptiveNavigationType.rail:
        return AdaptiveNavigationRail(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          extended: railExtended,
          backgroundColor: backgroundColor,
          elevation: elevation,
          leading: railLeading,
          trailing: railTrailing,
        );

      case AdaptiveNavigationType.sidebar:
        return AdaptiveSidebar(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          width: sidebarWidth,
          header: sidebarHeader,
          footer: sidebarFooter,
          backgroundColor: backgroundColor,
        );
    }
  }
}