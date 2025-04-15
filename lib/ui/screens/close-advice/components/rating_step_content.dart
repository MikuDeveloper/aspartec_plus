import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg.dart';

import '../providers/stepper_provider.dart';

class RatingStepContent extends ConsumerWidget {
  const RatingStepContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(ratingProvider);

    return Column(
      spacing: defaultPadding,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Califica el desempeño y actitud del estudiante de acuerdo a la asesoría dada.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Wrap(
          spacing: defaultPadding,
          runSpacing: defaultPadding,
          alignment: WrapAlignment.spaceAround,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 400,
              ),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: SvgPicture.asset(Assets.ratingPicture),
              )
            ),
            Column(
              spacing: defaultPadding,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Calificación: $rating', style: Theme.of(context).textTheme.labelLarge),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 0.5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  updateOnDrag: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star_rate,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) => ref.read(ratingProvider.notifier).state = rating
                )
              ],
            )
          ],
        )
      ],
    );
  }
}