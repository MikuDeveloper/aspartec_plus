import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show AdviceFilters, Role, defaultPadding;
import 'package:aspartec_plus/app/providers/advice_providers.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceFilterProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;

import '../components/canceled_advice_list.dart';
import '../components/completed_advice_list.dart';
import '../components/for_rating_advice_list.dart';
import '../components/opened_advice_list.dart';
import '../components/sliver_appbar_page.dart';
import '../widgets/advice_filter_menu.dart';

class AdvisorPage extends ConsumerWidget {
  const AdvisorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(adviceFilterProvider(Role.asesor));

    return RefreshIndicator(
      onRefresh: switch(filter) {
        AdviceFilters.opened => () => ref.refresh(advisorOpenedAdviceProvider.future),
        AdviceFilters.completed => () => ref.refresh(advisorCompletedAdviceProvider.future),
        AdviceFilters.canceled => () => ref.refresh(advisorCanceledAdviceProvider.future),
        AdviceFilters.forRating => () => ref.refresh(advisorForRatingAdviceProvider.future)
      },
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdviceFilterMenu(role: Role.asesor)
                ],
              )
            ),
          ),
          switch (filter) {
            AdviceFilters.opened => const OpenedAdviceList(),
            AdviceFilters.completed => const CompletedAdviceList(),
            AdviceFilters.canceled => const CanceledAdviceList(),
            AdviceFilters.forRating => const ForRatingAdviceList()
          }
        ],
      ),
    );
  }
}