import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/form_providers.dart' show majorEntriesProvider, schoolDataFormProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:reactive_forms/reactive_forms.dart' show ReactiveForm, ReactiveDropdownField, ReactiveTextField;
import 'package:svg_flutter/svg.dart';

class SchoolDataForm extends ConsumerWidget {
  const SchoolDataForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveForm(
      formGroup: ref.watch(schoolDataFormProvider),
      child: Wrap(
        spacing: defaultPadding * 2,
        runSpacing: defaultPadding / 2,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 400
            ),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: SvgPicture.asset(Assets.schoolPicture),
            ),
          ),
          Column(
            spacing: defaultPadding,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReactiveDropdownField(
                formControlName: 'major',
                items: ref.watch(majorEntriesProvider),
                isExpanded: true,
                decoration: InputDecoration(
                  hintText: '*Programa educativo',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Icon(Icons.school_rounded),
                  ),
                  prefixIconColor: Colors.redAccent
                ),
              ),
              ReactiveTextField(
                formControlName: 'controlNumber',
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  hintText: '*Número de control',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Icon(Icons.person_search_rounded),
                  ),
                  prefixIconColor: Colors.lightBlueAccent
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}