import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show userDataProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class HomeErrorScreen extends ConsumerWidget {
  const HomeErrorScreen({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error al cargar datos'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: defaultPadding,
              runSpacing: defaultPadding / 2,
              children: [
                SvgPicture.asset(Assets.noDataPicture),
                Column(
                  spacing: defaultPadding,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error, style: Theme.of(context).textTheme.labelLarge),
                    FilledButton(
                      onPressed: () => ref.refresh(userDataProvider(null)),
                      child: const Text('Volver a cargar')
                    ),
                    TextButton(
                      onPressed: () => context.goNamed('login'),
                      child: const Text('Ir a inicio de sesión')
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}