import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../widgets/advisor_card.dart';

class AvailableAdvisorsList extends StatelessWidget {
  const AvailableAdvisorsList({super.key, required this.advisors, required this.subject});

  final List<AspartecUser> advisors;
  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return advisors.isNotEmpty ? SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: advisors.map(
          (advisor) => SizedBox(
            height: 175,
            width: 175,
            child: AdvisorCard(advisor: advisor, subject: subject),
          )
        ).toList().sublist(0, advisors.isNotEmpty && advisors.length > 6 ? 6 : advisors.length),
      )
    ) 
    : Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 175),
            child: AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(Assets.waitingPicture),
            ),
          ),
          Text('No hay asesores registrados en esta materia'),
        ],
      ),
    );
  }
}
