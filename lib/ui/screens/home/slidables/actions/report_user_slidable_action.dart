import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart';
import 'package:aspartec_plus/ui/shared/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

class ReportUserSlidableAction extends ConsumerWidget {
  const ReportUserSlidableAction({super.key, required this.controller, required this.adviceId});

  final SlidableController controller;
  final String adviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlidableAction(
      autoClose: false,
      padding: EdgeInsets.all(defaultPadding / 2),
      onPressed: (_) => _reportUser(context, ref),
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
      label: 'Reportar',
      icon: Icons.report_rounded,
    );
  }

  Future<void> _reportUser (BuildContext context, WidgetRef ref) async {
    final message = await Dialogs.showReportDialog(context, 'Reportar asesoría');
    if (message == null) {
      controller.close();
      return;
    }

    if (context.mounted) Dialogs.showLoadingDialog(context);
    final adviceUseCase = ref.read(adviceUseCaseProvider);
    try {
      await adviceUseCase.reportAdvice(id: adviceId, message: message);
      if (context.mounted) {
        context.pop();
        Dialogs.showInformativeDialog(context, 'Reporte enviado. Analizaremos la situación y llevaremos a cabo las acciones necesarias.');
      }
    } catch (error) {
      if (context.mounted) {
        context.pop();
        Snackbars.showErrorSnackBar(context, 'Ha ocurrido un error al intentar enviar el reporte');
      }
    } finally {
      controller.close();
    }
  }
}