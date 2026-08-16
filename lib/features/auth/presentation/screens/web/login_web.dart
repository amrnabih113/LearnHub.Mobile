import 'package:flutter/material.dart';
import '../../widgets/login_form.dart';
import '../../widgets/web_auth_side_decoration.dart';

class LoginWeb extends StatelessWidget {
  const LoginWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // side decoration
        const WebAuthSideDecoration(),
        // login form
        Expanded(flex: 2, child: LoginForm()),
      ],
    );
  }
}
