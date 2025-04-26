import 'package:aspartec_plus/app/global/values.dart';
import 'package:flutter/material.dart';

class AverageRatingComponent extends StatelessWidget {
  const AverageRatingComponent({super.key, required this.raiting});

  final double raiting;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: defaultPadding / 2,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Puntuación promedio',
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Row(
          spacing: defaultPadding,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              raiting.toString(),
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Icon(Icons.star_rate, color: Colors.amber, size: 36)
          ],
        )
      ],
    );
  }
}