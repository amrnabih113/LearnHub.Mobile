import 'package:flutter/widgets.dart';

/// Identifies a primary destination in LearnHub.
///
/// Keep this enum independent from Flutter's navigation widgets.
///
/// The same destinations can then be represented as:
///
/// - [NavigationBar] on mobile
/// - [NavigationRail] on tablet
/// - Sidebar navigation on desktop
///
/// The enum should represent application destinations, not UI components.
enum LearnHubDestination {
  home,
  discover,
  learning,
  saved,
  profile,
}

/// Describes a LearnHub navigation destination.
///
/// Example:
///
/// ```dart
/// const destination = LearnHubNavigationDestination(
///   destination: LearnHubDestination.home,
///   label: 'Home',
///   icon: Icons.home_outlined,
///   selectedIcon: Icons.home,
/// );
/// ```
///
/// Keep routing information here only if the route is stable and directly
/// associated with the destination. If LearnHub's router already owns route
/// definitions, we can later connect this model to the router rather than
/// duplicating route strings.
class LearnHubNavigationDestination {
  const LearnHubNavigationDestination({
    required this.destination,
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.badge,
    required this.route,
  });
  final String route;
  /// Application-level destination identifier.
  final LearnHubDestination destination;

  /// Text displayed by navigation widgets.
  final String label;

  /// Default/unselected icon.
  final IconData icon;

  /// Optional selected-state icon.
  ///
  /// If omitted, [icon] can be used for both states.
  final IconData? selectedIcon;

  /// Optional badge displayed by navigation implementations.
  ///
  /// For example:
  ///
  /// - unread notifications
  /// - saved item count
  /// - pending learning activity
  final Widget? badge;

  /// Returns the icon appropriate for the selected state.
  IconData iconFor({required bool selected}) {
    if (selected && selectedIcon != null) {
      return selectedIcon!;
    }

    return icon;
  }
}