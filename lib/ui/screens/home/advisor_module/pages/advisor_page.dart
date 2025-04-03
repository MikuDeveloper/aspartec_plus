import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/enums.dart' show Role;
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceFilterProvider, adviceProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;

import '../../components/advice_list.dart';
import '../components/sliver_appbar_page.dart';
import '../widgets/advice_filter_menu.dart';

class AdvisorPage extends ConsumerWidget {
  const AdvisorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(adviceFilterProvider(Role.advisor));

    return RefreshIndicator(
      onRefresh: () => ref.refresh(adviceProvider((Role.advisor, filter)).future),
      child: CustomScrollView(
        slivers: [
          const SliverAppbarPage(
            title: 'Módulo asesor',
            picture: Assets.advisorPageIcon
          ),
          const SliverPadding(
            padding: EdgeInsets.all(defaultPadding / 2),
            sliver: SliverToBoxAdapter(
              child: Row(
                spacing: defaultPadding,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdviceFilterMenu(role: Role.advisor),
                  SizedBox.shrink()
                ],
              )
            ),
          ),
          AdviceList(role: Role.advisor, status: filter)
        ],
      ),
    );
  }
}