import 'package:iconsax/iconsax.dart';

import '../../core/utils/app_routes.dart';
import 'destinations.dart';

/// Central navigation definition for LearnHub.
///
/// This class separates:
///
/// 1. Desktop navigation
/// 2. Mobile navigation
/// 3. Profile/settings navigation
///
/// The UI components should consume these lists rather than creating
/// their own destinations.
abstract final class LearnHubNavigation {
  // ============================================================
  // DESKTOP
  // ============================================================

  /// Main destinations shown in the desktop sidebar.
  ///
  /// These represent the student's primary learning workflow.
  static const List<LearnHubNavigationDestination> desktopPrimary = [
    LearnHubNavigationDestination(
      destination: LearnHubDestination.home,
      label: 'Home',
      icon: Iconsax.home_2,
      selectedIcon: Iconsax.home_2,
      route: AppRoutes.home,
      type: LearnHubNavigationType.primary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.explore,
      label: 'Explore',
      icon: Iconsax.discover_1,
      selectedIcon: Iconsax.discover_1,
      route: AppRoutes.authenticatedExplore,
      type: LearnHubNavigationType.primary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.learning,
      label: 'My Learning',
      icon: Iconsax.book_1,
      selectedIcon: Iconsax.book_1,
      route: AppRoutes.learning,
      type: LearnHubNavigationType.primary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.cart,
      label: 'Cart',
      icon: Iconsax.shopping_cart,
      selectedIcon: Iconsax.shopping_cart,
      route: AppRoutes.cart,
      type: LearnHubNavigationType.primary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.certificates,
      label: 'Certificates',
      icon: Iconsax.award,
      selectedIcon: Iconsax.award,
      route: AppRoutes.certificates,
      type: LearnHubNavigationType.primary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.subscription,
      label: 'My Subscription',
      icon: Iconsax.crown,
      selectedIcon: Iconsax.crown,
      route: AppRoutes.subscription,
      type: LearnHubNavigationType.primary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.orders,
      label: 'My Orders',
      icon: Iconsax.receipt_2,
      selectedIcon: Iconsax.receipt_2,
      route: AppRoutes.orders,
      type: LearnHubNavigationType.primary,
    ),
  ];

  /// Secondary desktop destinations.
  ///
  /// These appear below the divider in the desktop sidebar.
  static const List<LearnHubNavigationDestination> desktopSecondary = [
    LearnHubNavigationDestination(
      destination: LearnHubDestination.notifications,
      label: 'Notifications',
      icon: Iconsax.notification,
      selectedIcon: Iconsax.notification,
      route: AppRoutes.notifications,
      type: LearnHubNavigationType.secondary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.settings,
      label: 'Settings',
      icon: Iconsax.setting_2,
      selectedIcon: Iconsax.setting_2,
      route: AppRoutes.settings,
      type: LearnHubNavigationType.secondary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.helpSupport,
      label: 'Help & Support',
      icon: Iconsax.message_question,
      selectedIcon: Iconsax.message_question,
      route: AppRoutes.helpSupport,
      type: LearnHubNavigationType.secondary,
    ),
  ];

  /// Desktop profile destination.
  ///
  /// This is intentionally separate from the main sidebar list because
  /// the desktop design places the user's profile at the bottom.
  static const LearnHubNavigationDestination desktopProfile =
      LearnHubNavigationDestination(
        destination: LearnHubDestination.profile,
        label: 'Profile',
        icon: Iconsax.profile_circle,
        selectedIcon: Iconsax.profile_circle5,
        route: AppRoutes.profile,
        type: LearnHubNavigationType.primary,
      );

  // ============================================================
  // MOBILE
  // ============================================================

  /// Only the five destinations that appear in the mobile bottom bar.
  ///
  /// The mobile Profile screen becomes a hub for the remaining
  /// account-related destinations.
  static const List<LearnHubNavigationDestination> mobilePrimary = [
    LearnHubNavigationDestination(
      destination: LearnHubDestination.home,
      label: 'Home',
      icon: Iconsax.home_2,
      selectedIcon: Iconsax.home_2,
      route: AppRoutes.home,
      type: LearnHubNavigationType.mobilePrimary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.explore,
      label: 'Explore',
      icon: Iconsax.discover_1,
      selectedIcon: Iconsax.discover_1,
      route: AppRoutes.authenticatedExplore,
      type: LearnHubNavigationType.mobilePrimary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.learning,
      label: 'Learning',
      icon: Iconsax.book_1,
      selectedIcon: Iconsax.book_1,
      route: AppRoutes.learning,
      type: LearnHubNavigationType.mobilePrimary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.cart,
      label: 'Cart',
      icon: Iconsax.shopping_cart,
      selectedIcon: Iconsax.shopping_cart,
      route: AppRoutes.cart,
      type: LearnHubNavigationType.mobilePrimary,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.profile,
      label: 'Profile',
      icon: Iconsax.profile_circle,
      selectedIcon: Iconsax.profile_circle5,
      route: AppRoutes.profile,
      type: LearnHubNavigationType.mobilePrimary,
    ),
  ];

  // ============================================================
  // MOBILE PROFILE
  // ============================================================

  /// Destinations displayed inside the mobile Profile screen.
  ///
  /// These do NOT appear in the bottom navigation.
  static const List<LearnHubNavigationDestination> profileSections = [
    // Account
    LearnHubNavigationDestination(
      destination: LearnHubDestination.subscription,
      label: 'My Subscription',
      icon: Iconsax.crown,
      selectedIcon: Iconsax.crown,
      route: AppRoutes.subscription,
      type: LearnHubNavigationType.profileSection,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.orders,
      label: 'My Orders',
      icon: Iconsax.receipt_2,
      selectedIcon: Iconsax.receipt_2,
      route: AppRoutes.orders,
      type: LearnHubNavigationType.profileSection,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.certificates,
      label: 'My Certificates',
      icon: Iconsax.award,
      selectedIcon: Iconsax.award,
      route: AppRoutes.certificates,
      type: LearnHubNavigationType.profileSection,
    ),

    // Preferences
    LearnHubNavigationDestination(
      destination: LearnHubDestination.settings,
      label: 'Settings',
      icon: Iconsax.setting_2,
      selectedIcon: Iconsax.setting_2,
      route: AppRoutes.settings,
      type: LearnHubNavigationType.profileSection,
    ),

    LearnHubNavigationDestination(
      destination: LearnHubDestination.notifications,
      label: 'Notifications',
      icon: Iconsax.notification,
      selectedIcon: Iconsax.notification5,
      route: AppRoutes.notifications,
      type: LearnHubNavigationType.profileSection,
    ),

    // More
    LearnHubNavigationDestination(
      destination: LearnHubDestination.helpSupport,
      label: 'Help & Support',
      icon: Iconsax.message_question,
      selectedIcon: Iconsax.message_question,
      route: AppRoutes.helpSupport,
      type: LearnHubNavigationType.profileSection,
    ),
  ];
}
