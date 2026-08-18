import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:learnhub/core/utils/my_colors.dart';

import '../../features/navigation/destinations.dart';
import 'adaptive_content.dart';
import 'adaptive_context.dart';
import 'adaptive_navigation.dart';
import 'window_size.dart';

class AdaptiveAppShell extends StatefulWidget {
  const AdaptiveAppShell({
    super.key,
    required this.child,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.desktopPrimary = const [],
    this.desktopSecondary = const [],
    this.desktopProfile,
    this.selectedDestination,
    this.onDesktopDestinationSelected,
    this.constrainContent = true,
    this.contentMaxWidth = 1440,
    this.navigation,
    this.backgroundColor,
    this.navigationBackgroundColor,
    this.sidebarWidth = 260,
    this.sidebarHeader,
    this.sidebarFooter,
    this.railLeading,
    this.railTrailing,
    this.railExtended,
    this.mobileNavigationHeight,
    this.title,
    this.titleWidget,
    this.onNotificationsPressed,
    this.profileAvatar,
    this.showAppBar = true,
  });

  final Widget child;

  // Navigation
  final List<LearnHubNavigationDestination> destinations;
  final List<LearnHubNavigationDestination> desktopPrimary;
  final List<LearnHubNavigationDestination> desktopSecondary;
  final LearnHubNavigationDestination? desktopProfile;
  final LearnHubNavigationDestination? selectedDestination;

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  final ValueChanged<LearnHubNavigationDestination>?
  onDesktopDestinationSelected;

  // Content
  final bool constrainContent;
  final double contentMaxWidth;

  // Custom navigation
  final Widget? navigation;

  final Color? navigationBackgroundColor;

  final double sidebarWidth;

  final Widget? sidebarHeader;
  final Widget? sidebarFooter;

  final Widget? railLeading;
  final Widget? railTrailing;

  final bool? railExtended;

  final double? mobileNavigationHeight;

  // App shell
  final Color? backgroundColor;

  // App bar
  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onNotificationsPressed;
  final Widget? profileAvatar;
  final bool showAppBar;

  @override
  State<AdaptiveAppShell> createState() => _AdaptiveAppShellState();
}

class _AdaptiveAppShellState extends State<AdaptiveAppShell> {
  bool _sidebarVisible = true;

  // ============================================================
  // SIDEBAR
  // ============================================================

  void _toggleSidebar() {
    setState(() {
      _sidebarVisible = !_sidebarVisible;
    });
  }

  // ============================================================
  // TITLE
  // ============================================================

  String get _screenTitle {
    if (widget.title != null && widget.title!.trim().isNotEmpty) {
      return widget.title!;
    }

    return widget.selectedDestination?.label ?? '';
  }

  // ============================================================
  // RAIL
  // ============================================================

  bool _shouldExtendRail(BuildContext context) {
    if (widget.railExtended != null) {
      return widget.railExtended!;
    }

    // Never extend the rail on tablet.
    return context.adaptive.windowSize == WindowSize.expanded &&
        context.adaptive.width >= 1200;
  }

  // ============================================================
  // NAVIGATION
  // ============================================================

  Widget _buildNavigation(BuildContext context) {
    return AdaptiveNavigation(
      destinations: widget.destinations,

      desktopPrimary: widget.desktopPrimary,
      desktopSecondary: widget.desktopSecondary,
      desktopProfile: widget.desktopProfile,

      selectedIndex: widget.selectedIndex,
      selectedDestination: widget.selectedDestination,

      onDestinationSelected: widget.onDestinationSelected,
      onDesktopDestinationSelected: widget.onDesktopDestinationSelected,

      railExtended: _shouldExtendRail(context),

      sidebarWidth: widget.sidebarWidth,
      sidebarHeader: widget.sidebarHeader,
      sidebarFooter: widget.sidebarFooter,

      backgroundColor: widget.navigationBackgroundColor,

      railLeading: widget.railLeading,
      railTrailing: widget.railTrailing,

      sidebarCollapsed: !_sidebarVisible,
      onSidebarToggle: _toggleSidebar,
    );
  }

  // ============================================================
  // CONTENT
  // ============================================================

  Widget _buildContent(BuildContext context) {
    if (!widget.constrainContent) {
      return widget.child;
    }

    return AdaptiveContent(
      maxWidth: widget.contentMaxWidth,
      child: widget.child,
    );
  }

