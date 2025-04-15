import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show ProfileAvatar;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileAction extends ConsumerWidget {
  const ProfileAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarUrl = ref.watch(currentUserProvider)?.avatarUrl ?? '';

    return Tooltip(
      message: 'Perfil',
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        onTap: () => context.pushNamed('profile'),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: Hero(
            tag: 'profile',
            child: ProfileAvatar(avatarUrl: avatarUrl)
          ),
        ),
      ),
    );
  }
}
