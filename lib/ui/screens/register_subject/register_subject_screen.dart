import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show availableSubjectsProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show RefreshIconButton;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/error_page.dart';
import 'components/subject_list_tile.dart';


class RegisterSubjectScreen extends ConsumerWidget with PlatformFunctions {
  const RegisterSubjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsProvider = ref.watch(availableSubjectsProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
      title: const Text('Materias disponibles'),
      actionsPadding: const EdgeInsets.only(right: defaultPadding),
      actions: [
        if (subjectsProvider.hasValue && isDesktop())
          RefreshIconButton(futureProvider: availableSubjectsProvider)
        ],
      ),
      body: SafeArea(
        child: subjectsProvider.when(
          skipLoadingOnRefresh: !isDesktop(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => const ErrorPage(),
          data: (subjects) => RefreshIndicator(
            onRefresh: () => ref.refresh(availableSubjectsProvider.future),
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) => SubjectListTile(subject: subjects[index]),
            ),
          )
        ),
      ),
    );
  }
}