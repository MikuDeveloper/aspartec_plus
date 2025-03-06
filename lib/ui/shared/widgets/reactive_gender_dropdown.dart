import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/form_providers.dart' show genderEntriesProvider;
import 'package:aspartec_plus/app/providers/register_providers.dart' show genderIconProvider, selectedGenderProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:reactive_forms/reactive_forms.dart' show ReactiveDropdownField;

class ReactiveGenderDropdown extends ConsumerWidget {
  const ReactiveGenderDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveDropdownField(
      isExpanded: true,
      formControlName: 'gender',
      items: ref.watch(genderEntriesProvider),
      onChanged: (control) => ref.read(selectedGenderProvider.notifier).state = control.value,
      decoration: InputDecoration(
        hintText: '*Género',
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: ref.watch(genderIconProvider),
        )
      ),
    );
  }
}