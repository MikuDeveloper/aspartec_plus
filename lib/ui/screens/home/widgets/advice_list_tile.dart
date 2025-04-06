import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/domain/models/advice.dart';
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show ProfileAvatar;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AdviceListTile extends StatelessWidget {
  const AdviceListTile({super.key, required this.advice, required this.user});

  final Advice advice;
  final AspartecUser user;

  @override
  Widget build(BuildContext context) {
    final username = '${user.firstname} ${user.lastname1} ${user.lastname2}'.trim();
    final date = (advice.startDate as Timestamp).toDate().toLocal();
    final dateFormat = DateFormat('dd/MMMM/yyyy hh:mm', 'es').format(date);

    return ListTile(
      onTap: () {},
      title: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 50),
            child: ProfileAvatar(avatarUrl: user.avatarUrl)
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Tooltip(
                message: username,
                child: Text(username, overflow: TextOverflow.ellipsis)
              ),
            ),
          ),
          Text(dateFormat.toLowerCase(), style: Theme.of(context).textTheme.labelSmall)
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(advice.subject, style: Theme.of(context).textTheme.titleMedium,),
            Text('Tema: ${advice.topic}', style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}