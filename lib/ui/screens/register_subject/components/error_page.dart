import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show availableSubjectsProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        spacing: defaultPadding,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Error al cargar materias',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          AspectRatio(aspectRatio: 4 / 3, child: SvgPicture.asset(Assets.noDataPicture)),
          TextButton(
            onPressed: () => ref.refresh(availableSubjectsProvider.future),
            child: const Text('Recargar')
          )
        ],
      )
    );
  }
}