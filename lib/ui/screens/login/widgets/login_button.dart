import 'package:aspartec_plus/app/global/colors.dart' show seedColor;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show userUseCaseProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, Snackbars;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:reactive_forms/reactive_forms.dart' show AbstractControl, ReactiveForm;

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ReactiveForm.of(context);

    return ElevatedButton(
      onPressed: () => loginForm?.valid ?? false 
        ? _login(context, ref, loginForm!) 
        : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: seedColor,
        foregroundColor: Colors.white,
        minimumSize: Size(200, 45),
        elevation: 8
      ),
      child: const Text('Ingresar')
    );
  }

  void _login(BuildContext context, WidgetRef ref, AbstractControl loginForm) async {
    final userUseCase = ref.read(userUseCaseProvider);
    final (email, password) = formValues(loginForm.value as Map<String, dynamic>);
    
    loginForm.markAsDisabled();
    Dialogs.showLoadingDialog(context);
    userUseCase.login(email: email, password: password)
      .then((_) {
        loginForm.reset(removeFocus: true);
        if (context.mounted) context.goNamed('home');
      })
      .catchError((error) {
        if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString());
      })
      .whenComplete(() { 
        loginForm.markAsEnabled();
        if (context.mounted) context.pop();
      });
  }

  (String, String) formValues(Map<String, dynamic> map) => (map['email'], map['password']);
}
