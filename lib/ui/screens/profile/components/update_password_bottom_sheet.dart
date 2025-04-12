import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/form_providers.dart' show updatePasswordFormProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart';
import 'package:aspartec_plus/ui/shared/components/forms/change_password_form.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, Snackbars;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UpdatePasswordBottomSheet extends ConsumerWidget {
  const UpdatePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(updatePasswordFormProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        spacing: defaultPadding,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Actualización de contraseña',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold
            )
          ),
          const ChangePasswordForm(),
          FilledButton(
            onPressed: () {
              if (form.valid) {
                final passwords = form.value as Map<String, dynamic>;
                _updatePassword(context, ref, passwords);
              }
            },
            child: const Text('Actualizar contraseña')
          )
        ],
      ),
    );
  }

  Future<void> _updatePassword(BuildContext context, WidgetRef ref, Map<String, dynamic> passwords) async {
    final userUseCase = ref.read(userUseCaseProvider);
    Dialogs.showLoadingDialog(context);
    await userUseCase.changePassword(oldPassword: passwords['oldPassword'], newPassword: passwords['newPassword'])
      .then((_) {
        if (context.mounted) Snackbars.showSuccessSnackBar(context, 'Contraseña actualizada');
      })
      .catchError((error) {
        if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString());
      })
      .whenComplete(() => context.mounted ? context.pop() : () {});
    if (context.mounted) context.pop();
  }
}