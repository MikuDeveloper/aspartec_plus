import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorSubjectsProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show EntryAnimation;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/sliver_error.dart';
import '../../widgets/sliver_loading.dart';
import '../widgets/subject_card.dart';

class AdvisorSubjectsList extends ConsumerWidget {
  const AdvisorSubjectsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsProvider = ref.watch(advisorSubjectsProvider);
    final size = MediaQuery.of(context).size;

    return subjectsProvider.when(
      skipLoadingOnReload: true,
      loading: () => SliverLoading(),
      error: (_, __) => const SliverError(),
      data: (subjects) => SliverGrid.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) => EntryAnimation(
          beginOffset: const Offset(0, 1),
          child: SubjectCard(subject: subjects[index])
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size.width > 600 ? 3 : 2,
          mainAxisSpacing: defaultPadding / 2,
          crossAxisSpacing: defaultPadding / 2
        )
      ),
    );
  }
}