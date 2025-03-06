import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/ui/shared/index.dart' show ReactiveEmailField;
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart' show FormControl, FormGroup, ReactiveForm, Validators;
import 'package:svg_flutter/svg_flutter.dart';

import 'widgets/send_email_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recoveryForm = FormGroup({
      'recovery-email': FormControl(
        value: '',
        validators: [Validators.required, Validators.email]
      )
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Recuperación de contraseña'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Center(
            child: ReactiveForm(
              formGroup: recoveryForm,
              child: Column(
                spacing: defaultPadding,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 500
                    ),
                    child: AspectRatio(
                      aspectRatio: 4 / 3,
                      child: SvgPicture.asset(Assets.forgotPasswordPicture)
                    ),
                  ),
                  Text(
                    'Le enviaremos un mensaje a su dirección de correo electrónico, donde podrá reestablecer su contraseña.'
                  ),
                  ReactiveEmailField(formControlName: 'recovery-email'),
                  const SendEmailButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}