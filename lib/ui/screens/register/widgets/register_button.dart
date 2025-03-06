import 'package:aspartec_plus/app/providers/form_providers.dart';
import 'package:aspartec_plus/app/providers/register_providers.dart' show selectedRoleProvider, stepProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:go_router/go_router.dart';

class RegisterButton extends ConsumerWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.read(stepProvider.notifier);
    final selectedRole = ref.watch(selectedRoleProvider);
    final personalDataForm = ref.watch(personalDataFormProvider);
    final schoolDataForm = ref.watch(schoolDataFormProvider);
    final crendentialsForm = ref.watch(credentialsFormProvider);

    return FilledButton(
      onPressed: () {
        if (selectedRole == null) {
          step.state = 0;
          return;
        }

        if (personalDataForm.invalid) {
          step.state = 1;
          return;
        }

        if (schoolDataForm.invalid) {
          step.state = 2;
          return;
        }

        if (crendentialsForm.invalid) {
          step.state = 3;
          return;
        }
        // TODO: Implement logic to register a new user

        context.goNamed('home');
      },
      child: const Text('Finalizar')
    );
  }
}