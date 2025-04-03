import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/ui/shared/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileAction extends StatelessWidget {
  const ProfileAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Perfil',
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        onTap: () => context.pushNamed('profile'),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: const ProfileAvatar(),
        ),
      ),
    );
  }
}
