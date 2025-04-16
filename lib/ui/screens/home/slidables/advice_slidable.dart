import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/domain/models/advice.dart';
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'panes/advice_end_action_pane.dart';
import 'panes/advice_start_action_pane.dart';

class AdviceSlidable extends StatefulWidget {
  const AdviceSlidable({
    super.key,
    required this.role,
    required this.advice,
    required this.user,
    required this.child
  });

  final Role role;
  final Advice advice;
  final AspartecUser user;
  final Widget child;

  @override
  State<AdviceSlidable> createState() => _AdviceSlidableState();
}

class _AdviceSlidableState extends State<AdviceSlidable> with SingleTickerProviderStateMixin {
  late SlidableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SlidableController(this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      controller: _controller,
      startActionPane: widget.advice.status == AdviceStatus.opened ? AdviceStartActionPane(
        subject: widget.advice.subject,
        phoneNumber: widget.user.phoneNumber,
        role: widget.role,
      ).build(context) as ActionPane : null,
      endActionPane: widget.advice.status != AdviceStatus.completed ? AdviceEndActionPane(
        advice: widget.advice,
        user: widget.user,
        role: widget.role,
        controller: _controller
      ).build(context) as ActionPane : null,
      child: widget.child,
    );
  }
}