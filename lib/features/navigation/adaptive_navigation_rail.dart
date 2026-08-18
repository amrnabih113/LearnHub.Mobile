import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnhub/core/utils/my_colors.dart';
import 'package:learnhub/core/utils/my_images.dart';

import 'destinations.dart';

class AdaptiveNavigationRail extends StatelessWidget {
  const AdaptiveNavigationRail({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,

    // Desktop destinations.
    this.desktopPrimary = const [],
    this.desktopSecondary = const [],

    // Desktop profile.
    this.profileDestination,
    this.selectedDestination,
    this.profileAvatar,

    this.backgroundColor,
    this.width = 72,
    this.elevation,
  });

  // ------------------------------------------------------------
  // Fallback destinations
  // ------------------------------------------------------------

  final List<LearnHubNavigationDestination> destinations;

  final int selectedIndex;

  final ValueChanged<int> onDestinationSelected;

  // ------------------------------------------------------------
  // Desktop navigation
  // ------------------------------------------------------------

  /// All primary desktop destinations.
  final List<LearnHubNavigationDestination> desktopPrimary;

  /// All secondary desktop destinations.
  final List<LearnHubNavigationDestination> desktopSecondary;

  // ------------------------------------------------------------
  // Profile
  // ------------------------------------------------------------

  final LearnHubNavigationDestination? profileDestination;

  final LearnHubNavigationDestination? selectedDestination;

  /// Actual user avatar.
  final Widget? profileAvatar;

  // ------------------------------------------------------------
  // Appearance
  // ------------------------------------------------------------

  final Color? backgroundColor;

  final double width;

  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    /*
     * Tablet uses ALL desktop destinations.
     *
     * We intentionally combine primary + secondary into one list.
     *
     * Profile is NOT added here.
     */
    final allDestinations = <LearnHubNavigationDestination>[
      ...desktopPrimary,
      ...desktopSecondary,
    ];

    /*
     * If desktop navigation wasn't supplied, fall back to the
     * normal destinations.
     */
    final resolvedDestinations = allDestinations.isNotEmpty
        ? allDestinations
        : destinations;

    return Container(
      color: backgroundColor ?? colorScheme.surface,
      child: SizedBox(
        width: width,
        height: double.infinity,
        child: Column(
          children: [
            // ====================================================
            // TOP — LOGO ONLY
            // ====================================================
            SizedBox(
              height: 64,
              width: double.infinity,
              child: Center(
                child: SvgPicture.asset(
                  MyColors.isDark(context)
                      ? MyImages.appLogoDark
                      : MyImages.appLogoLight,
                  width: 32,
                  height: 32,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ====================================================
            // MIDDLE — ALL DESTINATIONS
            // ====================================================
            Expanded(child: _buildDestinations(context, resolvedDestinations)),

            // ====================================================
            // BOTTOM — PROFILE
            // ====================================================
            _buildProfile(context),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // LOGO
  // ============================================================

  // ============================================================
  // DESTINATIONS
  // ============================================================

  Widget _buildDestinations(
    BuildContext context,
    List<LearnHubNavigationDestination> destinations,
  ) {
    if (destinations.isEmpty) {
      return const SizedBox.shrink();
    }

    /*
     * All destinations are one continuous group.
     *
     * No primary/secondary divider.
     * No labels.
     */
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int index = 0; index < destinations.length; index++)
            _buildDestination(
              context,
              destination: destinations[index],
              index: index,
              allDestinations: destinations,
            ),
        ],
      ),
    );
  }

  // ============================================================
  // DESTINATION ITEM
  // ============================================================

  Widget _buildDestination(
    BuildContext context, {
    required LearnHubNavigationDestination destination,
    required int index,
    required List<LearnHubNavigationDestination> allDestinations,
  }) {
    final isSelected = _isSelected(destination, index, allDestinations);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Tooltip(
        message: destination.label,
        preferBelow: false,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {
              onDestinationSelected(index);
            },
            child: SizedBox(
              width: 48,
              height: 48,
              child: Center(
                child: _buildIcon(context, destination, selected: isSelected),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ICON
  // ============================================================

  Widget _buildIcon(
    BuildContext context,
    LearnHubNavigationDestination destination, {
    required bool selected,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    final icon = Icon(
      destination.iconFor(selected: selected),
      size: selected ? 23 : 22,
      color: colorScheme.onSurfaceVariant,
    );

    final iconWithBadge = destination.badge == null
        ? icon
        : Badge(label: destination.badge, child: icon);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: selected ? colorScheme.surface : Colors.transparent,
        border: Border(
          left: BorderSide(
            color: selected ? MyColors.accentButton : Colors.transparent,
            width: 4,
          ),
          right: BorderSide(
            color: selected ? MyColors.accentButton : Colors.transparent,
            width: 1,
          ),
          top: BorderSide(
            color: selected ? MyColors.accentButton : Colors.transparent,
            width: 1,
          ),
          bottom: BorderSide(
            color: selected ? MyColors.accentButton : Colors.transparent,
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.circular(13),
      ),
      alignment: Alignment.center,
      child: iconWithBadge,
    );
  }

  // ============================================================
  // SELECTED DESTINATION
  // ============================================================

  bool _isSelected(
    LearnHubNavigationDestination destination,
    int index,
    List<LearnHubNavigationDestination> allDestinations,
  ) {
    /*
     * Prefer the actual desktop destination when available.
     */
    if (selectedDestination != null) {
      return identical(destination, selectedDestination);
    }

    /*
     * Otherwise use the selected index.
     */
    return index == selectedIndex;
  }

  // ============================================================
  // PROFILE
  // ============================================================

  Widget _buildProfile(BuildContext context) {
    if (profileDestination == null && profileAvatar == null) {
      return const SizedBox.shrink();
    }

    final isSelected =
        profileDestination != null &&
        selectedDestination != null &&
        identical(profileDestination, selectedDestination);

    return Tooltip(
      message: profileDestination?.label ?? 'Profile',
      preferBelow: false,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            if (profileDestination == null) {
              return;
            }

            /*
             * Profile is deliberately outside the destination list.
             *
             * Therefore it should be handled by the parent using
             * the profile destination itself.
             */
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: _buildAvatar(context, selected: isSelected),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // AVATAR
  // ============================================================

  Widget _buildAvatar(BuildContext context, {required bool selected}) {
    final colorScheme = Theme.of(context).colorScheme;

    final avatar =
        profileAvatar ??
        CircleAvatar(
          radius: 18,
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
          child: const Icon(Icons.person_outline_rounded, size: 20),
        );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: EdgeInsets.all(selected ? 2 : 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? colorScheme.primary : Colors.transparent,
      ),
      child: ClipOval(child: avatar),
    );
  }
}
