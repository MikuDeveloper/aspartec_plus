import 'package:aspartec_plus/ui/shared/index.dart' show Snackbars;
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.fileName, required this.pdfBytes});

  final String fileName;
  final Uint8List pdfBytes;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final path = kIsWeb
        ? await FileSaver.instance.saveFile(name: fileName, bytes: pdfBytes, ext: 'pdf', mimeType: MimeType.pdf) 
        : await FileSaver.instance.saveAs(name: fileName, bytes: pdfBytes, ext: 'pdf', mimeType: MimeType.pdf);
        if (context.mounted && path != null) Snackbars.showInformativeSnackbar(context, 'Reporte guardado en el dispositivo');
      },
      tooltip: 'Guardar',
      icon: const Icon(Icons.save_alt_rounded)
    );
  }
}