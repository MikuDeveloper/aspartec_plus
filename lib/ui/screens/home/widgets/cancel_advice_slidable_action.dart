import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show adviceUseCaseProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, Snackbars;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart' show SlidableAction, SlidableController;
import 'package:go_router/go_router.dart';

class CancelAdviceSlidableAction extends ConsumerWidget {
  const CancelAdviceSlidableAction({super.key, required this.controller, required this.adviceId});

  final SlidableController controller;
  final String adviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlidableAction(
      autoClose: false,
      padding: EdgeInsets.all(defaultPadding / 2),
      onPressed: (_) async {
        final accept = await Dialogs.showDecisiveDialog(context, 'Cancelar asesoría', '¿Desea cancelar la asesoría? El asesor será notificado de esta acción.');
        if (accept && context.mounted) await _closeAdvice(context, ref);
        controller.close();
      },
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      label: 'Cancelar',
      icon: Icons.cancel_rounded,
    );
  }

  Future<void> _closeAdvice(BuildContext context, WidgetRef ref) async {
    Dialogs.showLoadingDialog(context);
    try {
      await ref.read(adviceUseCaseProvider).cancelAdvice(id: adviceId);
      if (context.mounted) {
        ref.invalidate(adviceProvider);
        Snackbars.showInformativeSnackbar(context, 'Asesoría cancelada');
      }
    } catch (error) {
      if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString());
    } finally {
      if (context.mounted) context.pop();
    }
  }
}