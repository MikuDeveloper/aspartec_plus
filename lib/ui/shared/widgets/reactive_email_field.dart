import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart' show ReactiveTextField;

class ReactiveEmailField extends StatelessWidget {
  const ReactiveEmailField({super.key, required this.formControlName, this.textInputAction});

  final String formControlName;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: '*Correo electrónico',
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Icon(Icons.email_rounded, color: Colors.lightGreen),
        )
      ),
    );
  }
}