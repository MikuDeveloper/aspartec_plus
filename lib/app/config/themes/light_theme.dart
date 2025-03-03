import 'package:aspartec_plus/app/global/colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorSchemeSeed: seedColor,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    helperMaxLines: 5,
    errorMaxLines: 5,
    constraints: BoxConstraints(maxWidth: 400),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(50)
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Colors.transparent,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50)
      )
    )
  ),
  brightness: Brightness.light
);