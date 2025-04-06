import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart' show ReactiveTextField;

import 'animated_check.dart';

class ReactiveStrongPasswordField extends StatefulWidget {
  const ReactiveStrongPasswordField({super.key, required this.formControlName, this.textInputAction, required this.hintText});

  final String formControlName;
  final String hintText;
  final TextInputAction? textInputAction;

  @override
  State<ReactiveStrongPasswordField> createState() => _ReactiveStrongPasswordFieldState();
}

class _ReactiveStrongPasswordFieldState extends State<ReactiveStrongPasswordField> {
  final List<String> validPassConditions = [
    'Mayúsculas', 'Minúsculas', 'Números', 
    'Símbolo especial',
    '6 caracteres o más'
  ];

  late bool _obscureText = true;

  late bool
  _mayus = false,
  _minus = false,
  _numbers = false,
  _specialChar = false,
  _length6 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: defaultPadding,
      mainAxisSize: MainAxisSize.min,
      children: [
        ReactiveTextField(
          formControlName: widget.formControlName,
          textInputAction: widget.textInputAction,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _obscureText,
          decoration: InputDecoration(
            helperMaxLines: 5,
            helperText: 'Evita espacios en blanco y caracteres no válidos.',
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: const Icon(Icons.key_rounded),
            ),
            prefixIconColor: Colors.lightBlueAccent,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: defaultPadding),
              child: IconButton(
                onPressed: () => setState(() => _obscureText = !_obscureText),
                icon: _obscureText 
                ? const Icon(Icons.visibility_off_rounded) 
                : const Icon(Icons.visibility_rounded),
              ),
            ),
            hintText: widget.hintText,
          ),
          onChanged: (control) => _validatePassword(control.value as String),
        ),
        FittedBox(
          child: SizedBox(
            width: 160,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i < 5; i++)
                  Row(
                    children: [
                      switch (i) {
                        0 => AnimatedCheck(valid: _mayus),
                        1 => AnimatedCheck(valid: _minus),
                        2 => AnimatedCheck(valid: _numbers),
                        3 => AnimatedCheck(valid: _specialChar),
                        4 => AnimatedCheck(valid: _length6),
                        _ => AnimatedCheck(valid: false)
                      },
                      const SizedBox(width: defaultPadding * 0.75),
                      i == 3 
                        ? Tooltip(
                          message: '! @ # \$ % ^ & * ( ) _ +\n- = ? . , ; : / { } < > [ ] ~',
                          triggerMode: TooltipTriggerMode.tap,
                          child: Text(
                            validPassConditions[i],
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dotted
                            )
                          )
                        )
                        : Text(validPassConditions[i])
                    ],
                  )
              ],
            ),
          ),
        )
      ],
    );
  }

  void _validatePassword (String value) {
    setState(() {
      _mayus = value.contains(RegExp(r'[A-Z]'));
      _minus = value.contains(RegExp(r'[a-z]'));
      _numbers = value.contains(RegExp(r'[0-9]'));
      _specialChar = value.contains(RegExp(r'[!@#$%^&*()\_+\-=?.,;:/{}<>\[\]~]'));
      _length6 = value.length >= 6;
    });
  }
}