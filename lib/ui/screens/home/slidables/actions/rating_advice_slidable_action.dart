import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show adviceUseCaseProvider;
import 'package:aspartec_plus/ui/shared/components/alerts/snackbars.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show BottomSheets, Dialogs;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

class RatingAdviceSlidableAction extends ConsumerWidget with PlatformFunctions {
  const RatingAdviceSlidableAction({super.key, required this.controller, required this.adviceId});

  final SlidableController controller;
  final String adviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlidableAction(
      autoClose: false,
      padding: EdgeInsets.all(defaultPadding / 2),
      onPressed: (_) async {
        final rating = await BottomSheets.openRatingBottomSheet(context, isDesktop());
        if (rating != null && rating != 0 && context.mounted) await _rateAdvice(context, ref, rating);
        controller.close();
      },
      backgroundColor: Colors.amber,
      foregroundColor: Colors.white,
      label: 'Evaluar',
      icon: Icons.star_rounded,
    );
  }

  Future<void> _rateAdvice(BuildContext context, WidgetRef ref, double rating) async {
    Dialogs.showLoadingDialog(context);
    try {
      await ref.read(adviceUseCaseProvider).ratingAdvisor(id: adviceId, rating: rating);
      if (context.mounted) {
        ref.invalidate(adviceProvider);
        Snackbars.showInformativeSnackbar(context, 'Asesoría calificada');
      }
    } catch (error) {
      if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString());
    } finally {
      if (context.mounted) context.pop();
    }
  }
}