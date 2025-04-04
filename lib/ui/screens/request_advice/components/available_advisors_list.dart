import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show ProfileAvatar;
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class AvailableAdvisorsList extends StatelessWidget {
  const AvailableAdvisorsList({super.key, required this.advisors});

  final List<AspartecUser> advisors;

  @override
  Widget build(BuildContext context) {
    return advisors.isNotEmpty ? SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: advisors.map((advisor) {
          final advisorName = '${advisor.firstname} ${advisor.lastname1} ${advisor.lastname2}'.trim();
          final avatarUrl = advisor.avatarUrl;

          return SizedBox(
            height: 175,
            width: 175,
            child: Card(
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    spacing: defaultPadding,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tooltip(
                        message: advisorName,
                        triggerMode: TooltipTriggerMode.tap,
                        child: Text(
                          advisorName,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                      Expanded(child: ProfileAvatar(avatarUrl: avatarUrl))
                    ],
                  ),
                ),
              ),
            )
          );
        }).toList(),
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
