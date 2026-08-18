import 'package:flutter/material.dart';
import '../../widgets/reset_password_form.dart';
import '../../widgets/web_auth_side_decoration.dart';

class ResetPasswordWeb extends StatelessWidget {
  const ResetPasswordWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // side decoration
        const WebAuthSideDecoration(
          titleLines: ['A fresh', 'start.'],
          highlightedLine: 1,
          subtitle:
              'Create a new password and get back to learning with confidence.',
        ),
        Expanded(flex: 2, child: ResetPasswordForm()),
      ],
    );
  }
}
