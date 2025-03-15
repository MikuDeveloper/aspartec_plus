import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show userUseCaseProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, Snackbars;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:reactive_forms/reactive_forms.dart' show AbstractControl, ReactiveForm;

class SendEmailButton extends ConsumerWidget {
  const SendEmailButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ReactiveForm.of(context);

    return FilledButton(
      onPressed: () => form?.valid ?? false 
        ? _sendRecoveryEmail(context, ref, form!)
        : () {},
      child: const Text(
        'Enviar correo de recuperación',
        textAlign: TextAlign.center,
      )
    );
  }

  void _sendRecoveryEmail(BuildContext context, WidgetRef ref, AbstractControl form) {
    final userUseCase = ref.read(userUseCaseProvider);
    final recoveryEmail = (form.value as Map<String, dynamic>)['recoveryEmail'];
    
    Dialogs.showLoadingDialog(context);
    userUseCase.resetPassword(email: recoveryEmail)
      .then((_) {
        form.reset(removeFocus: true);
        if (context.mounted) {
          Snackbars.showInformativeSnackbar(context, 'Correo electrónico de recuperación enviado.');
        }
      })
      .catchError((error) { if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString()); })
      .whenComplete(() { if (context.mounted) Navigator.pop(context); });
  }
}