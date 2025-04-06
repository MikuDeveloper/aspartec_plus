import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart' show MaskedInputFormatter;
import 'package:reactive_forms/reactive_forms.dart'show ReactiveTextField;

class ReactivePhoneField extends StatelessWidget {
  const ReactivePhoneField({super.key,required this.formControlName, this.textInputAction});

  final String formControlName;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      textInputAction: textInputAction,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: '*Teléfono',
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Icon(Icons.phone_rounded),
        ),
        prefixIconColor: Colors.greenAccent,
      ),
      inputFormatters: [
        MaskedInputFormatter('(###) ###-####')
      ],
    );
  }
}