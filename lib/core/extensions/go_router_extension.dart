import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension GoRouterContextExtension on BuildContext {
  void goIfDifferent(String location) {
    final currentLocation = GoRouterState.of(this).uri.toString();

    if (currentLocation == location) {
      return;
    }

    go(location);
  }
}
