import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg.dart';

class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarUrl = ref.watch(currentUserProvider)!.avatarUrl;

    return Hero(
      tag: 'profile',
      child: FittedBox(
        child: CircleAvatar(
          backgroundImage: avatarUrl.isEmpty
          ? null
          : NetworkImage(avatarUrl),
          child: avatarUrl.isEmpty
          ? SvgPicture.asset(Assets.profileDefaultPicture)
          : null,
        ),
      ),
    );
  }
}