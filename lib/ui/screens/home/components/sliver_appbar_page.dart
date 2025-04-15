import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart' show SvgPicture;

class SliverAppbarPage extends StatelessWidget {
  const SliverAppbarPage({super.key, required this.title, required this.picture});

  final String title;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title, style: Theme.of(context).textTheme.titleMedium
          ?.copyWith(fontWeight: FontWeight.bold)),
        background: Padding(
          padding: const EdgeInsets.only(right: defaultPadding),
          child: FittedBox(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(picture),
          ),
        ),
      ),
      pinned: true
    );
  }
}