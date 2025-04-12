import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageSourceBottomSheet extends StatelessWidget {
  const SelectImageSourceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: defaultPadding * 2
      ),
      child: Row(
        spacing: defaultPadding * 2,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            spacing: defaultPadding / 2,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.outlined(
                onPressed: () => context.pop(ImageSource.camera),
                padding: const EdgeInsets.all(defaultPadding),
                icon: const Icon(Icons.camera_alt_rounded, size: 36)
              ),
              Text('Tomar foto')
            ],
          ),
          Column(
            spacing: defaultPadding / 2,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.outlined(
                onPressed: () => context.pop(ImageSource.gallery),
                padding: const EdgeInsets.all(defaultPadding),
                icon: const Icon(Icons.image_rounded, size: 36)
              ),
              Text('Galería')
            ],
          )
        ],
      ),
    );
  }
}