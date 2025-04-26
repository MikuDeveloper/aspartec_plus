import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/ui/shared/mixins/image_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg.dart';

import '../providers/stepper_provider.dart';

class EvidenceStepContent extends ConsumerWidget with ImageActions {
  const EvidenceStepContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evidence = ref.watch(evidenceProvider);
    final evidenceNotifier = ref.read(evidenceProvider.notifier);

    return Column(
      spacing: defaultPadding,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sube una imagen que sirva de evidencia acerca del trabajo realizado durante la asesoría.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 400),
          child: AspectRatio(
            aspectRatio: 4 /3,
            child: evidence == null ? SvgPicture.asset(Assets.uploadPicture) : Image.memory(evidence),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () async {
            final source = await getImageSource(context);
            if (source == null) return;

            final image = await getFile(source);
            if (image == null) return;
            
            evidenceNotifier.state = await image.readAsBytes();
          },
          label: const Text('Examinar'),
          icon: const Icon(Icons.image_search_rounded),
        )
      ],
    );
  }
}