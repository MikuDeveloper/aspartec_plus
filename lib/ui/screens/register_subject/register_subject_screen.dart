import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorSubjectsProvider, availableSubjectsProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';


class RegisterSubjectScreen extends ConsumerWidget {
  const RegisterSubjectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSubjects = ref.watch(advisorSubjectsProvider).value ?? [];
    final subjectsProvider = ref.watch(availableSubjectsProvider);

    return subjectsProvider.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (_, _) => Scaffold(
        appBar: AppBar(title: const Text('Error al obtener las materias')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(aspectRatio: 4 / 3, child: SvgPicture.asset(Assets.noDataPicture)),
              TextButton(
                onPressed: () => ref.refresh(availableSubjectsProvider.future),
                child: const Text('Recargar')
              )
            ],
          )
        )
      ),
      data: (subjects) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Materias disponibles'),
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () => ref.refresh(availableSubjectsProvider.future),
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) => ListTile(
                enabled: !currentSubjects.contains(subjects[index]),
                onTap: () => context.pop(subjects[index].id),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                  aspectRatio: 1,
                    child: subjects[index].pictureUrl.isEmpty
                      ? SvgPicture.asset(Assets.subjectDefaultIcon)
                      : Image.network(subjects[index].pictureUrl),
                  ),
                ),
                title: Text(subjects[index].name),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
            )
          ),
        ),
      ),
    );
  }
}