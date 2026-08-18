import 'package:flutter/material.dart';

/// Identifies a destination inside LearnHub.
///
/// These are application destinations, not UI components.
///
/// The same destination can be presented differently depending on the
/// screen size:
///
/// - Desktop → sidebar
/// - Tablet → navigation rail
/// - Mobile → bottom navigation or Profile hub
enum LearnHubDestination {
  home,
  explore,
  learning,
  cart,
  certificates,
  subscription,
  orders,
  notifications,
  settings,
  helpSupport,
  profile,
}

/// Defines how a destination is used by the responsive navigation system.
enum LearnHubNavigationType {
  primary,
  secondary,
  mobilePrimary,
  profileSection,
}

/// Represents one LearnHub navigation destination.
class LearnHubNavigationDestination {
  const LearnHubNavigationDestination({
    required this.destination,
    required this.label,
    required this.icon,
    required this.route,
    this.selectedIcon,
    this.type = LearnHubNavigationType.primary,
    this.badge,
  });

  /// Application-level destination identifier.
  final LearnHubDestination destination;

  /// Label shown in navigation.
  final String label;

  /// Unselected icon.
  final IconData icon;

  /// Selected icon.
  final IconData? selectedIcon;

  /// Application route.
  final String route;

  /// Controls where this destination belongs in the responsive UI.
  final LearnHubNavigationType type;

  /// Optional badge.
  ///
  /// Useful for:
  ///
  /// - cart count
  /// - notification count
  /// - pending activity
  final Widget? badge;

  IconData iconFor({
    required bool selected,
  }) {
    if (selected && selectedIcon != null) {
      return selectedIcon!;
    }

    return icon;
  }
}