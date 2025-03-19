import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorSubjectsProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/advisor_subjects_list.dart';
import '../components/sliver_appbar_page.dart';
import '../widgets/register_advice_button.dart';

class SubjectsPage extends ConsumerWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => ref.refresh(advisorSubjectsProvider.future),
      child: const CustomScrollView(
        slivers: [
          SliverAppbarPage(
            title: 'Materias',
            picture: Assets.subjectsPageIcon
          ),
          SliverPadding(
            padding: EdgeInsets.all(defaultPadding / 2),
            sliver: RegisterAdviceButton()
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