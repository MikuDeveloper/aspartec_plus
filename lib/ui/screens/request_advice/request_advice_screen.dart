import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show availableSubjectsProvider, advisorsBySubjectProvider;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/subtitle_list_tile.dart';
import 'widgets/title_list_tile.dart';

class RequestAdviceScreen extends ConsumerWidget with PlatformFunctions {
  const RequestAdviceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsProvider = ref.watch(availableSubjectsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar asesor par'),
        actions: [
          if (isDesktop())
            IconButton(
              onPressed: () {
                ref.invalidate(advisorsBySubjectProvider);
                return ref.refresh(availableSubjectsProvider.future);
              },
              icon: const Icon(Icons.refresh_rounded)
            ),
        ],
      ),
      body: SafeArea(
        child: subjectsProvider.when(
          skipLoadingOnRefresh: !isDesktop(),
          data: (subjects) => RefreshIndicator(
            onRefresh: () {
              ref.invalidate(advisorsBySubjectProvider);
              return ref.refresh(availableSubjectsProvider.future);
            },
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: subjects.length,
              itemBuilder: (context, index) => ListTile(
                title: TitleListTile(subject: subjects[index]),
                subtitle: SubtitleListTile(subject: subjects[index]),
              )
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