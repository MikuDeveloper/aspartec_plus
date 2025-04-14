import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class RatingAdviceSlidableAction extends ConsumerWidget {
  const RatingAdviceSlidableAction({super.key, required this.controller, required this.adviceId});

  final SlidableController controller;
  final String adviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlidableAction(
      autoClose: false,
      padding: EdgeInsets.all(defaultPadding / 2),
      onPressed: (_) => _rateAdvice(context, ref),
      backgroundColor: Colors.amber,
      foregroundColor: Colors.white,
      label: 'Evaluar',
      icon: Icons.star_rounded,
    );
  }

  Future<void> _rateAdvice(BuildContext context, WidgetRef ref) async {
    // TODO: Logic to rate the advice.
  }
}