import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show subjectsUseCaseProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, Snackbars;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:go_router/go_router.dart';

class RegisterAdviceButton extends ConsumerWidget {
  const RegisterAdviceButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () async {
        final id = await context.pushNamed('register-subject');
        if (id.runtimeType == String && context.mounted) _registerSubject(context, ref, id as String);
      },
      icon: const Icon(Icons.add_rounded),
      label: const Text('Agregar')
    );
  }

  void _registerSubject(BuildContext context, WidgetRef ref, String id) async {
    Dialogs.showLoadingDialog(context);
    final subjectsUseCase = ref.read(subjectsUseCaseProvider);
    final currentUser = ref.read(currentUserProvider.notifier);
    try {
      await subjectsUseCase.joinSubject(id: id);
      currentUser.update((current) {
        final subjects = current!.adviceTaught;
        subjects.add(id);
        return current.copyWith(adviceTaught: subjects);
      });
      if (context.mounted) Snackbars.showSuccessSnackBar(context, 'Materia registrada con éxito.');
    } catch (error) {
      if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString());
    } finally {
      if (context.mounted) context.pop();
    }
  }
}