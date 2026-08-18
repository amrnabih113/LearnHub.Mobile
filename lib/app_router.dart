import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnhub/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:learnhub/features/auth/presentation/screens/mobile/introduction_screen.dart';
import 'package:learnhub/features/auth/presentation/screens/password_otp_screen.dart';
import 'package:learnhub/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:learnhub/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:learnhub/features/landing/presentation/screens/landing_screen.dart';
import 'package:learnhub/features/landing/presentation/screens/subscribtion_screen.dart';
import 'package:learnhub/features/landing/presentation/screens/web_explore_screen.dart';

import 'core/adaptive/adaptive_app_shell.dart';
import 'core/navigation/navigation.dart';
import 'core/utils/app_routes.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/register_screen.dart';
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
      path: AppRoutes.passwordOtp + '/:email',
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
      path: AppRoutes.emailVerification + '/:email',
      builder: (context, state) {
        return VerifyEmailScreen(email: state.pathParameters['email']!);
      },
    ),

    GoRoute(
      path: AppRoutes.explore,
      builder: (context, state) {
        return ExploreScreen();
      },
    ),

    GoRoute(
      path: AppRoutes.subscribtion,
      builder: (context, state) {
        return const SubscriptionScreen();
      },
    ),
    // Shell
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return _PlaceholderShell(child: navigationShell);
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
              path: AppRoutes.discover,
              builder: (context, state) {
                return const PlaceholderPage(title: 'Discover');
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
              path: AppRoutes.saved,
              builder: (context, state) {
                return const PlaceholderPage(title: 'Saved');
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
            ),
          ],
        ),
      ],
    ),
  ],
);

class _PlaceholderShell extends StatelessWidget {
  const _PlaceholderShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    final selectedIndex = _selectedIndexForLocation(currentLocation);

    return AdaptiveAppShell(
      destinations: LearnHubNavigation.primary,
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        final destination = LearnHubNavigation.primary[index];

        context.go(destination.route);
      },
      sidebarHeader: const Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          'LearnHub',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      sidebarFooter: const Padding(
        padding: EdgeInsets.all(12),
        child: Text('Testing'),
      ),
      child: child,
    );
  }

  int _selectedIndexForLocation(String location) {
    final destinations = LearnHubNavigation.primary;

    final index = destinations.indexWhere(
      (destination) => location == destination.route,
    );

    return index == -1 ? 0 : index;
  }
}
