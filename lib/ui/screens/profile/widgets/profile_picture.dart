import 'package:aspartec_plus/app/global/colors.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show ProfileAvatar;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePicture extends ConsumerWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picture = ref.watch(currentUserProvider)?.avatarUrl ?? '';

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding * 1.5),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 500
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: seedColor
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: ProfileAvatar(avatarUrl: picture),
              )
            ),
          ),
        ),
        Positioned(
          bottom: 3,
          child: IconButton.filled(
            onPressed: () {},
            tooltip: 'Cambiar foto',
            icon: const Icon(Icons.edit_rounded),
            style: IconButton.styleFrom(
              backgroundColor: seedColor,
              foregroundColor: Colors.white
            ),
          ),
        )
      ],
    );
  }
}