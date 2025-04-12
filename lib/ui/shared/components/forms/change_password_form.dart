import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/form_providers.dart' show updatePasswordFormProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show ReactiveStrongPasswordField, SimplePasswordReactiveField;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ChangePasswordForm extends ConsumerWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveForm(
      formGroup: ref.watch(updatePasswordFormProvider),
      child: Column(
        spacing: defaultPadding,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SimplePasswordReactiveField(
            formControlName: 'oldPassword',
            hintText: '*Contraseña actual',
            textInputAction: TextInputAction.next
          ),
          ReactiveStrongPasswordField(
            formControlName: 'newPassword',
            hintText: '*Nueva contraseña',
            textInputAction: TextInputAction.done,
          ),
        ],
      )
    );
  }
}