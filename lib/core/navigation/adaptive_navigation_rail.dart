import 'package:flutter/material.dart';
import 'destinations.dart';


/// LearnHub's tablet navigation rail.
///
/// This widget renders the application's primary navigation as a
/// [NavigationRail].
///
/// Use it for medium/tablet layouts.
///
/// The rail can be:
///
/// - compact: icons only
/// - extended: icons with labels beside them
///
/// Example:
///
/// ```dart
/// AdaptiveNavigationRail(
///   destinations: LearnHubNavigation.primary,
///   selectedIndex: selectedIndex,
///   onDestinationSelected: (index) {
///     final destination =
///         LearnHubNavigation.primary[index].destination;
///
///     // Navigate using the application router.
///   },
/// )
/// ```
///
/// The widget does not perform navigation itself. The parent owns routing
/// and the currently selected destination.
class AdaptiveNavigationRail extends StatelessWidget {
  const AdaptiveNavigationRail({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.extended = false,
    this.backgroundColor,
    this.elevation,
    this.groupAlignment = -1,
    this.minWidth = 72,
    this.minExtendedWidth = 256,
    this.labelType,
    this.leading,
    this.trailing,
  });

  /// Destinations displayed by the rail.
  final List<LearnHubNavigationDestination> destinations;

  /// Currently selected destination index.
  final int selectedIndex;

  /// Called when a destination is selected.
  final ValueChanged<int> onDestinationSelected;

  /// Whether labels are displayed beside the icons.
  ///
  /// `false`:
  ///
  /// ```text
  /// ┌──────┐
  /// │  🏠  │
  /// │  🔎  │
  /// │  🎓  │
  /// └──────┘
  /// ```
  ///
  /// `true`:
  ///
  /// ```text
  /// ┌───────────────┐
  /// │ 🏠  Home      │
  /// │ 🔎  Discover  │
  /// │ 🎓  Learning  │
  /// └───────────────┘
  /// ```
  final bool extended;

  /// Background color of the rail.
  final Color? backgroundColor;

  /// Elevation of the rail.
  final double? elevation;

  /// Vertical alignment of the destinations.
  ///
  /// `-1` places them near the top.
  ///
  /// `0` centers them.
  ///
  /// `1` places them near the bottom.
  final double groupAlignment;

  /// Minimum width of the compact rail.
  final double minWidth;

  /// Width of the extended rail.
  final double minExtendedWidth;

  /// Optional label behavior.
  ///
  /// Usually this should remain null when [extended] is true because
  /// Flutter handles the extended presentation.
  final NavigationRailLabelType? labelType;

  /// Optional widget displayed above the destinations.
  ///
  /// Useful for a LearnHub logo or menu control.
  final Widget? leading;

  /// Optional widget displayed below the destinations.
  ///
  /// Useful for profile/settings/help actions.
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    assert(
      destinations.isNotEmpty,
      'AdaptiveNavigationRail requires at least one destination.',
    );

    final safeSelectedIndex = selectedIndex.clamp(
      0,
      destinations.length - 1,
    );

    return NavigationRail(
      selectedIndex: safeSelectedIndex,
      onDestinationSelected: onDestinationSelected,
      extended: extended,
      backgroundColor: backgroundColor,
      elevation: elevation,
      groupAlignment: groupAlignment,
      minWidth: minWidth,
      minExtendedWidth: minExtendedWidth,
      labelType: extended ? null : labelType,
      leading: leading,
      trailing: trailing,
      destinations: [
        for (final destination in destinations)
          NavigationRailDestination(
            icon: _buildIcon(
              destination,
              selected: false,
            ),
            selectedIcon: _buildIcon(
              destination,
              selected: true,
            ),
            label: Text(destination.label),
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