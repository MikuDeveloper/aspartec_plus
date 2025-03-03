import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart' show AbstractControl, ReactiveForm;

class SendEmailButton extends StatelessWidget {
  const SendEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context);

    return FilledButton(
      onPressed: () => _sendEmail(form),
      child: const Text(
        'Enviar correo de recuperación',
        textAlign: TextAlign.center,
      )
    );
  }

  void _sendEmail(AbstractControl? form) {
    if (form != null && form.valid) {
      // TODO: Add logic to send recovery email. 
      form.reset();
    }
  }
}