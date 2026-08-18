import 'package:flutter/material.dart';
import 'package:learnhub/core/extensions/my_sizes_extensions.dart';
import 'package:learnhub/core/ui/app_logo.dart';
import 'package:learnhub/core/utils/my_colors.dart';

import 'destinations.dart';

class AdaptiveSidebar extends StatelessWidget {
  const AdaptiveSidebar({
    super.key,
    required this.destinations,
    this.secondaryDestinations = const [],
    this.profileDestination,
    this.selectedDestination,
    required this.onDestinationSelected,
    this.onToggle,
    this.width = 260,
    this.header,
    this.footer,
    this.backgroundColor,
    this.collapsed = false,

    this.border,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
  });

  final List<LearnHubNavigationDestination> destinations;
  final List<LearnHubNavigationDestination> secondaryDestinations;
  final LearnHubNavigationDestination? profileDestination;
  final LearnHubNavigationDestination? selectedDestination;

  final ValueChanged<LearnHubNavigationDestination> onDestinationSelected;

  final VoidCallback? onToggle;

  final bool collapsed;

  final double width;
  final Widget? header;
  final Widget? footer;
  final Color? backgroundColor;
  final Border? border;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    assert(
      destinations.isNotEmpty,
      'AdaptiveSidebar requires at least one destination.',
    );

    return Container(
      width: width,
      decoration: BoxDecoration(
        // Keep sidebar dark regardless of app theme.
        color:
            backgroundColor ??
            (MyColors.isDark(context) ? MyColors.sidebarDark : MyColors.navy),

        border:
            border ??
            Border(right: BorderSide(color: MyColors.borderDark, width: 1)),
      ),
      child: SafeArea(
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (header != null) ...[header!, const SizedBox(height: 24)],

              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Row(
                      children: [
                        Expanded(child: AppLogo()),
                        IconButton(
                          onPressed: onToggle,
                          icon: Icon(
                            collapsed
                                ? Icons.menu_rounded
                                : Icons.keyboard_arrow_left,
                          ),
                          color: MyColors.textSecondaryDark,
                          tooltip: collapsed ? 'Open sidebar' : 'Close sidebar',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    const _SidebarDivider(),

                    const SizedBox(height: 10),

                    for (final destination in destinations)
                      _SidebarDestination(
                        destination: destination,
                        selected: _isSelected(destination),
                        onTap: () => onDestinationSelected(destination),
                      ),

                    if (secondaryDestinations.isNotEmpty) ...[
                      const SizedBox(height: 18),

                      const _SidebarDivider(),

                      const SizedBox(height: 10),

                      for (final destination in secondaryDestinations)
                        _SidebarDestination(
                          destination: destination,
                          selected: _isSelected(destination),
                          onTap: () => onDestinationSelected(destination),
                        ),
                    ],
                  ],
                ),
              ),

              if (profileDestination != null) ...[
                const SizedBox(height: 12),

                _SidebarProfile(
                  destination: profileDestination!,
                  selected: _isSelected(profileDestination!),
                  onTap: () => onDestinationSelected(profileDestination!),
                ),
              ],

              if (footer != null) ...[const SizedBox(height: 12), footer!],
            ],
          ),
        ),
      ),
    );
  }

  bool _isSelected(LearnHubNavigationDestination destination) {
    return selectedDestination?.destination == destination.destination;
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
    final foregroundColor = selected
        ? MyColors.textPrimaryDark
        : MyColors.textSecondaryDark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(13),
          splashColor: MyColors.blueDark.withValues(alpha: 0.12),
          highlightColor: MyColors.blueDark.withValues(alpha: 0.08),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            curve: Curves.easeOut,
            constraints: const BoxConstraints(minHeight: 48),
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            decoration: BoxDecoration(
              color: selected
                  ? (MyColors.isDark(context)
                        ? MyColors.surfaceAltDark
                        : MyColors.surfaceAltLight.withValues(alpha: 0.08))
                  : Colors.transparent,

              borderRadius: BorderRadius.circular(13),

              // Selected indicator only on the LEFT.
              border: Border(
                left: BorderSide(
                  color: selected ? MyColors.yellow : Colors.transparent,
                  width: context.responsive(4),
                ),
                right: BorderSide(
                  color: selected ? MyColors.yellow : Colors.transparent,
                  width: 0.25,
                ),
                top: BorderSide(
                  color: selected ? MyColors.yellow : Colors.transparent,
                  width: 0.25,
                ),
                bottom: BorderSide(
                  color: selected ? MyColors.yellow : Colors.transparent,
                  width: 0.25,
                ),
              ),
            ),
            child: Row(
              children: [
                _buildIcon(foregroundColor),

                const SizedBox(width: 13),

                Expanded(
                  child: Text(
                    destination.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: foregroundColor,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
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

  Widget _buildIcon(Color foregroundColor) {
    return Icon(
      destination.iconFor(selected: selected),
      size: 22,
      color: foregroundColor,
    );
  }
}

class _SidebarProfile extends StatelessWidget {
  const _SidebarProfile({
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

    final backgroundColor = selected
        ? (MyColors.isDark(context)
              ? MyColors.surfaceAltDark
              : MyColors.surfaceAltLight.withValues(alpha: 0.08))
        : MyColors.navLight.withValues(alpha: 0.08);

    final titleColor = MyColors.textPrimaryDark;

    final subtitleColor = MyColors.textSecondaryDark;

    final avatarBackground = selected ? MyColors.yellow : MyColors.navy;

    final avatarForeground = MyColors.textPrimaryDark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        splashColor: MyColors.blueDark.withValues(alpha: 0.12),
        highlightColor: MyColors.blueDark.withValues(alpha: 0.08),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,

          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),

          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(14),

            border: Border.all(
              color: selected
                  ? MyColors.yellow.withValues(alpha: 0.35)
                  : MyColors.borderDark,
              width: 1,
            ),
          ),

          child: Row(
            children: [
              // Avatar
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: avatarBackground,
                  shape: BoxShape.circle,

                  border: Border.all(
                    color: selected ? MyColors.yellow : MyColors.borderDark,
                    width: 1,
                  ),
                ),
                child: Icon(
                  destination.iconFor(selected: selected),
                  size: 20,
                  color: avatarForeground,
                ),
              ),

              const SizedBox(width: 12),

              // User information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      destination.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      'Alex Kim',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: subtitleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Chevron
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: MyColors.navy.withValues(alpha: 0.7),

                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 19,
                  color: MyColors.textSecondaryDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarDivider extends StatelessWidget {
  const _SidebarDivider();
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: MyColors.borderDark.withValues(alpha: 0.5),
    );
  }
}
