import 'package:aspartec_plus/app/global/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';

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
        Text(
          raiting.toStringAsFixed(1),
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        RatingBar.builder(
          initialRating: double.parse(raiting.toStringAsFixed(1)),
          allowHalfRating: true,
          ignoreGestures: true,
          wrapAlignment: WrapAlignment.center,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemCount: 5,
          itemBuilder: (context, _) => Icon(
            Icons.star_rate,
            color: Colors.amber,
          ),
          onRatingUpdate: (_) {}
        )
      ],
    );
  }
}