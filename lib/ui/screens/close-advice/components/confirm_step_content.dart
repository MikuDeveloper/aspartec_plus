import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ConfirmStepContent extends StatelessWidget {
  const ConfirmStepContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: defaultPadding,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿Confirma el cierre de la asesoría? El estudiante será notificado de esta acción.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 400
          ),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: SvgPicture.asset(Assets.confirmPicture),
          ),
        )
      ],
    );
  }
}