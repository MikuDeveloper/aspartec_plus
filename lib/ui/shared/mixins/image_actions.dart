import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:aspartec_plus/ui/shared/index.dart' show BottomSheets;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

mixin ImageActions {
  Future<ImageSource?> getImageSource(BuildContext context) async {
    if (kIsWeb) {
      return ImageSource.gallery;
    } else if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      return ImageSource.gallery;
    } else {
      return await BottomSheets.openImageSourceBottomSheet(context);
    }
  }

  Future<XFile?> getFile(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    return await picker.pickImage(source: source);
  }

  Future<Uint8List?> getCroppedFile(BuildContext context, String path) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Ajustar foto de perfil',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
        ),
        IOSUiSettings(
          title: 'Ajustar foto de perfil'
        ),
        if (context.mounted) WebUiSettings(
          context: context,
          presentStyle: WebPresentStyle.page,
          dragMode: WebDragMode.move,
          viewwMode: WebViewMode.mode_2,
          cropBoxResizable: false
        ),
      ]
    );
    return croppedImage == null ? null : await croppedImage.readAsBytes();
  }
}