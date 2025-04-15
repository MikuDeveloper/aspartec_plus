import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/domain/models/advice.dart';
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import '../actions/cancel_advice_slidable_action.dart';
import '../actions/rating_advice_slidable_action.dart';
import '../actions/report_user_slidable_action.dart';

class AdviceEndActionPane extends StatelessWidget {
  const AdviceEndActionPane({super.key, required this.advice, required this.user, required this.role, required this.controller});

  final SlidableController controller;
  final Advice advice;
  final AspartecUser user;
  final Role role;

  @override
  Widget build(BuildContext context) {
    return ActionPane(
      motion: const BehindMotion(),
      children: [
        Visibility(
          visible: advice.status == AdviceStatus.opened && role == Role.advisor,
          child: SlidableAction(
            padding: EdgeInsets.all(defaultPadding / 2),
            onPressed: (_) => context.push('/home/close-advice/${advice.id}'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            label: 'Cerrar',
            icon: Icons.check_circle_rounded,
          ),
        ),
        Visibility(
          visible: advice.status == AdviceStatus.opened && role == Role.student
            || advice.status == AdviceStatus.canceled && role == Role.advisor,
          child: ReportUserSlidableAction(controller: controller)
        ),
        Visibility(
          visible: advice.status == AdviceStatus.opened && role == Role.student,
          child: CancelAdviceSlidableAction(controller: controller, adviceId: advice.id)
        ),
        Visibility(
          visible: advice.status == AdviceStatus.forRating && role == Role.student,
          child: RatingAdviceSlidableAction(controller: controller, adviceId: advice.id),
        ),
      ]
    );
  }
}