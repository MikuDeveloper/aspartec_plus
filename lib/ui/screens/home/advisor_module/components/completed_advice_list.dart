import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/app/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/sliver_error.dart';
import '../../widgets/sliver_loading.dart';
import '../widgets/advice_list_tile.dart';

class CompletedAdviceList extends ConsumerWidget {
  const CompletedAdviceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedAdvice = ref.watch(adviceProvider((Role.advisor, AdviceStatus.completed)));

    return completedAdvice.when(
      error: (_, __) => const SliverError(),
      loading: () => const SliverLoading(),
      data: (_) => SliverList.separated(
        itemCount: 2,
        separatorBuilder: (_, _) => const Divider(),
        itemBuilder: (context, index) => AdviceListTile(
          username: 'Luka',
          date: '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
          subject: 'Rosas',
          topic: 'Rojas'
        )
      ), 
    );
  }
}