import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show adviceUseCaseProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, Snackbars;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/stepper_provider.dart';

class CloseAdviceButton extends ConsumerWidget {
  const CloseAdviceButton({super.key, required this.adviceId});

  final String adviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evidence = ref.watch(evidenceProvider);
    final rating = ref.watch(ratingProvider);
    final stepNotifier = ref.read(currentStepProvider.notifier);

    return FilledButton.tonal(
      onPressed: () {
        if (evidence == null) {
          stepNotifier.state = 0;
          Snackbars.showInformativeSnackbar(context, 'Agrega alguna evidencia de la asesoría');
          return;
        }

        if (rating == 0) {
          stepNotifier.state = 1;
          Snackbars.showInformativeSnackbar(context, 'Asigna una calificación al estudiante');
          return;
        }

        _closeAdvice(context, ref);
      },
      child: const Text('Cerrar asesoría')
    );
  }

  Future<void> _closeAdvice(BuildContext context, WidgetRef ref) async {
    Dialogs.showLoadingDialog(context);
    try {
      await ref.read(adviceUseCaseProvider).closeAdvice(
        id: adviceId,
        rating: ref.read(ratingProvider.notifier).state,
        evidence: ref.read(evidenceProvider.notifier).state!
      );
      if (context.mounted) {
        Snackbars.showSuccessSnackBar(context, 'Se ha cerrado la asesoría');
        ref.invalidate(adviceProvider);
        context.goNamed('home');
      }
    } catch (error) {
      if (context.mounted) {
        Snackbars.showErrorSnackBar(context, error.toString());
        context.pop();
      }
    }
  }
}