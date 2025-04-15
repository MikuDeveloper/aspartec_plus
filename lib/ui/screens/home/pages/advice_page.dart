import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/enums.dart' show Role;
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceFilterProvider, adviceProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show RefreshIconButton;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../components/advice_filter_menu.dart';
import '../components/advice_list.dart';
import '../components/sliver_appbar_page.dart';

class AdvicePage extends ConsumerWidget with PlatformFunctions {
  const AdvicePage({super.key, required this.role});

  final Role role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(adviceFilterProvider(role));

    return RefreshIndicator(
      onRefresh: () => ref.refresh(adviceProvider((role, filter)).future),
      child: CustomScrollView(
        slivers: [
          SliverAppbarPage(
            title: role == Role.advisor
              ? 'Módulo asesor'
              : 'Módulo estudiante',
            picture: Assets.advisorPageIcon
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            sliver: SliverToBoxAdapter(
              child: Row(
                spacing: defaultPadding,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: defaultPadding / 2,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AdviceFilterMenu(role: role),
                      if (isDesktop())
                        RefreshIconButton(futureProvider: adviceProvider((role, filter))),
                    ],
                  ),
                  role == Role.advisor 
                    ? SizedBox.shrink()
                    : ElevatedButton.icon(
                      onPressed: () => context.pushNamed('request-advice'),
                      label: const Text('Solicitar'),
                      icon: const Icon(Icons.add_rounded),
                    )
                ],
              )
            ),
          ),
          AdviceList(role: role, status: filter)
        ],
      ),
    );
  }
}