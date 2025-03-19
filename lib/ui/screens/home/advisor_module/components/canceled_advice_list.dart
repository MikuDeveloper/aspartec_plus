import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/sliver_error.dart';
import '../../widgets/sliver_loading.dart';
import '../widgets/advice_list_tile.dart';

class CanceledAdviceList extends ConsumerWidget {
  const CanceledAdviceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canceledAdvice = ref.watch(adviceProvider((Role.advisor, AdviceStatus.canceled)));

    return canceledAdvice.when(
      loading: () => const SliverLoading(),
      error: (_, __) => const SliverError(),
      data: (_) => SliverList.separated(
        itemCount: 2,
        separatorBuilder: (_, _) => const Divider(),
        itemBuilder: (context, index) => AdviceListTile(
          username: 'Rin',
          date: '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
          subject: 'Amarillo',
          topic: 'Amarillo'
        )
      )
    );
  }
}