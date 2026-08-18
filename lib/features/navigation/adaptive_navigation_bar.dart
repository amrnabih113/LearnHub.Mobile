import 'package:flutter/material.dart';
import 'package:learnhub/core/utils/my_colors.dart';

import 'destinations.dart';

class AdaptiveNavigationBar extends StatelessWidget {
  const AdaptiveNavigationBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.backgroundColor,
    this.elevation,
    this.height,
  });

  final List<LearnHubNavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  final Color? backgroundColor;
  final Color? elevation;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (destinations.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final safeSelectedIndex = selectedIndex.clamp(0, destinations.length - 1);

    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        height: height ?? 76,
        decoration: BoxDecoration(
          color: backgroundColor ?? colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 18,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(7, 6, 7, 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var index = 0; index < destinations.length; index++)
                  Expanded(
                    child: _MobileNavigationItem(
                      destination: destinations[index],
                      selected: index == safeSelectedIndex,
                      onTap: () => onDestinationSelected(index),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileNavigationItem extends StatelessWidget {
  const _MobileNavigationItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final LearnHubNavigationDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Selected = yellow.
    // Unselected = normal theme color.
    final foregroundColor = selected
        ? MyColors.yellow
        : colorScheme.onSurfaceVariant;

    return Semantics(
      selected: selected,
      button: true,
      label: destination.label,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(18),
            splashColor: MyColors.yellow.withValues(alpha: 0.08),
            highlightColor: MyColors.yellow.withValues(alpha: 0.05),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              margin: const EdgeInsets.symmetric(vertical: 1),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedScale(
                    scale: selected ? 1.05 : 1,
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOutCubic,
                    child: _buildIcon(context, foregroundColor),
                  ),

                  const SizedBox(height: 3),

                  Flexible(
                    child: Text(
                      destination.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: foregroundColor,
                        fontWeight: selected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        letterSpacing: 0.1,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context, Color color) {
    final icon = Icon(
      destination.iconFor(selected: selected),
      size: selected ? 24 : 23,
      color: color,
    );

    if (destination.badge == null) {
      return icon;
    }

    return Badge(
      label: destination.badge,
      alignment: Alignment.topRight,
      offset: const Offset(3, -3),
      child: icon,
    );
  }
}
