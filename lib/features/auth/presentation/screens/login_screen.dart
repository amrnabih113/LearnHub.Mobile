import 'package:flutter/material.dart';
import 'package:learnhub/core/ui/dismiss_focus.dart';
import '../../../../core/adaptive/adaptive_layout.dart';
import 'web/login_web.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissFocus(
        child: AdaptiveLayout(
          compact: LoginForm(),
          medium: LoginForm(),
          expanded: const LoginWeb(),
        ),
      ),
    );
  }
}
