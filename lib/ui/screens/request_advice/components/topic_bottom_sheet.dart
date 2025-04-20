import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/ui/shared/index.dart' show ReactivePlaintextField;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:svg_flutter/svg_flutter.dart';

final formProvider = Provider.autoDispose((ref) => FormGroup({
  'topic': FormControl(value: '', validators: [Validators.required])
}));

class TopicBottomSheet extends ConsumerWidget {
  const TopicBottomSheet({super.key, required this.subjectName});

  final String subjectName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(formProvider);

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
                subjectName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
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