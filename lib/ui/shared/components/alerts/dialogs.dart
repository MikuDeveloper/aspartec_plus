import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

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

  static void showInformativeDialog(BuildContext context, String message) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.info_rounded),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
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

  static Future<String?> showReportDialog(BuildContext context, String title) async {
    final form = FormGroup({
      'message': FormControl(value: '', validators: [Validators.required])
    });

    final message = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.report_rounded),
        iconColor: Colors.redAccent,
        title: Text(title, textAlign: TextAlign.center),
        content: ReactiveForm(
          formGroup: form,
          child: Column(
            spacing: defaultPadding,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200,
                  minWidth: 400
                ),
                child: ReactiveTextField(
                  formControlName: 'message',
                  maxLines: 30,
                  decoration: InputDecoration(
                    hintText: 'Motivo de reporte',
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  maxLength: 500,
                ),
              ),
              ElevatedButton(
                onPressed: () => form.valid ? context.pop(form.value['message']) : () {},
                child: const Text('Enviar reporte')
              )
            ],
          )
        )
      )
    );
    if (message != null) {
      final result = (message as String).trim();
      return result.isEmpty ? null : result;
    }
    return null;
  }
}