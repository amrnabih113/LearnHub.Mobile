import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnhub/features/landing/presentation/screens/mobile/authanticated_explore_screen.dart';

import 'core/adaptive/adaptive_app_shell.dart';
import 'core/utils/app_routes.dart';

import 'features/auth/presentation/screens/forget_password_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/mobile/introduction_screen.dart';
import 'features/auth/presentation/screens/password_otp_screen.dart';
import 'features/auth/presentation/screens/register_screen.dart';
import 'features/auth/presentation/screens/reset_password_screen.dart';
import 'features/auth/presentation/screens/verify_email_screen.dart';

import 'features/landing/presentation/screens/landing_screen.dart';
import 'features/landing/presentation/screens/subscribtion_screen.dart';
import 'features/landing/presentation/screens/web_explore_screen.dart';

import 'features/navigation/destinations.dart';
import 'features/navigation/navigation.dart';

import 'test/placeholder_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: kIsWeb ? AppRoutes.landing : AppRoutes.intro,
  routes: [
    GoRoute(
      path: AppRoutes.landing,
      builder: (context, state) {
        return const LandingScreen();
      },
    ),

    GoRoute(
      path: AppRoutes.intro,
      builder: (context, state) {
        return const IntroductionScreen();
      },
    ),

    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),

    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) {
        return const RegisterScreen();
      },
    ),

    GoRoute(
      path: AppRoutes.forgetPassword,
      builder: (context, state) {
        return ForgetPasswordScreen();
      },
    ),

    GoRoute(
      path: '${AppRoutes.passwordOtp}/:email',
      builder: (context, state) {
        return PasswordOtpScreen(email: state.pathParameters['email']!);
      },
    ),

    GoRoute(
      path: AppRoutes.resetPassword,
      builder: (context, state) {
        return ResetPasswordScreen();
      },
    ),

    GoRoute(
      path: '${AppRoutes.emailVerification}/:email',
      builder: (context, state) {
        return VerifyEmailScreen(email: state.pathParameters['email']!);
      },
    ),

    GoRoute(
      path: AppRoutes.explore,
      builder: (context, state) {
        return const ExploreScreen();
      },
    ),

    GoRoute(
      path: AppRoutes.subscription,
      builder: (context, state) {
        return const SubscriptionScreen();
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return _LearnHubShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) {
                return const PlaceholderPage(title: 'Home');
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.authenticatedExplore,
              builder: (context, state) {
                return const AuthenticatedExploreScreen();
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.learning,
              builder: (context, state) {
                return const PlaceholderPage(title: 'My Learning');
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.cart,
              builder: (context, state) {
                return const PlaceholderPage(title: 'Cart');
              },
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) {
                return const PlaceholderPage(title: 'Profile');
              },
              routes: [
                GoRoute(
                  path: 'personal-information',
                  builder: (context, state) {
                    return const PlaceholderPage(title: 'Personal Information');
                  },
                ),
                GoRoute(
                  path: 'email-password',
                  builder: (context, state) {
                    return const PlaceholderPage(title: 'Email & Password');
                  },
                ),
                GoRoute(
                  path: 'privacy-security',
                  builder: (context, state) {
                    return const PlaceholderPage(title: 'Privacy & Security');
                  },
                ),
                GoRoute(
                  path: 'teach-with-learnhub',
                  builder: (context, state) {
                    return const PlaceholderPage(title: 'Teach with LearnHub');
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    ShellRoute(
      builder: (context, state, child) {
        return _LearnHubSecondaryShell(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.certificates,
          builder: (context, state) {
            return const PlaceholderPage(title: 'My Certificates');
          },
        ),

        GoRoute(
          path: AppRoutes.orders,
          builder: (context, state) {
            return const PlaceholderPage(title: 'My Orders');
          },
        ),

        GoRoute(
          path: AppRoutes.notifications,
          builder: (context, state) {
            return const PlaceholderPage(title: 'Notifications');
          },
        ),

        GoRoute(
          path: AppRoutes.settings,
          builder: (context, state) {
            return const PlaceholderPage(title: 'Settings');
          },
        ),

        GoRoute(
          path: AppRoutes.helpSupport,
          builder: (context, state) {
            return const PlaceholderPage(title: 'Help & Support');
          },
        ),
      ],
    ),
  ],
);

class _LearnHubShell extends StatelessWidget {
  const _LearnHubShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    final selectedIndex = _selectedMobileIndex(location);

    final selectedDestination = _findDestination(location);

    return AdaptiveAppShell(
      destinations: LearnHubNavigation.mobilePrimary,

      desktopPrimary: LearnHubNavigation.desktopPrimary,

      desktopSecondary: LearnHubNavigation.desktopSecondary,

      desktopProfile: LearnHubNavigation.desktopProfile,

      selectedIndex: selectedIndex,

      selectedDestination: selectedDestination,

      onDestinationSelected: (index) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      },

      onDesktopDestinationSelected: (destination) {
        context.go(destination.route);
      },

      child: navigationShell,
    );
  }

  int _selectedMobileIndex(String location) {
    final destinations = LearnHubNavigation.mobilePrimary;

    final index = destinations.indexWhere((destination) {
      return location == destination.route ||
          location.startsWith('${destination.route}/');
    });

    return index == -1 ? 0 : index;
  }

  LearnHubNavigationDestination? _findDestination(String location) {
    final destinations = [
      ...LearnHubNavigation.desktopPrimary,
      ...LearnHubNavigation.desktopSecondary,
      LearnHubNavigation.desktopProfile,
    ];

    for (final destination in destinations) {
      if (location == destination.route ||
          location.startsWith('${destination.route}/')) {
        return destination;
      }
    }

    return null;
  }
}

class _LearnHubSecondaryShell extends StatelessWidget {
  const _LearnHubSecondaryShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    final selectedDestination = _findDestination(location);

    return AdaptiveAppShell(
      destinations: LearnHubNavigation.mobilePrimary,

      desktopPrimary: LearnHubNavigation.desktopPrimary,

      desktopSecondary: LearnHubNavigation.desktopSecondary,

      desktopProfile: LearnHubNavigation.desktopProfile,

      selectedIndex: 0,

      selectedDestination: selectedDestination,

      onDestinationSelected: (index) {
        final destination = LearnHubNavigation.mobilePrimary[index];

        context.go(destination.route);
      },

      onDesktopDestinationSelected: (destination) {
        context.go(destination.route);
      },

      child: child,
    );
  }

  LearnHubNavigationDestination? _findDestination(String location) {
    final destinations = [
      ...LearnHubNavigation.desktopPrimary,
      ...LearnHubNavigation.desktopSecondary,
      LearnHubNavigation.desktopProfile,
    ];

    for (final destination in destinations) {
      if (location == destination.route ||
          location.startsWith('${destination.route}/')) {
        return destination;
      }
    }

    return null;
  }
}
