import 'dart:io';

import 'package:aspartec_plus/app/global/colors.dart' show seedColor;
import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show userUseCaseProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show BottomSheets, Dialogs, Snackbars;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UpdateAvatarButton extends ConsumerWidget {
  const UpdateAvatarButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton.filled(
      onPressed: () async {
        final ImageSource? source = await _getImageSource(context);
        if (source == null) return;

        final image = await _getFile(source);
        if (image == null) return;

        late Uint8List? imageFile;
        if (context.mounted) imageFile = await _getCroppedFile(context, image.path);
        if (imageFile == null || !context.mounted) return;
        _updateAvatar(context, ref, imageFile);
      },
      tooltip: 'Cambiar foto',
      icon: const Icon(Icons.edit_rounded),
      style: IconButton.styleFrom(
        backgroundColor: seedColor,
        foregroundColor: Colors.white
      ),
    );
  }

  void _updateAvatar(BuildContext context, WidgetRef ref, Uint8List image) {
    Dialogs.showLoadingDialog(context);
    final userUseCase = ref.read(userUseCaseProvider);
    userUseCase.updateProfilePicture(picture: image)
    .then((url) async {
      if (context.mounted) {
        Snackbars.showSuccessSnackBar(context, 'Foto de perfil actualizada');
        //await DefaultCacheManager().emptyCache();
        ref.read(currentUserProvider.notifier).update((user) {
          return user?.copyWith(avatarUrl: url);
        });
      }
    })
    .catchError((error) {
      if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString());
    })
    .whenComplete(() => context.mounted ? context.pop() : () {});
  }

  Future<ImageSource?> _getImageSource(BuildContext context) async {
    if (kIsWeb) {
      return ImageSource.gallery;
    } else if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      return ImageSource.gallery;
    } else {
      return await BottomSheets.openImageSourceBottomSheet(context);
    }
  }

  Future<XFile?> _getFile(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    return await picker.pickImage(source: source);
  }

  Future<Uint8List?> _getCroppedFile(BuildContext context, String path) async {
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