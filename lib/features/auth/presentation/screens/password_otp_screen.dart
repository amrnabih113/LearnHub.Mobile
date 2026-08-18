import 'package:flutter/material.dart';
import '../../../../core/adaptive/adaptive_layout.dart';
import 'web/password_otp_web.dart';
import '../widgets/otp_verification_form.dart';

class PasswordOtpScreen extends StatelessWidget {
  const PasswordOtpScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        compact: OtpVerificationForm(email: email),
        expanded: PasswordOtpWeb(email: email),
      ),
    );
  }
}
