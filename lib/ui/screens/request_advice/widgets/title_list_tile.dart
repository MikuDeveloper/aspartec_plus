import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorsBySubjectProvider;
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TitleListTile extends ConsumerWidget {
  const TitleListTile({super.key, required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final advisors = ref.watch(advisorsBySubjectProvider(subject.id)).value ?? [];

    return Row(
      children: [
        Expanded(
          child: Tooltip(
            message: subject.name,
            child: Text(
              subject.name,
              style: Theme.of(context).textTheme.titleMedium,
              overflow: TextOverflow.ellipsis
            )
          )
        ),
        if (advisors.isNotEmpty && advisors.length > 6)
          TextButton(
            onPressed: () => context.pushNamed('available-advisors', extra: subject),
            child: const Text('Ver más')
          )
      ],
    );
  }
}