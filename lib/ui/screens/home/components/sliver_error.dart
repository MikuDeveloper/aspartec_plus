import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliverError extends ConsumerWidget {
  const SliverError({super.key, required this.error, required this.futureProvider});

  final String error;
  final FutureProvider futureProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          spacing: defaultPadding,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error, style: Theme.of(context).textTheme.labelLarge),
            TextButton(
              onPressed: () {
                () => ref.refresh(futureProvider.future);
              },
              child: const Text('Recargar')
            )
          ],
        )
      ),
    );
  }
}