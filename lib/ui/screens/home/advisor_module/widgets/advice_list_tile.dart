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
          // TODO: Change for custom avatar component.
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.KKc5uj3THYrdX-PARqUaSAHaKe?rs=1&pid=ImgDetMain')
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(username),
            ),
          ),
          Text(date,style: Theme.of(context).textTheme.labelSmall)
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