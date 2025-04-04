import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show availableSubjectsProvider, advisorsBySubjectProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/advisors_by_subject_list_tile.dart';

class RequestAdviceScreen extends ConsumerWidget {
  const RequestAdviceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsProvider = ref.watch(availableSubjectsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar asesor par'),
        centerTitle: true,
      ),
      // body: RefreshIndicator(
      //   onRefresh: () {
      //     ref.invalidate(advisorsBySubjectProvider);
      //     return ref.refresh(availableSubjectsProvider.future);
      //   },
      //   child: SafeArea(
      //     child: CustomScrollView(
      //       slivers: [
      //         subjectsProvider.when(
      //           loading: () => const SliverLoading(),
      //           error: (_, _) => const SliverError(),
      //           data: (subjects) => SliverList.builder(
      //             itemCount: subjects.length,
      //             itemBuilder: (context, index) => AdvisorsBySubjectListTile(subject: subjects[index]) 
      //           )
      //         )
      //       ],
      //     ),
      //   ),
      // )
      body: SafeArea(
        child: subjectsProvider.when(
          skipLoadingOnRefresh: false,
          data: (subjects) => RefreshIndicator(
            onRefresh: () {
              ref.invalidate(advisorsBySubjectProvider);
              return ref.refresh(availableSubjectsProvider.future);
            },
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: subjects.length,
              itemBuilder: (context, index) => AdvisorsBySubjectListTile(subject: subjects[index])
            ),
          ),
          error: (_, _) => Center(
            child: Column(
              spacing: defaultPadding,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Error al obtener la información solicitada'),
                TextButton.icon(
                  onPressed: () => ref.refresh(availableSubjectsProvider.future),
                  label: const Text('Recargar'),
                  icon: const Icon(Icons.refresh)
                )
              ],
            ),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          )
        ),
      ),
    );
  }
}