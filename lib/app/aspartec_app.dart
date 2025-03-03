import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart' show ReactiveFormConfig, ValidationMessage;

import 'config/routes/router.dart';
import 'config/themes/dark_theme.dart';
import 'config/themes/light_theme.dart';

class AspartecApp extends StatelessWidget {
  const AspartecApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'Este campo es requerido.',
        ValidationMessage.email: (error) => 'Formato de correo inválido.'
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routerConfig,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}