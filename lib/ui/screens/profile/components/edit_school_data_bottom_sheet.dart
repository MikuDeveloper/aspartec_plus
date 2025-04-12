import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/form_providers.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show userUseCaseProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, SchoolDataForm, Snackbars;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditSchoolDataBottomSheet extends ConsumerWidget {
  const EditSchoolDataBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(currentUserProvider.notifier).state;
    final form = ref.read(schoolDataFormProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      form.markAsDisabled();
      form.updateValue({
        'controlNumber': user?.controlNumber,
        'major': user?.major
      });
    });

    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        spacing: defaultPadding,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Datos escolares',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold
                  )
                )
              ),
              IconButton.filledTonal(
                onPressed: () => form.enabled 
                  ? form.markAsDisabled()
                  : form.markAsEnabled(),
                icon: const Icon(Icons.edit_rounded),
              ),
            ],
          ),
          const SchoolDataForm(),
          FilledButton(
            onPressed: form.enabled ? () {
              if (form.enabled && form.dirty) {
                final data = form.value as Map<String, dynamic>;
                _updateData(context, ref, data);
              }
            } : null,
            child: const Text('Actualizar información')
          )
        ],
      ),
    );
  }

  Future<void> _updateData(BuildContext context, WidgetRef ref, Map<String, dynamic> data) async {
    Dialogs.showLoadingDialog(context);
    final userUseCase = ref.read(userUseCaseProvider);
    await userUseCase.updateSchoolData(schoolData: data)
      .then((_) {
        if (context.mounted) {
          ref.read(currentUserProvider.notifier).update((user) {
            return user?.copyWith(
              controlNumber: data['controlNumber'],
              major: data['major']
            );
          });
          Snackbars.showSuccessSnackBar(context, 'Información actualizada.');
        }
      })
      .catchError((error) {
        if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString());
      })
      .whenComplete(() => context.mounted ? context.pop() : () {});
    if (context.mounted) context.pop();
  }
}