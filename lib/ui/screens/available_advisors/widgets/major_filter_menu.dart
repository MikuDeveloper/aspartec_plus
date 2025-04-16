import 'package:aspartec_plus/app/global/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/major_provider.dart';

class MajorFilterMenu extends ConsumerWidget {
  const MajorFilterMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeIcon = const Icon(Icons.circle_rounded, size: 16, color: Colors.green);
    final majorFilter = ref.watch(majorFilterProvider);

    return MenuAnchor(
      builder: (context, controller, child) => ElevatedButton.icon(
        onPressed: controller.isOpen ? controller.close : controller.open,
        label: Text(majorFilter ?? 'Todas las carreras'),
        icon: const Icon(Icons.filter_list_rounded)
      ),
      menuChildren: [
        MenuItemButton(
          onPressed: () => ref.read(majorFilterProvider.notifier).state = null,
          leadingIcon: majorFilter == null ? activeIcon : null,
          child: const Text('Todas las carreras'),
        ),
        ...majors.map((major) => MenuItemButton(
          onPressed: () => ref.read(majorFilterProvider.notifier).state = major,
          leadingIcon: majorFilter == major ? activeIcon : null,
          child: Text(major),
        ))
      ]
    );
  }
}