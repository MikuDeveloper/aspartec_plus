import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show subjectsUseCaseProvider;
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, Snackbars;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SubjectOptions extends ConsumerWidget {
  const SubjectOptions({super.key, required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuAnchor(
      builder: (context, controller, _) => IconButton(
        onPressed: controller.isOpen ? controller.close : controller.open,
        icon: const Icon(Icons.more_vert_rounded)
      ),
      menuChildren: [
        MenuItemButton(
          onPressed: () async {
            final result = await Dialogs.showDecisiveDialog(
              context, 'Dar de baja "${subject.name}"' ,'Ya no recibirá solicitudes de asesorías de estudiante, pero deberá completar las asesorías que tenga pendientes.') ?? false;
            if (result && context.mounted) _removeSubject(context, ref);
          },
          leadingIcon: const Icon(Icons.bookmark_remove_rounded),
          child: const Text('Dejar materia')
        )
      ]
    );
  }

  void _removeSubject(BuildContext context, WidgetRef ref) {
    Dialogs.showLoadingDialog(context);
    final subjectsUseCase = ref.read(subjectsUseCaseProvider);
    final currentUser = ref.read(currentUserProvider.notifier);
    subjectsUseCase.leaveSubject(id: subject.id)
      .then((_) {
        if (context.mounted) {
          currentUser.update((current) {
            final subjects = current!.adviceTaught;
            subjects.remove(subject.id);
            return current.copyWith(adviceTaught: subjects);
          });
          Snackbars.showSuccessSnackBar(context, 'Materia removida con éxito.');
        }
      })
      .catchError((error) { if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString()); })
      .whenComplete(() => context.mounted ? context.pop() : () {});
  }
}