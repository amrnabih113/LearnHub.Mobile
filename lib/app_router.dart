import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/adaptive/adaptive_app_shell.dart';
import 'core/navigation/navigation.dart';
import 'core/utils/app_routes.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/register_screen.dart';
import 'test/placeholder_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.landing,
      builder: (context, state) {
        return const PlaceholderPage(title: 'Landing');
      },
    ),

    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) {
        return LoginScreen();
      },
    ),

    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) {
        return RegisterScreen();
      },
    ),
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
