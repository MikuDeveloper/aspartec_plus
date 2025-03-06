import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart' show ReactiveTextField;

class ReactiveNameField extends StatelessWidget {
  const ReactiveNameField({super.key, required this.formControlName, required this.hintText});

  final String formControlName;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Icon(Icons.short_text_rounded),
        ),
        prefixIconColor: Colors.amberAccent
      )
    );
  }
}