import 'package:aspartec_plus/app/global/values.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/app/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;

class AdviceFilterMenu extends ConsumerWidget {
  const AdviceFilterMenu({super.key, required this.role});
  
  final Role role;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final filter = role == Role.estudiante 
    //   ? ref.watch(studentAdviceFilterProvider)
    //   : ref.watch(advisorAdviceFilterProvider);
    // final filterNotifier = role == Role.estudiante 
    //   ? ref.watch(studentAdviceFilterProvider.notifier)
    //   : ref.read(advisorAdviceFilterProvider.notifier);
    final filter = ref.watch(adviceFilterProvider(role));
    final filterNotifier = ref.watch(adviceFilterProvider(role).notifier);

    return MenuAnchor(
      builder: (context, controller, child) => ElevatedButton.icon(
        onPressed: controller.isOpen ? controller.close : controller.open,
        icon: const Icon(Icons.filter_list_alt),
        label: setTextFilter(filter)
      ),
      menuChildren: [
        MenuItemButton(
          onPressed: () => filterNotifier.state = AdviceStatus.opened,
          leadingIcon: filter == AdviceStatus.opened 
            ? const Icon(Icons.circle_rounded, size: 12, color: Colors.blue) : null,
          child: const Text('Abiertas'),
        ),
        MenuItemButton(
          onPressed: () => filterNotifier.state = AdviceStatus.completed,
          leadingIcon: filter == AdviceStatus.completed 
            ? const Icon(Icons.circle_rounded, size: 12, color: Colors.green) : null,
          child: const Text('Completadas'),
        ),
        MenuItemButton(
          onPressed: () => filterNotifier.state = AdviceStatus.canceled,
          leadingIcon: filter == AdviceStatus.canceled 
            ? const Icon(Icons.circle_rounded, size: 12, color: Colors.red) : null,
          child: const Text('Canceladas'),
        ),
        if (role == Role.estudiante)
          MenuItemButton(
            onPressed: () => filterNotifier.state = AdviceStatus.forRating,
            leadingIcon: filter == AdviceStatus.forRating 
              ? const Icon(Icons.circle_rounded, size: 12, color: Colors.yellow) : null,
            child: const Text('Por evaluar'),
          )
      ]
    );
  }

  Widget setTextFilter(AdviceStatus filter) => switch (filter) {
    AdviceStatus.opened => const Text('Abiertas'),
    AdviceStatus.completed => const Text('Completadas'),
    AdviceStatus.canceled => const Text('Canceladas'),
    AdviceStatus.forRating => const Text('Por evaluar'),
  };
}