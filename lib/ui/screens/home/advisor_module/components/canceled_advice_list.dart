import 'package:aspartec_plus/app/providers/advice_providers.dart';
import 'package:aspartec_plus/ui/screens/home/advisor_module/widgets/advice_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CanceledAdviceList extends ConsumerWidget {
  const CanceledAdviceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(advisorCanceledAdviceProvider).when(
        data: (_) => SliverList.separated(
        itemCount: 2,
        separatorBuilder: (_, _) => const Divider(),
        itemBuilder: (context, index) => AdviceListTile(
          username: 'Rin',
          date: '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
          subject: 'Amarillo',
          topic: 'Amarillo'
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