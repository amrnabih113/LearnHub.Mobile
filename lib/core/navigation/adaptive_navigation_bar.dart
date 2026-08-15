import 'package:flutter/material.dart';
import 'destinations.dart';


/// LearnHub's mobile bottom navigation.
///
/// This widget is intentionally responsible only for rendering the mobile
/// navigation UI. It does not perform routing itself.
///
/// The parent should own the selected destination and navigation behavior.
///
/// Example:
///
/// ```dart
/// AdaptiveNavigationBar(
///   destinations: LearnHubNavigation.primary,
///   selectedIndex: selectedIndex,
///   onDestinationSelected: (index) {
///     final destination =
///         LearnHubNavigation.primary[index].destination;
///
///     // Navigate using the application's router.
///   },
/// )
/// ```
///
/// Use this on compact layouts.
///
/// Tablet layouts should use [NavigationRail], and desktop layouts should
/// use the LearnHub sidebar.
class AdaptiveNavigationBar extends StatelessWidget {
  const AdaptiveNavigationBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.backgroundColor,
    this.elevation,
    this.height,
    this.labelBehavior = NavigationDestinationLabelBehavior.alwaysShow,
  });

  /// Destinations displayed in the navigation bar.
  final List<LearnHubNavigationDestination> destinations;

  /// Currently selected destination index.
  final int selectedIndex;

  /// Called when the user selects a destination.
  final ValueChanged<int> onDestinationSelected;

  /// Optional background color.
  final Color? backgroundColor;

  /// Optional elevation.
  final double? elevation;

  /// Optional navigation bar height.
  final double? height;

  /// Controls when destination labels are displayed.
  final NavigationDestinationLabelBehavior labelBehavior;

  @override
  Widget build(BuildContext context) {
    assert(
      destinations.isNotEmpty,
      'AdaptiveNavigationBar requires at least one destination.',
    );

    final safeSelectedIndex = selectedIndex.clamp(
      0,
      destinations.length - 1,
    );

    return NavigationBar(
      selectedIndex: safeSelectedIndex,
      onDestinationSelected: onDestinationSelected,
      backgroundColor: backgroundColor,
      elevation: elevation,
      height: height,
      labelBehavior: labelBehavior,
      destinations: [
        for (final destination in destinations)
          NavigationDestination(
            icon: _buildIcon(
              destination,
              selected: false,
            ),
            selectedIcon: _buildIcon(
              destination,
              selected: true,
            ),
            label: destination.label,
          ),
      ],
    );
  }

  Widget _buildIcon(
    LearnHubNavigationDestination destination, {
    required bool selected,
  }) {
    final icon = Icon(
      destination.iconFor(selected: selected),
    );

    if (destination.badge == null) {
      return icon;
    }

    return Badge(
      label: destination.badge,
      child: icon,
    );
  }
}