import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_layout.dart';
import '../../../../core/ui/dismiss_focus.dart';
import 'web/forget_password_web.dart';
import '../widgets/forget_password_form.dart';

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
