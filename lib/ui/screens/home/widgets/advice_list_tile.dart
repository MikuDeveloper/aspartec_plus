import 'package:aspartec_plus/domain/models/advice.dart';
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show ProfileAvatar;
import 'package:flutter/material.dart';

class AdviceListTile extends StatelessWidget {
  const AdviceListTile({super.key, required this.advice, required this.user});

  final Advice advice;
  final AspartecUser user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Row(
        children: [
          const ProfileAvatar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Tooltip(
                message: 'User',
                child: Text('User', overflow: TextOverflow.ellipsis)
              ),
            ),
          ),
          Text('Fecha', style: Theme.of(context).textTheme.labelSmall)
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Materia', style: Theme.of(context).textTheme.titleMedium,),
            Text('Tema', style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}