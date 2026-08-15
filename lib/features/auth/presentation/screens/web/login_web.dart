import 'package:flutter/material.dart';
import '../../widgets/login_form.dart';
import '../../widgets/web_login_Side_bar.dart';

class LoginWeb extends StatelessWidget {
  const LoginWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // side bar
        const WebLoginSideBar(),
        // login form
        Expanded(flex: 2, child: LoginForm()),
      ],
    );
  }
}
