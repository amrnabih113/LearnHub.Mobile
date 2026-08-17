import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_layout.dart';
import 'package:learnhub/features/auth/presentation/screens/web/reset_password_web.dart';
import 'package:learnhub/features/auth/presentation/widgets/reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        compact: ResetPasswordForm(),
        expanded: ResetPasswordWeb(),
      ),
    );
  }
}
