import 'package:flutter/material.dart';
import '../utils/app_routes.dart';
import 'destinations.dart';


/// Central definition of LearnHub's primary navigation.
///
/// All adaptive navigation widgets should consume this definition instead
/// of declaring their own destinations.
///
/// Example:
///
/// ```dart
/// final destinations = LearnHubNavigation.primary;
///
/// NavigationBar(
///   selectedIndex: selectedIndex,
///   onDestinationSelected: onDestinationSelected,
///   destinations: destinations
///       .map(
///         (destination) => NavigationDestination(
///           icon: Icon(destination.icon),
///           selectedIcon: Icon(
///             destination.selectedIcon ?? destination.icon,
///           ),
///           label: destination.label,
///         ),
///       )
///       .toList(),
/// )
/// ```
///
/// This gives LearnHub one source of truth for:
///
/// - destination identity
/// - labels
/// - icons
/// - selected icons
///
/// Routing remains owned by the application's router/navigation layer.
abstract final class LearnHubNavigation {
  /// Primary destinations available to regular learners.
  ///
  /// Keep the ordering stable because adaptive navigation widgets use the
  /// same list/index across mobile, tablet, and desktop.
  static const List<LearnHubNavigationDestination> primary = [
    LearnHubNavigationDestination(
      destination: LearnHubDestination.home,
      label: 'Home',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      route: AppRoutes.home,
    ),
    LearnHubNavigationDestination(
      destination: LearnHubDestination.discover,
      label: 'Discover',
      icon: Icons.explore_outlined,
      selectedIcon: Icons.explore,
      route: AppRoutes.discover,  
    ),
    LearnHubNavigationDestination(
      destination: LearnHubDestination.learning,
      label: 'My Learning',
      icon: Icons.school_outlined,
      selectedIcon: Icons.school,
      route: AppRoutes.learning,
    ),
    LearnHubNavigationDestination(
      destination: LearnHubDestination.saved,
      label: 'Saved',
      icon: Icons.bookmark_border,
      selectedIcon: Icons.bookmark,
      route: AppRoutes.saved,
    ),
    LearnHubNavigationDestination(
      destination: LearnHubDestination.profile,
      label: 'Profile',
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      route: AppRoutes.profile,
    ),
  ];
}