import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/domain/models/advice.dart';
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show ProfileAvatar;
import 'package:aspartec_plus/ui/shared/mixins/advice_functions.dart';
import 'package:flutter/material.dart';

class AdviceListTile extends StatelessWidget with AdviceFunctions {
  const AdviceListTile({super.key, required this.advice, required this.user});

  final Advice advice;
  final AspartecUser user;

  @override
  Widget build(BuildContext context) {
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
                message: getUsername(user),
                child: Text(getUsername(user), overflow: TextOverflow.ellipsis)
              ),
            ),
          ),
          Text(
            getDateFormatted(advice.startDate),
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.labelSmall
          )
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
      )
    );
  }
}