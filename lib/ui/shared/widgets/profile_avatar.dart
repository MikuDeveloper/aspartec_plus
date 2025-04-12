import 'package:aspartec_plus/app/global/assets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, required this.avatarUrl});

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: avatarUrl.isEmpty
        ? CircleAvatar(
          child: SvgPicture.asset(Assets.profileDefaultPicture),
        )
        : CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl)
        )
    );
  }
}