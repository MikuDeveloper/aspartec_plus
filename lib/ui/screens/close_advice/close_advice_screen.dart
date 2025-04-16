import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/confirm_step_content.dart';
import 'components/evidence_step_content.dart';
import 'components/rating_step_content.dart';
import 'providers/stepper_provider.dart';
import 'widgets/close_advice_button.dart';

class CloseAdviceScreen extends ConsumerWidget {
  const CloseAdviceScreen({super.key, required this.adviceId});

  final String adviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(currentStepProvider);
    final stepNotifier = ref.read(currentStepProvider.notifier);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cierre de asesoría'),
      ),
      body: Stepper(
        currentStep: currentStep,
        controlsBuilder: _controlsBuilder,
        onStepCancel: () => stepNotifier.state--,
        onStepContinue: () => stepNotifier.state++,
        onStepTapped: (value) => stepNotifier.state = value,
        type: size.width < 700 ? StepperType.vertical : StepperType.horizontal,
        steps: [
          Step(
            stepStyle: currentStep >= 0 ? ref.read(stepStyleProvider) : null,
            title: const Text('Seleccionar evidencia'),
            content: const EvidenceStepContent()
          ),
          Step(
            stepStyle: currentStep >= 1 ? ref.read(stepStyleProvider) : null,
            title: const Text('Evaluar estudiante'),
            content: const RatingStepContent()
          ),
          Step(
            stepStyle: currentStep == 2 ? ref.read(stepStyleProvider) : null,
            title: const Text('Confirmar cierre'),
            content: const ConfirmStepContent()
          )
        ],
      )
    );
  }

  Widget _controlsBuilder(BuildContext context, ControlsDetails details) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding
      ),
      child: Row(
        spacing: defaultPadding,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          details.currentStep == 0
            ? const SizedBox.shrink()
            : TextButton(
                onPressed: details.onStepCancel,
                child: const Text('Volver')
              ),
          if (details.currentStep < 2)
            FilledButton.tonal(
              onPressed: details.onStepContinue,
              child: const Text('Continuar')
            ),
          if (details.currentStep == 2)
            CloseAdviceButton(adviceId: adviceId)
        ],
      ),
    );
  }
}