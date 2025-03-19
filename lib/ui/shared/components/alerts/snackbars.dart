import 'package:flutter/material.dart';

class Snackbars {
  Snackbars._();

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        backgroundColor: Colors.green,
        content: Text(message, style: TextStyle(color: Colors.white))
      )
    );
  }
    
  
  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        backgroundColor: Colors.red,
        content: Text(message, style: TextStyle(color: Colors.white))
      )
    );
  }
    

  static void showInformativeSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Colors.white,
        backgroundColor: Colors.lightBlueAccent,
        content: Text(message, style: TextStyle(color: Colors.white))
      )
    );
  }
}