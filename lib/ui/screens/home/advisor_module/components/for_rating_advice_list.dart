import 'package:aspartec_plus/app/providers/advice_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/advice_list_tile.dart';

class ForRatingAdviceList extends ConsumerWidget {
  const ForRatingAdviceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(advisorForRatingAdviceProvider).when(
        data: (_) => SliverList.separated(
        itemCount: 2,
        separatorBuilder: (_, _) => const Divider(),
        itemBuilder: (context, index) => AdviceListTile(
          username: 'Kaito',
          date: '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
          subject: 'Azul',
          topic: 'Azul'
        )
      ),
      error: (_, __) => SliverFillRemaining(
        child: Center(child: Text('Error')),
      ),
      loading: () => SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      )
    );
  }
}