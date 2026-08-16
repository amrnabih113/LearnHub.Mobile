import 'package:flutter/material.dart';
import 'package:learnhub/core/ui/dismiss_focus.dart';
import '../../../../core/adaptive/adaptive_layout.dart';
import '../../../../core/utils/my_colors.dart';
import 'web/register_web.dart';
import '../widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.surface(context),
      body: DismissFocus(
        child: AdaptiveLayout(
          compact: const RegisterForm(),
          medium: const RegisterForm(),
          expanded: const RegisterWeb(),
        ),
      ),
    );
  }
}
