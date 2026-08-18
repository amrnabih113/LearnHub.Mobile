import 'package:flutter/material.dart';
import '../../widgets/email_verification_form.dart';
import '../../widgets/web_auth_side_decoration.dart';

class VerifyEmailWeb extends StatelessWidget {
  const VerifyEmailWeb({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // side decoration
        const WebAuthSideDecoration(
          titleLines: ['One step', 'closer.'],
          highlightedLine: 1,
          subtitle:
              'Enter the verification code we sent to your email to securely continue your learning journey.',
        ),
        Expanded(flex: 2, child: EmailVerificationForm(email: email)),
      ],
    );
  }
}