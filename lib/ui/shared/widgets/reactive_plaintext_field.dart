import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart' show ReactiveTextField;

class ReactivePlaintextField extends StatelessWidget {
  const ReactivePlaintextField({
    super.key,
    required this.formControlName,
    required this.hintText,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.textInputType
  });

  final String formControlName;
  final String hintText;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Icon(Icons.short_text_rounded),
        ),
        prefixIconColor: Colors.amber
      )
    );
  }
}