import 'package:flutter/material.dart';
import '../../widgets/register_form.dart';
import '../../widgets/web_login_Side_bar.dart';

class RegisterWeb extends StatelessWidget {
  const RegisterWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // side bar
        const WebLoginSideBar(),
        // login form
        Expanded(flex: 2, child: RegisterForm()),
      ],
    );
  }
}
