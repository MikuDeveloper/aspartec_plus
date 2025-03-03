import 'package:aspartec_plus/app/global/colors.dart' show seedColor;
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';

import '../components/login_reactive_form.dart';

class GoToLoginButton extends StatelessWidget {
  const GoToLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    
    return ElevatedButton(
      onPressed: () => showModalBottomSheet(
        barrierColor: Colors.transparent,
        useSafeArea: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          side: BorderSide(
            color: brightness == Brightness.dark 
              ? Colors.white12 
              : Colors.black12,
            width: 1.5
          )
        ),
        context: context,
        builder: (context) => const SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: LoginReactiveForm(),
        )
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: seedColor,
        foregroundColor: Colors.white,
        minimumSize: Size(200, 40)
      ),
      child: const Text('Iniciar sesión')
    );
  }
}