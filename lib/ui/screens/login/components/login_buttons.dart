import 'package:aspartec_plus/app/global/values.dart';
import 'package:flutter/material.dart';

import '../widgets/open_login_button.dart';
import '../widgets/go_to_register_button.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        spacing: defaultPadding / 2,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const GoToLoginButton(),
          const GoToRegisterButton()
        ],
      ),
    );
  }
}