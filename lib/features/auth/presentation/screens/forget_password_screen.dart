import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_layout.dart';
import 'package:learnhub/core/ui/dismiss_focus.dart';
import 'package:learnhub/features/auth/presentation/screens/web/forget_password_web.dart';
import 'package:learnhub/features/auth/presentation/widgets/forget_password_form.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissFocus(
        child: AdaptiveLayout(
          compact: ForgetPasswordForm(),
          expanded: ForgetPasswordWeb(),
        ),
      ),
    );
  }
}
