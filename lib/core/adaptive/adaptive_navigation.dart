import 'package:flutter/material.dart';

import 'adaptive_context.dart';
import 'window_size.dart';

import '../../features/navigation/adaptive_navigation_bar.dart';
import '../../features/navigation/adaptive_navigation_rail.dart';
import '../../features/navigation/adaptive_sidebar.dart';
import '../../features/navigation/destinations.dart';

enum AdaptiveNavigationType { bar, rail, sidebar }

class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.desktopPrimary = const [],
    this.desktopSecondary = const [],
    this.desktopProfile,
    this.selectedDestination,
    this.onDesktopDestinationSelected,
    this.type,
    this.railExtended = false,
    this.sidebarWidth = 260,
    this.sidebarHeader,
    this.sidebarFooter,
    this.backgroundColor,
    this.elevation,
    this.railLeading,
    this.railTrailing,
    this.sidebarCollapsed = false,
    this.onSidebarToggle,
    this.profileAvatar,
  });
  final Widget? profileAvatar;
  // Mobile destinations.
  final List<LearnHubNavigationDestination> destinations;

  // Desktop destinations.
  final List<LearnHubNavigationDestination> desktopPrimary;
  final List<LearnHubNavigationDestination> desktopSecondary;
  final LearnHubNavigationDestination? desktopProfile;

  final int selectedIndex;

  final LearnHubNavigationDestination? selectedDestination;

  final ValueChanged<int> onDestinationSelected;

  final ValueChanged<LearnHubNavigationDestination>?
  onDesktopDestinationSelected;

  final AdaptiveNavigationType? type;

  final bool railExtended;

  final double sidebarWidth;

  final Widget? sidebarHeader;
  final Widget? sidebarFooter;

  final Color? backgroundColor;
  final double? elevation;

  final Widget? railLeading;
  final Widget? railTrailing;

  final bool sidebarCollapsed;
  final VoidCallback? onSidebarToggle;

  AdaptiveNavigationType _resolveType(BuildContext context) {
    if (type != null) {
      return type!;
    }

    return switch (context.adaptive.windowSize) {
      WindowSize.compact => AdaptiveNavigationType.bar,
      WindowSize.medium => AdaptiveNavigationType.rail,
      WindowSize.expanded => AdaptiveNavigationType.sidebar,
    };
  }

  void _handleDesktopDestination(LearnHubNavigationDestination destination) {
    onDesktopDestinationSelected?.call(destination);
  }

  @override
  Widget build(BuildContext context) {
    final resolvedType = _resolveType(context);

    switch (resolvedType) {
      // ----------------------------------------------------------
      // MOBILE
      // ----------------------------------------------------------
      case AdaptiveNavigationType.bar:
        return AdaptiveNavigationBar(
          destinations: destinations,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          backgroundColor: backgroundColor,
        );

      // ----------------------------------------------------------
      // TABLET
      // ----------------------------------------------------------
      case AdaptiveNavigationType.rail:
        return AdaptiveNavigationRail(
          destinations: destinations,

          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,

          // ALL desktop destinations in one continuous list.
          desktopPrimary: desktopPrimary,
          desktopSecondary: desktopSecondary,

          // Profile stays completely separate at the bottom.
          profileDestination: desktopProfile,
          selectedDestination: selectedDestination,
          profileAvatar: profileAvatar,

          backgroundColor: backgroundColor,
          width: 72,
          elevation: elevation,
        );
      // ----------------------------------------------------------
      // DESKTOP
      // ----------------------------------------------------------
      case AdaptiveNavigationType.sidebar:
        return AdaptiveSidebar(
          destinations: desktopPrimary,
          secondaryDestinations: desktopSecondary,
          profileDestination: desktopProfile,
          selectedDestination: selectedDestination,
          onDestinationSelected: _handleDesktopDestination,
          width: sidebarWidth,
          header: sidebarHeader,
          footer: sidebarFooter,
          backgroundColor: backgroundColor,
          collapsed: sidebarCollapsed,
          onToggle: onSidebarToggle,
        );
    }
  }

  // int _resolveRailSelectedIndex(
  //   List<LearnHubNavigationDestination> railDestinations,
  // ) {
  //   if (selectedDestination != null) {
  //     final index = railDestinations.indexOf(selectedDestination!);

  //     if (index >= 0) {
  //       return index;
  //     }
  //   }

  //   // If the desktop destination isn't available, try to map the
  //   // normal selected index to the same destination.
  //   if (selectedIndex >= 0 && selectedIndex < destinations.length) {
  //     final selected = destinations[selectedIndex];
  //     final index = railDestinations.indexOf(selected);

  //     if (index >= 0) {
  //       return index;
  //     }
  //   }

  //   return 0;
  // }
}
