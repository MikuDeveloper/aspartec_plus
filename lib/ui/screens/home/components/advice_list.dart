import 'package:aspartec_plus/app/global/enums.dart' show Role, AdviceStatus;
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceProvider, userDataProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show EntryAnimation, LoadingOpacityAnimation;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../slidables/advice_slidable.dart';
import '../widgets/advice_list_tile.dart';
import '../widgets/advice_list_tile_error.dart';
import 'advice_list_tile_template.dart';
import 'sliver_error.dart';
import 'sliver_loading.dart';

class AdviceList extends ConsumerWidget with PlatformFunctions {
  const AdviceList({super.key, required this.role, required this.status});

  final Role role;
  final AdviceStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adviceData = ref.watch(adviceProvider((role, status)));
    
    return adviceData.when(
      skipLoadingOnRefresh: !isDesktop(),
      loading: () => const SliverLoading(),
      error: (error, stackTrace) => SliverError(
        error: error.toString(),
        futureProvider: adviceProvider((role, status))
      ),
      data: (adviceList) => SliverList.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: adviceList.length,
        itemBuilder: (context, index) {
          final advice = adviceList[index];
          final user = (role == Role.advisor) ? advice.studentId : advice.advisorId;
          final userData = ref.watch(userDataProvider(user));

          return userData.when(
            skipLoadingOnRefresh: false,
            loading: () => const LoadingOpacityAnimation(child: AdviceListTileTemplate()),
            error: (error, stackTrace) => AdviceListTileError(futureProvider: userDataProvider(user)),
            data: (userData) => EntryAnimation(
              beginOffset: index / 2 == 0 ? const Offset(-1, 0) : const Offset(1, 0),
              child: AdviceSlidable(
                role: role,
                advice: advice,
                user: userData,
                child: AdviceListTile(advice: advice, user: userData)
              )
            ),
          );
        },
      ),
    );
  }
}