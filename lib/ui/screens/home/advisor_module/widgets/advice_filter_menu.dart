import 'package:aspartec_plus/app/global/values.dart' show AdviceFilters, Role;
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
          onPressed: () => filterNotifier.state = AdviceFilters.opened,
          leadingIcon: filter == AdviceFilters.opened 
            ? const Icon(Icons.circle_rounded, size: 12, color: Colors.blue) : null,
          child: const Text('Abiertas'),
        ),
        MenuItemButton(
          onPressed: () => filterNotifier.state = AdviceFilters.completed,
          leadingIcon: filter == AdviceFilters.completed 
            ? const Icon(Icons.circle_rounded, size: 12, color: Colors.green) : null,
          child: const Text('Completadas'),
        ),
        MenuItemButton(
          onPressed: () => filterNotifier.state = AdviceFilters.canceled,
          leadingIcon: filter == AdviceFilters.canceled 
            ? const Icon(Icons.circle_rounded, size: 12, color: Colors.red) : null,
          child: const Text('Canceladas'),
        ),
        if (role == Role.estudiante)
          MenuItemButton(
            onPressed: () => filterNotifier.state = AdviceFilters.forRating,
            leadingIcon: filter == AdviceFilters.forRating 
              ? const Icon(Icons.circle_rounded, size: 12, color: Colors.yellow) : null,
            child: const Text('Por evaluar'),
          )
      ]
    );
  }

  Widget setTextFilter(AdviceFilters filter) => switch (filter) {
    AdviceFilters.opened => const Text('Abiertas'),
    AdviceFilters.completed => const Text('Completadas'),
    AdviceFilters.canceled => const Text('Canceladas'),
    AdviceFilters.forRating => const Text('Por evaluar'),
  };
}