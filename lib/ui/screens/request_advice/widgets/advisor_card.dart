import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show adviceUseCaseProvider;
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs, ProfileAvatar, Snackbars;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../components/topic_bottom_sheet.dart';

class AdvisorCard extends ConsumerWidget {
  const AdvisorCard({super.key, required this.advisor, required this.subject});

  final AspartecUser advisor;
  final Subject subject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final advisorName = '${advisor.firstname} ${advisor.lastname1} ${advisor.lastname2}'.trim();
    final avatarUrl = advisor.avatarUrl;

    return Card(
      child: InkWell(
        onTap: () async {
          final topic = await showModalBottomSheet<String?>(
            useSafeArea: true,
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: const TopicBottomSheet(),
            )
          );

          if (topic == null) return;
          if (context.mounted) requestAdvice(context, ref, topic);
        },
        borderRadius: BorderRadius.circular(defaultPadding / 2),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
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
    );
  }

  void requestAdvice(BuildContext context, WidgetRef ref, String topic) {
    final adviceUseCase = ref.read(adviceUseCaseProvider);
    Dialogs.showLoadingDialog(context);
    adviceUseCase.createAdvice(subject: subject.name, topic: topic, advisorId: advisor.uid)
      .then((_) {
        ref.invalidate(adviceProvider);
        if (context.mounted) Snackbars.showSuccessSnackBar(context, 'Asesoría registrada con éxito');
      })
      .catchError((error, stackTrace) {
        if (context.mounted) Snackbars.showErrorSnackBar(context, error.toString());
      })
      .whenComplete(() => context.mounted ? context.goNamed('home') : () {});
  }
}