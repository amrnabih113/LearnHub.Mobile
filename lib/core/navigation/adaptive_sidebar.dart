import 'package:flutter/material.dart';
import 'destinations.dart';


/// LearnHub's desktop navigation sidebar.
///
/// This is the expanded navigation experience used on desktop/web.
///
/// It displays the destination icon together with its label and can also
/// contain a header, footer, or additional actions.
///
/// The sidebar does not perform routing. The parent owns the selected
/// destination and navigation.
///
/// Example:
///
/// ```dart
/// AdaptiveSidebar(
///   destinations: LearnHubNavigation.primary,
///   selectedIndex: selectedIndex,
///   onDestinationSelected: onDestinationSelected,
///   header: const LearnHubLogo(),
///   footer: const UserMenu(),
/// )
/// ```
///
/// Use this for expanded layouts. For tablets use [NavigationRail], and
/// for compact layouts use [NavigationBar].
class AdaptiveSidebar extends StatelessWidget {
  const AdaptiveSidebar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.width = 260,
    this.header,
    this.footer,
    this.backgroundColor,
    this.border,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 16,
    ),
  });

  /// Destinations displayed in the sidebar.
  final List<LearnHubNavigationDestination> destinations;

  /// Currently selected destination index.
  final int selectedIndex;

  /// Called when a destination is selected.
  final ValueChanged<int> onDestinationSelected;

  /// Width of the desktop sidebar.
  final double width;

  /// Optional header.
  ///
  /// Good candidates:
  ///
  /// - LearnHub logo
  /// - brand name
  /// - workspace selector
  final Widget? header;

  /// Optional footer.
  ///
  /// Good candidates:
  ///
  /// - settings
  /// - help
  /// - profile
  /// - logout
  final Widget? footer;

  /// Sidebar background color.
  final Color? backgroundColor;

  /// Optional border around the sidebar.
  final Border? border;

  /// Internal sidebar padding.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    assert(
      destinations.isNotEmpty,
      'AdaptiveSidebar requires at least one destination.',
    );

    final safeSelectedIndex = selectedIndex.clamp(
      0,
      destinations.length - 1,
    );

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
      ),
      child: SafeArea(
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (header != null) ...[
                header!,
                const SizedBox(height: 24),
              ],

              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    for (var index = 0;
                        index < destinations.length;
                        index++)
                      _SidebarDestination(
                        destination: destinations[index],
                        selected: index == safeSelectedIndex,
                        onTap: () => onDestinationSelected(index),
                      ),
                  ],
                ),
              ),

              if (footer != null) ...[
                const SizedBox(height: 16),
                footer!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarDestination extends StatelessWidget {
  const _SidebarDestination({
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 48,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: selected
                  ? theme.colorScheme.secondaryContainer
                  : null,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  destination.iconFor(selected: selected),
                  size: 22,
                  color: selected
                      ? theme.colorScheme.onSecondaryContainer
                      : theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    destination.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: selected
                          ? theme.colorScheme.onSecondaryContainer
                          : theme.colorScheme.onSurfaceVariant,
                      fontWeight:
                          selected ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ),
                if (destination.badge != null) ...[
                  const SizedBox(width: 8),
                  destination.badge!,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
