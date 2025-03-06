import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/form_providers.dart' show credentialsFormProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show ReactiveEmailField;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:reactive_forms/reactive_forms.dart' show ReactiveForm;

import '../../widgets/reactive_strong_password_field.dart';

class CredentialsForm extends ConsumerWidget {
  const CredentialsForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveForm(
      formGroup: ref.watch(credentialsFormProvider),
      child: Column(
        spacing: defaultPadding,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReactiveEmailField(
            formControlName: 'email',
            textInputAction: TextInputAction.next
          ),
          ReactiveStrongPasswordField(
            formControlName: 'password',
            hintText: 'Contraseña'
          )
        ],
      ),
    );
  }
}