import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorSubjectsProvider, userDataProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show EntryAnimation;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/subject_card.dart';
import 'sliver_error.dart';
import 'sliver_loading.dart';

class AdvisorSubjectsList extends ConsumerWidget with PlatformFunctions {
  const AdvisorSubjectsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsProvider = ref.watch(advisorSubjectsProvider);

    return subjectsProvider.when(
      skipLoadingOnReload: true,
      skipLoadingOnRefresh: !isDesktop(),
      loading: () => SliverLoading(),
      error: (error, __) => SliverError(error: error.toString(), futureProvider: userDataProvider(null)),
      data: (subjects) => SliverGrid.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) => EntryAnimation(
          beginOffset: const Offset(0, 1),
          child: SubjectCard(subject: subjects[index])
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getAxisCountForGrid(context),
          mainAxisSpacing: defaultPadding / 2,
          crossAxisSpacing: defaultPadding / 2
        )
      ),
    );
  }
}