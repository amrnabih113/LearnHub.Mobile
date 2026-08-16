import 'package:flutter/material.dart';
import '../../widgets/register_form.dart';
import '../../widgets/web_auth_side_decoration.dart';

class RegisterWeb extends StatelessWidget {
  const RegisterWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // side decoration
        const WebAuthSideDecoration(),
        // register form
        Expanded(flex: 2, child: RegisterForm()),
      ],
    );
  }
}
