import 'package:aspartec_plus/app/global/values.dart' show defaultPadding, setPhoneNumberFormat;
import 'package:aspartec_plus/app/providers/form_providers.dart' show personalDataFormProvider;
import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:aspartec_plus/app/providers/register_providers.dart' show selectedGenderProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show userUseCaseProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, PersonalDataForm, Snackbars;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditPersonalDataBottomSheet extends ConsumerWidget {
  const EditPersonalDataBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(currentUserProvider.notifier).state;
    final gender = ref.read(selectedGenderProvider.notifier);
    final form = ref.read(personalDataFormProvider);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        form.markAsDisabled();
        form.updateValue({
          'firstname': user?.firstname,
          'lastname1': user?.lastname1,
          'lastname2': user?.lastname2,
          'gender': user?.gender,
          'phoneNumber': setPhoneNumberFormat(user?.phoneNumber ?? '')
        });
        gender.state = user?.gender;
      }
    );

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
                  'Datos personales',
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
          const PersonalDataForm(),
          FilledButton(
            onPressed: () {
              if (form.enabled && form.dirty) {
                final data = form.value as Map<String, dynamic>;
                _updateData(context, ref, data);
              }
            },
            child: const Text('Guardar cambios')
          )
        ],
      ),
    );
  }

  Future<void> _updateData(BuildContext context, WidgetRef ref, Map<String, dynamic> data) async {
    Dialogs.showLoadingDialog(context);
    final map = {
      'firstname': data['firstname'],
      'lastname1': data['lastname1'],
      'lastname2': data['lastname2'],
      'gender': data['gender'],
      'phoneNumber': (data['phoneNumber'] as String).replaceAll(RegExp(r'[^0-9]'), '')
    };
    final userUseCase = ref.read(userUseCaseProvider);
    await userUseCase.updatePersonalData(personalData: map)
      .then((_) {
        ref.read(currentUserProvider.notifier).update((user) {
          return user?.copyWith(
            firstname: data['firstname'],
            lastname1: data['lastname1'],
            lastname2: data['lastname2'],
            gender: data['gender'],
            phoneNumber: (data['phoneNumber'] as String).replaceAll(RegExp(r'[^0-9]'), '')
          );
        });
        if (context.mounted) Snackbars.showSuccessSnackBar(context, 'Información actualizada.');
      })
      .catchError((error) {
        if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString());
      })
      .whenComplete(() => context.mounted ? context.pop() : () {});
    if (context.mounted) context.pop();
  }
}
