import 'package:flutter/material.dart';
import 'package:learnhub/core/adaptive/adaptive_layout.dart';
import 'package:learnhub/features/auth/presentation/screens/web/verify_email_web.dart';
import 'package:learnhub/features/auth/presentation/widgets/email_verification_form.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        compact: EmailVerificationForm(email: email),
        expanded: VerifyEmailWeb(email: email),
      ),
    );
  }
}
