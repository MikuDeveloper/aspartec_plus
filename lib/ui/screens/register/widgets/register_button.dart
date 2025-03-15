import 'package:aspartec_plus/app/providers/form_providers.dart';
import 'package:aspartec_plus/app/providers/register_providers.dart' show selectedRoleProvider, stepProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show userUseCaseProvider;
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:aspartec_plus/ui/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:go_router/go_router.dart';

class RegisterButton extends ConsumerWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.read(stepProvider.notifier);
    final selectedRole = ref.read(selectedRoleProvider);
    final personalDataForm = ref.read(personalDataFormProvider);
    final schoolDataForm = ref.read(schoolDataFormProvider);
    final crendentialsForm = ref.read(credentialsFormProvider);

    return FilledButton(
      onPressed: () {
        if (selectedRole == null) {
          step.state = 0;
          Snackbars.showInformativeSnackbar(context, 'Selecciona el rol que deseas desempeñar.');
          return;
        }

        if (personalDataForm.invalid) {
          step.state = 1;
          Snackbars.showInformativeSnackbar(context, 'Completa correctamente tu información personal.');
          return;
        }

        if (schoolDataForm.invalid) {
          step.state = 2;
          Snackbars.showInformativeSnackbar(context, 'Completa correctamente tu información escolar.');
          return;
        }

        if (crendentialsForm.invalid) {
          step.state = 3;
          Snackbars.showInformativeSnackbar(context, 'Ingresa credenciales de acceso válidas.');
          return;
        }

        Dialogs.showLoadingDialog(context);
        final aspartecUser = AspartecUser.fromJson({
          ...{'role' : selectedRole},
          ...(personalDataForm.value as Map<String, dynamic>),
          ...(schoolDataForm.value as Map<String, dynamic>),
        });
        
        registerUser(context, ref, aspartecUser, crendentialsForm.value);
      },
      child: const Text('Finalizar')
    );
  }

  Future<void> registerUser(BuildContext context, WidgetRef ref, AspartecUser aspartecUser, Map<String, dynamic> credentialsForm) async {
    final userUseCase = ref.read(userUseCaseProvider);
    try {
      await userUseCase.registerAccount(email: credentialsForm['email'], password: credentialsForm['password']);
      await userUseCase.registerData(aspartecUser: aspartecUser);
      if (context.mounted) context.goNamed('home');
    } catch (error) {
      if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString());
    } finally {
      if (context.mounted) context.pop();
    }
  }
}