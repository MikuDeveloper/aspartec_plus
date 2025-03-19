import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/enums.dart' show Role;
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceFilterProvider, adviceProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;

import '../components/sliver_appbar_page.dart';
import '../widgets/advice_filter_menu.dart';

class StudentPage extends ConsumerWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(adviceFilterProvider(Role.student));

    return RefreshIndicator(
      onRefresh: () => ref.refresh(adviceProvider((Role.student, filter)).future),
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
                  AdviceFilterMenu(role: Role.student)
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}