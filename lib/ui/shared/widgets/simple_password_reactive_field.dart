import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart' show ReactiveTextField;

class SimplePasswordReactiveField extends StatefulWidget {
  const SimplePasswordReactiveField({super.key, required this.formControlName, required this.hintText, this.textInputAction});

  final String formControlName;
  final String hintText;
  final TextInputAction? textInputAction;

  @override
  State<SimplePasswordReactiveField> createState() => _SimplePasswordReactiveFieldState();
}

class _SimplePasswordReactiveFieldState extends State<SimplePasswordReactiveField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: widget.formControlName,
      textInputAction: widget.textInputAction,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Icon(Icons.lock_rounded, color: Colors.blueAccent),
        ),
        suffixIcon: ExcludeFocus(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: IconButton(
              onPressed: _changeVisibility,
              icon: Icon(_obscureText ? Icons.visibility_off_rounded : Icons.visibility_rounded)
            ),
          ),
        )
      ),
    );
  }

  void _changeVisibility() => setState(() => _obscureText = !_obscureText);
}