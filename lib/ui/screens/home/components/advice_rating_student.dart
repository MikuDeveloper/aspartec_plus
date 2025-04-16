import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class AdviceRatingStudent extends StatefulWidget {
  const AdviceRatingStudent({super.key});

  @override
  State<AdviceRatingStudent> createState() => _AdviceRatingStudentState();
}

class _AdviceRatingStudentState extends State<AdviceRatingStudent> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: defaultPadding,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Califica el desempeño y actitud del asesor de acuerdo a la asesoría dada.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 400,
            ),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: SvgPicture.asset(Assets.ratingPicture),
            )
          ),
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
            onRatingUpdate: (value) => setState(() => rating = value)
          ),
          FilledButton(
            onPressed: () => rating > 0 ? context.pop(rating) : () {},
            child: const Text('Asignar calificación')
          )
        ],
      ),
    );
  }
}