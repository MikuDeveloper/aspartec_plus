import 'package:aspartec_plus/app/providers/register_providers.dart' show stepProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show CredentialsForm, PersonalDataForm, SchoolDataForm;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;

import 'components/role_selection.dart';
import 'components/stepper_controls.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(stepProvider);
    final step = ref.read(stepProvider.notifier);
    final size = MediaQuery.of(context).size;

    bool isActiveStep(int step) => currentStep >= step;

    StepStyle? setStepStyle(int step) => isActiveStep(step) 
      ? StepStyle(
        color: Colors.pinkAccent,
        connectorColor: Colors.pinkAccent.shade100,
        connectorThickness: 3
      )
      : null;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de nuevo usuario'),
      ),
      body: SafeArea(
        child: Stepper(
          currentStep: currentStep,
          type: size.width < 700 ? StepperType.vertical : StepperType.horizontal,
          onStepCancel: () => step.state--,
          onStepContinue: () => step.state++,
          onStepTapped: (value) => step.state = value,
          stepIconBuilder: _iconBuilder,
          controlsBuilder: (context, details) => _controlsBuilder(context, details, currentStep),
          steps: [
            Step(
              stepStyle: setStepStyle(0),
              isActive: isActiveStep(0),
              title: const Text('Perfil'),
              content: const RoleSelection()
            ),
            Step(
              stepStyle: setStepStyle(1),
              isActive: isActiveStep(1),
              title: const Text('Datos personales'),
              content: const PersonalDataForm()
            ),
            Step(
              stepStyle: setStepStyle(2),
              isActive: isActiveStep(2),
              title: const Text('Datos escolares'),
              content: const SchoolDataForm()
            ),
            Step(
              stepStyle: setStepStyle(3),
              isActive: isActiveStep(3),
              title: const Text('Credenciales'),
              content: const CredentialsForm()
            ),
          ]
        ),
      )
    );
  }

  Widget _controlsBuilder(BuildContext context, ControlsDetails details, int currentStep) => StepperControls(
    currentStep: currentStep,
    cancelAction: details.onStepCancel!,
    continueAction: details.onStepContinue!
  );

  Widget _iconBuilder(int step, _) => switch(step) {
    0 => const Icon(Icons.person_rounded, color: Colors.white, size: 18),
    1 => const Icon(Icons.fact_check_rounded, color: Colors.white, size: 18),
    2 => const Icon(Icons.school_rounded, color: Colors.white, size: 18),
    3 => const Icon(Icons.key_rounded, color: Colors.white, size: 18),
    _ => Text('$step')
  };
}