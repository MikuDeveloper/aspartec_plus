import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:aspartec_plus/ui/screens/request_advice/widgets/subtitle_list_tile.dart';
import 'package:flutter/material.dart';

import '../widgets/title_list_tile.dart';

class AdvisorsBySubjectListTile extends StatelessWidget {
  const AdvisorsBySubjectListTile({super.key, required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TitleListTile(subjectName: subject.name),
      subtitle: SubtitleListTile(subjectId: subject.id),
    );
  }
}