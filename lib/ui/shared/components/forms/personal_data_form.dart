import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/form_providers.dart' show personalDataFormProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:reactive_forms/reactive_forms.dart' show ReactiveForm;

import '../../widgets/reactive_gender_dropdown.dart';
import '../../widgets/reactive_plaintext_field.dart';
import '../../widgets/reactive_phone_field.dart';

class PersonalDataForm extends ConsumerWidget {
  const PersonalDataForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveForm(
      formGroup: ref.watch(personalDataFormProvider),
      child: Column(
        spacing: defaultPadding,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ReactivePlaintextField(
            formControlName: 'firstname',
            hintText: '*Nombre(s)',
            textCapitalization: TextCapitalization.words,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next
          ),
          const ReactivePlaintextField(
            formControlName: 'lastname1',
            hintText: '*Primer apellido',
            textCapitalization: TextCapitalization.words,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next
          ),
          const ReactivePlaintextField(
            formControlName: 'lastname2',
            hintText: 'Segundo apellido',
            textCapitalization: TextCapitalization.words,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next
          ),
          const ReactiveGenderDropdown(),
          const ReactivePhoneField(
            formControlName: 'phoneNumber',
            textInputAction: TextInputAction.done,
          )
        ],
      ),
    );
  }
}