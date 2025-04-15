import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdviceListTileError extends ConsumerWidget {
  const AdviceListTileError({super.key, required this.futureProvider});

  final FutureProvider futureProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () => ref.refresh(futureProvider.future),
      title: const Center(
        child: Icon(Icons.replay_outlined, size: 32),
      ),
    );
  }
}