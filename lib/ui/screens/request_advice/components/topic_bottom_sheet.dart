import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/ui/shared/index.dart' show ReactivePlaintextField;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:svg_flutter/svg_flutter.dart';

class TopicBottomSheet extends StatelessWidget {
  const TopicBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final form = FormGroup({
      'topic': FormControl(value: '', validators: [Validators.required])
    });

    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: ReactiveForm(
        formGroup: form,
        child: Center(
          child: Column(
            spacing: defaultPadding,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 400
                ),
                child: SvgPicture.asset(Assets.conversationPicture),
              ),
              Text(
                'Ingrese el tema que desea tratar con su asesor.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const ReactivePlaintextField(
                formControlName: 'topic',
                hintText: '*Tema',
                textCapitalization: TextCapitalization.sentences,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: defaultPadding * 2
                ),
                child: FilledButton(
                  onPressed: () {
                    if (form.valid) context.pop((form.value['topic'] as String).trim());
                  },
                  child: const Text('Registrar asesoría')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}