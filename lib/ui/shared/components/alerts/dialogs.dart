import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dialogs {
  Dialogs._();

  static void showLoadingDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Dialog.fullscreen(
        backgroundColor: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      )
    );

  static Future<bool> showDecisiveDialog(BuildContext context, String title, String decision, [Icon? icon]) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: icon,
        title: Text(title, textAlign: TextAlign.center),
        content: Text(decision),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: const Text('Cancelar')
          ),
          FilledButton(
            onPressed: () => context.pop(true),
            child: const Text('Aceptar')
          )
        ],
      ),
    );
    return result ?? false;
  }
}