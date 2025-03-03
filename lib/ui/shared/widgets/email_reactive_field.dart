import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart' show ReactiveTextField;

class EmailReactiveField extends StatelessWidget {
  const EmailReactiveField({super.key, required this.formControlName});

  final String formControlName;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Correo electrónico',
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Icon(Icons.email_rounded, color: Colors.lightGreen),
        )
      ),
    );
  }
}