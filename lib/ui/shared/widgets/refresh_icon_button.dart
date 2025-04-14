import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RefreshIconButton extends ConsumerWidget {
  const RefreshIconButton({super.key, required this.futureProvider});

  final FutureProvider futureProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => ref.refresh(futureProvider.future),
      tooltip: 'Volver a cargar',
      icon: const Icon(Icons.replay_rounded)
    );
  }
}