import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_layout.dart';
import '../../../../core/utils/my_colors.dart';
import 'web/login_web.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.surface(context),
      body: AdaptiveLayout(
        compact: LoginForm(),
        medium: LoginForm(),
        expanded: const LoginWeb(),
      ),
    );
  }
}
