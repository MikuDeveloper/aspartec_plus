import 'package:aspartec_plus/app/global/assets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class EmptyListMessage extends StatelessWidget {
  const EmptyListMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 500),
            child: AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(Assets.waitingPicture),
            ),
          ),
          Text(
            'No hay asesores registrados en esta materia',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}