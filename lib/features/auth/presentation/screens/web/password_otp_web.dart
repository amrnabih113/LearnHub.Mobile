import 'package:flutter/material.dart';
import 'package:learnhub/features/auth/presentation/widgets/otp_verification_form.dart';
import 'package:learnhub/features/auth/presentation/widgets/web_auth_side_decoration.dart';

class PasswordOtpWeb extends StatelessWidget {
  const PasswordOtpWeb({super.key, this.email});
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
        Expanded(flex: 2, child: OtpVerificationForm(email: email)),
      ],
    );
  }
}
