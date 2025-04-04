import 'package:aspartec_plus/app/global/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, required this.avatarUrl});

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: avatarUrl,
      imageBuilder: (context, imageProvider) => AspectRatio(
        aspectRatio: 1,
        child: CircleAvatar(
          backgroundImage: imageProvider,
        ),
      ),
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => AspectRatio(
        aspectRatio: 1,
        child: CircleAvatar(
          child: SvgPicture.asset(Assets.profileDefaultPicture),
        ),
      ),
    );
  }
}