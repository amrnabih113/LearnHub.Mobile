import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_layout.dart';
import 'web/verify_email_web.dart';
import '../widgets/email_verification_form.dart';

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
