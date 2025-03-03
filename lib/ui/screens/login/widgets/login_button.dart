import 'package:aspartec_plus/app/global/colors.dart' show seedColor;
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart' show AbstractControl, ReactiveForm;

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = ReactiveForm.of(context);

    return ElevatedButton(
      onPressed: () => _login(loginForm),
      style: ElevatedButton.styleFrom(
        backgroundColor: seedColor,
        foregroundColor: Colors.white,
        minimumSize: Size(200, 45),
        elevation: 8
      ),
      child: const Text('Ingresar')
    );
  }

  void _login(AbstractControl? form) {
    if (form != null && form.valid) {
      // TODO: Add logic to access.

      form.reset();
    }
  }
}