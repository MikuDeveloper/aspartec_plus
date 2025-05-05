import 'dart:typed_data' show Uint8List;

import 'package:aspartec_plus/ui/shared/components/alerts/snackbars.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.fileName, required this.pdfBytes});

  final String fileName;
  final Uint8List pdfBytes;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await FileSaver.instance.saveAs(name: fileName, bytes: pdfBytes, ext: 'pdf', mimeType: MimeType.pdf);
        if (context.mounted) Snackbars.showInformativeSnackbar(context, 'Reporte guardado en el dispositivo');
      },
      tooltip: 'Guardar',
      icon: const Icon(Icons.save_alt_rounded)
    );
  }
}