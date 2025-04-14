import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceProvider, userDataProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show EntryAnimation, LoadingOpacityAnimation;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/advice_list_tile.dart';
import '../widgets/sliver_error.dart';
import '../widgets/sliver_loading.dart';
import 'advice_list_tile_template.dart';

class AdviceList extends ConsumerWidget {
  const AdviceList({super.key, required this.role, required this.status});

  final Role role;
  final AdviceStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adviceData = ref.watch(adviceProvider((role, status)));

    return adviceData.when(
      loading: () => const SliverLoading(),
      error: (_, _) => const SliverError(),
      data: (advice) => SliverList.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: advice.length,
        itemBuilder: (context, index) {
          final user = (role == Role.advisor) ? advice[index].studentId : advice[index].advisorId;
          final userData = ref.watch(userDataProvider(user));
          
          return userData.when(
            skipLoadingOnRefresh: false,
            loading: () => const LoadingOpacityAnimation(child: AdviceListTileTemplate()),
            error: (_, _) => ListTile(
              onTap: () => ref.refresh(userDataProvider(user)),
              title: const Center(
                child: Icon(Icons.replay_outlined, size: 28),
              ),
            ),
            data: (user) => EntryAnimation(
              beginOffset: index / 2 == 0 ? const Offset(-1, 0) : const Offset(1, 0),
              child: AdviceListTile(advice: advice[index], user: user, role: role),
            )
          );
        }
      )
    );
  }
}