import 'package:aspartec_plus/ui/shared/index.dart' show ProfileAvatar;
import 'package:flutter/material.dart';

class AdviceListTile extends StatelessWidget {
  const AdviceListTile({
    super.key,
    required this.username,
    required this.date,
    required this.subject,
    required this.topic
  });

  final String username;
  final String date;
  final String subject;
  final String topic;

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
              child: Text(username),
            ),
          ),
          Text(date, style: Theme.of(context).textTheme.labelSmall)
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject, style: Theme.of(context).textTheme.titleMedium,),
            Text('Tema: $topic', style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}