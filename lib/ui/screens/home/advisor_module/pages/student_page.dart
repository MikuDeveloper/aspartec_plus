import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show AdviceStatus, Role, defaultPadding;
import 'package:aspartec_plus/app/providers/advice_providers.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceFilterProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;

import '../components/sliver_appbar_page.dart';
import '../widgets/advice_filter_menu.dart';

class StudentPage extends ConsumerWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(adviceFilterProvider(Role.estudiante));

    return RefreshIndicator(
      onRefresh: switch(filter) {
        AdviceStatus.opened => () => ref.refresh(studentOpenedAdviceProvider.future),
        AdviceStatus.completed => () => ref.refresh(studentCompletedAdviceProvider.future),
        AdviceStatus.canceled => () => ref.refresh(studentCanceledAdviceProvider.future),
        AdviceStatus.forRating => () => ref.refresh(studentForRatingAdviceProvider.future)
      },
      child: CustomScrollView(
        slivers: [
          const SliverAppbarPage(
            title: 'Módulo estudiante',
            picture: Assets.studentPageIcon
          ),
          const SliverPadding(
            padding: EdgeInsets.all(defaultPadding / 2),
            sliver: SliverToBoxAdapter(
              child: Row(
                spacing: defaultPadding,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdviceFilterMenu(role: Role.estudiante)
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}