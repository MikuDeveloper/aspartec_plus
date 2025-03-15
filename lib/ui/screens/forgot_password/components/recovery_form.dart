import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/form_providers.dart' show forgotPasswordFormProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show ReactiveEmailField;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:reactive_forms/reactive_forms.dart' show ReactiveForm;
import 'package:svg_flutter/svg.dart';

import '../widgets/send_email_button.dart';

class RecoveryForm extends ConsumerWidget {
  const RecoveryForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recoveryForm = ref.watch(forgotPasswordFormProvider);
    
    return ReactiveForm(
      formGroup: recoveryForm,
      child: Center(
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
            ReactiveEmailField(formControlName: 'recoveryEmail'),
            const SendEmailButton()
          ],
        ),
      ),
    );
  }
}