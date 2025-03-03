import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoToRegisterButton extends StatelessWidget {
  const GoToRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => context.pushNamed('register'),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(200, 40)
      ),
      child: Text(
        'Registrarse'
      ),
    );
  }
}