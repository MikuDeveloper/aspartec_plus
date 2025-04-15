import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show userDataProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show RefreshIconButton;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/advisor_subjects_list.dart';
import '../components/sliver_appbar_page.dart';
import '../widgets/register_advice_button.dart';

class SubjectsPage extends ConsumerWidget with PlatformFunctions {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => ref.refresh(userDataProvider(null).future),
      child: CustomScrollView(
        slivers: [
          const SliverAppbarPage(
            title: 'Materias',
            picture: Assets.subjectsPageIcon
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding / 2),
            sliver: SliverToBoxAdapter(
              child: Row(
                spacing: defaultPadding,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDesktop()
                    ? RefreshIconButton(futureProvider: userDataProvider(null))
                    : const SizedBox.shrink(),
                  RegisterAdviceButton()
                ],
              ),
            )
          ),
          SliverPadding(
            padding: EdgeInsets.all(defaultPadding / 2),
            sliver: AdvisorSubjectsList()
          )
        ],
      ),
    );
  }
}