import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';

import '../widgets/register_button.dart';

class StepperControls extends StatelessWidget {
  const StepperControls({
    super.key,
    required this.currentStep,
    required this.cancelAction,
    required this.continueAction
  });

  final int currentStep;
  final VoidCallback cancelAction;
  final VoidCallback continueAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding,
        horizontal: defaultPadding / 2
      ),
      child: Wrap(
        spacing: defaultPadding,
        runSpacing: defaultPadding / 2,
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.center,
        children: [
          currentStep > 0
            ? TextButton(onPressed: cancelAction, child: const Text('Atrás'))
            : const SizedBox.shrink(),
          currentStep < 3
            ? FilledButton.tonal(onPressed: continueAction, child: const Text('Continuar'))
            : const RegisterButton()
        ],
      ),
    );
  }
}