import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import 'subject_options.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subject
  });
  
  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: [
          Tooltip(
            message: subject.name,
            triggerMode: TooltipTriggerMode.tap,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: defaultPadding),
                    child: Text(
                      subject.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium
                    ),
                  )
                ),
                SubjectOptions(subject: subject)
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 0,
                right: defaultPadding,
                bottom: defaultPadding,
                left: defaultPadding
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: subject.pictureUrl.isEmpty
                  ? SvgPicture.asset(Assets.subjectDefaultIcon)
                  : Image.network(subject.pictureUrl),
              ),
            ),
          )
        ],
      ),
    );
  }
}