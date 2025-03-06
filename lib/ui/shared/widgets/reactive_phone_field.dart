import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart' show MaskedInputFormatter;
import 'package:reactive_forms/reactive_forms.dart'show ReactiveTextField, ValidationMessage;

class ReactivePhoneField extends StatelessWidget {
  const ReactivePhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: 'phoneNumber',
      validationMessages: {
        ValidationMessage.pattern: (error) => 'Formato de teléfono inválido.'
      },
      textInputAction: TextInputAction.done,
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