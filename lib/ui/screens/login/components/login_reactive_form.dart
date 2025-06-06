import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/form_providers.dart' show loginFormProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show ReactiveEmailField, SimplePasswordReactiveField;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart' show ReactiveForm;

import '../widgets/login_button.dart';

class LoginReactiveForm extends ConsumerWidget {
  const LoginReactiveForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveForm(
      formGroup: ref.watch(loginFormProvider),
      child: Column(
        spacing: defaultPadding,
        children: [
          Text(
            'INICIO DE SESIÓN',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(thickness: 2),
          const ReactiveEmailField(
            formControlName: 'email',
            textInputAction: TextInputAction.next
          ),
          const SimplePasswordReactiveField(
            formControlName: 'password',
            hintText: '*Contraseña',
            textInputAction: TextInputAction.done,
          ),
          TextButton(
            onPressed: () => context.pushNamed('forgot-password'),
            child: const Text('Olvidé mi contraseña', textAlign: TextAlign.center)
          ),
          ExcludeFocus(child: const SizedBox.shrink()),
          const LoginButton(),
          ExcludeFocus(child: const SizedBox.shrink()),
        ],
      )
    );
  }
}