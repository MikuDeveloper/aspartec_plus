import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ReportUserSlidableAction extends ConsumerWidget {
  const ReportUserSlidableAction({super.key, required this.controller});

  final SlidableController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlidableAction(
      autoClose: false,
      padding: EdgeInsets.all(defaultPadding / 2),
      onPressed: (_) => _reportUser(context, ref),
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
      label: 'Reportar',
      icon: Icons.report_rounded,
    );
  }

  Future<void> _reportUser (BuildContext context, WidgetRef ref) async {
    // TODO: Logic to report an user.
  }
}