import 'package:flutter/material.dart';
import 'adaptive_navigation.dart';
import '../navigation/destinations.dart';

import 'adaptive_content.dart';
import 'adaptive_context.dart';
import 'window_size.dart';


/// Provides the responsive structural shell for authenticated/application
/// pages.
///
/// [AdaptiveAppShell] combines:
///
/// - Mobile bottom navigation
/// - Tablet NavigationRail
/// - Desktop sidebar
/// - Page content
/// - Optional content constraints
///
/// The shell does not own application routing. The parent supplies the
/// currently selected destination and handles navigation.
///
/// Example:
///
/// ```dart
/// AdaptiveAppShell(
///   destinations: LearnHubNavigation.primary,
///   selectedIndex: selectedIndex,
///   onDestinationSelected: onDestinationSelected,
///   child: const HomePage(),
/// )
/// ```
///
/// Layout behavior:
///
/// ```text
/// Compact
/// ┌──────────────────────────┐
/// │                          │
/// │         CONTENT          │
/// │                          │
/// ├──────────────────────────┤
/// │      NavigationBar       │
/// └──────────────────────────┘
///
/// Medium
/// ┌──────┬───────────────────┐
/// │ Rail │                   │
/// │      │      CONTENT      │
/// │      │                   │
/// └──────┴───────────────────┘
///
/// Expanded
/// ┌──────────────┬───────────┐
/// │   Sidebar    │           │
/// │              │  CONTENT  │
/// │              │           │
/// └──────────────┴───────────┘
/// ```
///
/// Use this for the main authenticated/application experience.
///
/// Do not use this shell for a web-only landing page. The landing page
/// should have its own web presentation without application navigation.
class AdaptiveAppShell extends StatelessWidget {
  const AdaptiveAppShell({
    super.key,
    required this.child,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.constrainContent = true,
    this.contentMaxWidth = 1440,
    this.navigation,
    this.backgroundColor,
    this.navigationBackgroundColor,
    this.sidebarWidth = 260,
    this.sidebarHeader,
    this.sidebarFooter,
    this.railLeading,
    this.railTrailing,
    this.railExtended,
    this.mobileNavigationHeight,
  });

  /// The page displayed inside the application shell.
  final Widget child;

  /// Primary application destinations.
  final List<LearnHubNavigationDestination> destinations;

  /// Currently selected navigation destination.
  final int selectedIndex;

  /// Called when the user selects a destination.
  final ValueChanged<int> onDestinationSelected;

  /// Whether page content should be constrained by [contentMaxWidth].
  final bool constrainContent;

  /// Maximum width of the page content on large screens.
  final double contentMaxWidth;

  /// Optional custom navigation implementation.
  ///
  /// If supplied, it replaces the default [AdaptiveNavigation].
  final Widget? navigation;

  /// Main shell background color.
  final Color? backgroundColor;

  /// Navigation background color.
  final Color? navigationBackgroundColor;

  /// Desktop sidebar width.
  final double sidebarWidth;

  /// Desktop sidebar header.
  final Widget? sidebarHeader;

  /// Desktop sidebar footer.
  final Widget? sidebarFooter;

  /// Tablet rail leading widget.
  final Widget? railLeading;

  /// Tablet rail trailing widget.
  final Widget? railTrailing;

  /// Whether the tablet NavigationRail displays labels.
  ///
  /// When null, the shell determines this automatically.
  final bool? railExtended;

  /// Optional mobile navigation height.
  final double? mobileNavigationHeight;

  bool _shouldExtendRail(BuildContext context) {
    if (railExtended != null) {
      return railExtended!;
    }

    // A medium window can still be fairly narrow.
    //
    // Keep the default tablet rail compact and only extend it when there is
    // enough horizontal space.
    return context.adaptive.width >= 1000;
  }

  Widget _buildNavigation(BuildContext context) {
    return AdaptiveNavigation(
      destinations: destinations,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      railExtended: _shouldExtendRail(context),
      sidebarWidth: sidebarWidth,
      sidebarHeader: sidebarHeader,
      sidebarFooter: sidebarFooter,
      backgroundColor: navigationBackgroundColor,
      railLeading: railLeading,
      railTrailing: railTrailing,
    );
  }

  Widget _buildContent(BuildContext context) {
    if (!constrainContent) {
      return child;
    }

    return AdaptiveContent(
      maxWidth: contentMaxWidth,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final windowSize = context.adaptive.windowSize;
    final resolvedNavigation = navigation ?? _buildNavigation(context);

    switch (windowSize) {
      case WindowSize.compact:
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            bottom: false,
            child: _buildContent(context),
          ),
          bottomNavigationBar: SafeArea(
            top: false,
            child: SizedBox(
              height: mobileNavigationHeight,
              child: resolvedNavigation,
            ),
          ),
        );

      case WindowSize.medium:
      case WindowSize.expanded:
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: Row(
              children: [
                resolvedNavigation,
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                ),
                Expanded(
                  child: _buildContent(context),
                ),
              ],
            ),
          ),
        );
    }
  }
}