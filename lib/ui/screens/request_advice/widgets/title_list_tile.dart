import 'package:flutter/material.dart';

class TitleListTile extends StatelessWidget {
  const TitleListTile({super.key, required this.subjectName});

  final String subjectName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Tooltip(
            message: subjectName,
            child: Text(
              subjectName,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis
            )
          )
        ),
        TextButton(onPressed: () {}, child: const Text('Ver más'))
      ],
    );
  }
}