import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorSubjectsProvider;
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class SubjectListTile extends ConsumerWidget {
  const SubjectListTile({super.key, required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSubjects = ref.watch(advisorSubjectsProvider).value ?? [];

    return ListTile(
      enabled: !currentSubjects.contains(subject),
      onTap: () async {
        final accept = await Dialogs.showDecisiveDialog(
          context, 
          'Registro de "${subject.name}"', 
          '¿Confirma el registro de la materia? Los estudiantes podrán solicitarle asesorías y ponerse en contacto con usted.');
        if (accept && context.mounted) context.pop(subject.id);
      },
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
        aspectRatio: 1,
          child: subject.pictureUrl.isEmpty
            ? SvgPicture.asset(Assets.subjectDefaultIcon)
            : Image.network(subject.pictureUrl),
        ),
      ),
      title: Text(subject.name),
      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
    );
  }
}