import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/form_providers.dart' show deleteAccountFormProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, SimplePasswordReactiveField, Snackbars;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DeleteAccountBottomSheet extends ConsumerWidget {
  const DeleteAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(deleteAccountFormProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: ReactiveForm(
        formGroup: form,
        child: Column(
          spacing: defaultPadding,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Eliminación de cuenta',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
            const SimplePasswordReactiveField(
              formControlName: 'currentPassword',
              hintText: '*Contraseña actual',
              textInputAction: TextInputAction.done,
            ),
            Text(
              'Ingrese su contraseña para borrar su cuenta. Todos sus datos serán eliminados.',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            FilledButton(
              onPressed: () {
                if (form.valid) {
                  final password = (form.value as Map<String, dynamic>)['currentPassword'];
                  _deleteAccount(context, ref, password);
                }
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white
              ),
              child: const Text('Borrar cuenta')
            )
          ],
        )
      ),
    );
  }

  Future<void> _deleteAccount(BuildContext context, WidgetRef ref, String password) async {
    Dialogs.showLoadingDialog(context);
    final userUseCase = ref.watch(userUseCaseProvider);
    await userUseCase.deleteAccount(password: password)
      .then((_) {
        if (context.mounted) {
          Snackbars.showSuccessSnackBar(context, 'Cuenta eliminada');
          context.goNamed('login');
        }
      })
      .catchError((error) {
        if (context.mounted) {
          context.pop();
          Dialogs.showInformativeDialog(context, error.toString());
        }
      });
  }
}