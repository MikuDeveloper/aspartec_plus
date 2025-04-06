import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorsBySubjectProvider;
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show LoadingOpacityAnimation;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/available_advisors_template.dart';
import '../components/available_advisors_list.dart';

class SubtitleListTile extends ConsumerWidget {
  const SubtitleListTile({super.key, required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(advisorsBySubjectProvider(subject.id)).when(
      skipLoadingOnRefresh: false,
      data: (advisors) => AvailableAdvisorsList(advisors: advisors, subject: subject),
      error:(_, _) => Center(
        child: IconButton(
          onPressed: () => ref.refresh(advisorsBySubjectProvider(subject.id)),
          icon: const Icon(Icons.refresh_rounded, size: 36),
        ),
      ),
      loading: () => const LoadingOpacityAnimation(child: AvailableAdvisorsTemplate()),
    );
  }
}
