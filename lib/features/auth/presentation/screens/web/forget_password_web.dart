import 'package:flutter/material.dart';
import 'package:learnhub/features/auth/presentation/widgets/forget_password_form.dart';
import 'package:learnhub/features/auth/presentation/widgets/web_auth_side_decoration.dart';

class ForgetPasswordWeb extends StatelessWidget {
  const ForgetPasswordWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // side decoration
        const WebAuthSideDecoration(
          titleLines: ['Get back', 'to learning.'],
          highlightedLine: 1,
          subtitle:
              'Don’t worry. We’ll help you securely recover your account so you can continue your learning journey.',
        ),
        // login form
        Expanded(flex: 2, child: ForgetPasswordForm()),
      ],
    );
  }
}