  // ============================================================
  // DESKTOP APP BAR
  // ============================================================

  Widget _buildDesktopAppBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      height: 52,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border(bottom: BorderSide(color: MyColors.border(context))),
        ),
        child: Row(
          children: [
            // Show menu only when desktop sidebar is hidden.
            if (!_sidebarVisible) ...[
              _AppBarIconButton(
                icon: Icons.menu_rounded,
                tooltip: 'Show sidebar',
                onPressed: _toggleSidebar,
              ),
              const SizedBox(width: 10),
            ],

            // Current screen
            Expanded(
              child:
                  widget.titleWidget ??
                  Text(
                    _screenTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall,
                  ),
            ),

            // Notifications
            _AppBarIconButton(
              icon: Iconsax.notification,
              tooltip: 'Notifications',
              onPressed: widget.onNotificationsPressed,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // TABLET APP BAR
  // ============================================================

  Widget _buildTabletAppBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      height: 52,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border(bottom: BorderSide(color: MyColors.border(context))),
        ),
        child: Row(
          children: [
            Expanded(
              child:
                  widget.titleWidget ??
                  Text(
                    _screenTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
                  ),
            ),

            _AppBarIconButton(
              icon: Iconsax.notification,
              tooltip: 'Notifications',
              onPressed: widget.onNotificationsPressed,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE APP BAR
  // ============================================================

  Widget _buildMobileAppBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      height: 56,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border(bottom: BorderSide(color: MyColors.border(context))),
        ),
        child: Row(
          children: [
            const SizedBox(width: 4),

            Expanded(
              child:
                  widget.titleWidget ??
                  Text(
                    _screenTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
                  ),
            ),

            _AppBarIconButton(
              icon: Iconsax.notification,
              tooltip: 'Notifications',
              onPressed: widget.onNotificationsPressed,
            ),

            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DESKTOP
  // ============================================================

  Widget _buildDesktopLayout(BuildContext context) {
    final navigation = widget.navigation ?? _buildNavigation(context);

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: SafeArea(
        left: false,
        bottom: false,
        child: Row(
          children: [
            if (_sidebarVisible) ...[
              navigation,

              VerticalDivider(
                width: 1,
                thickness: 1,
                color: MyColors.border(context),
              ),
            ],

            Expanded(
              child: Column(
                children: [
                  if (widget.showAppBar) _buildDesktopAppBar(context),

                  Expanded(child: _buildContent(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // TABLET
  // ============================================================

  Widget _buildTabletLayout(BuildContext context) {
    final navigation = widget.navigation ?? _buildNavigation(context);

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: SafeArea(
        left: false,
        bottom: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ----------------------------------------------------
            // Fixed tablet rail
            // ----------------------------------------------------
            SizedBox(width: 76, child: navigation),

            VerticalDivider(
              width: 1,
              thickness: 1,
              color: MyColors.border(context),
            ),

            // ----------------------------------------------------
            // Main content
            // ----------------------------------------------------
            Expanded(
              child: Column(
                children: [
                  if (widget.showAppBar) _buildTabletAppBar(context),

                  Expanded(child: _buildContent(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _buildMobileLayout(BuildContext context) {
    final navigation = widget.navigation ?? _buildNavigation(context);

    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: SafeArea(
        bottom: false,
        left: false,
        child: Column(
          children: [
            if (widget.showAppBar) _buildMobileAppBar(context),

            Expanded(child: _buildContent(context)),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        bottom: false,
        child: SizedBox(
          height: widget.mobileNavigationHeight,
          child: navigation,
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final windowSize = context.adaptive.windowSize;

    switch (windowSize) {
      case WindowSize.compact:
        return _buildMobileLayout(context);

      case WindowSize.medium:
        return _buildTabletLayout(context);

      case WindowSize.expanded:
        return _buildDesktopLayout(context);
    }
  }
}

// ================================================================
// APP BAR ICON BUTTON
// ================================================================

class _AppBarIconButton extends StatelessWidget {
  const _AppBarIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 38,
            height: 38,
            child: Icon(icon, size: 21, color: colorScheme.onSurfaceVariant),
          ),
        ),
      ),
    );
  }
}
