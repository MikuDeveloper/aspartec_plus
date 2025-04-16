import 'package:aspartec_plus/app/global/values.dart' show formattedPhoneNumberRegex, passwordRegex;
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
        ValidationMessage.required: (error) => 'Este campo es requerido',
        ValidationMessage.email: (error) => 'Formato de correo inválido',
        ValidationMessage.pattern: (error) {
          final pattern = (error as Map)['requiredPattern'];
          if (pattern == formattedPhoneNumberRegex.pattern) {
            return 'Formato de teléfono inválido';
          }

          if (pattern == passwordRegex.pattern) {
            return 'Formato de contraseña inválido';
          }

          return 'pattern';
        },
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routerConfig,
        title: 'Aspartec+',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
      ),
    );
  }
}