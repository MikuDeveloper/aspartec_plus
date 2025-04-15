import 'package:aspartec_plus/app/global/colors.dart' show seedColor;
import 'package:aspartec_plus/app/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;

class AdvisorBottomNavigation extends ConsumerWidget {
  const AdvisorBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationBar(
      selectedIndex: ref.watch(advisorNavigationIndexProvider),
      onDestinationSelected: (index) => ref.read(advisorNavigationIndexProvider.notifier).state = index,
      indicatorColor: seedColor,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.calendar_month_outlined),
          selectedIcon: const Icon(Icons.calendar_month_rounded, color: Colors.white),
          label: 'Asesor par',
          tooltip: 'Asesor par',
        ),
        NavigationDestination(
          icon: const Icon(Icons.school_outlined),
          selectedIcon: const Icon(Icons.school_rounded, color: Colors.white),
          label: 'Estudiante',
          tooltip: 'Estudiante',
        ),
        NavigationDestination(
          icon: const Icon(Icons.book_outlined),
          selectedIcon: const Icon(Icons.book_rounded, color: Colors.white),
          label: 'Materias',
          tooltip: 'Materias',
        ),
        NavigationDestination(
          icon: const Icon(Icons.data_thresholding_outlined),
          selectedIcon: const Icon(Icons.data_thresholding_rounded, color: Colors.white),
          label: 'Reportes',
          tooltip: 'Reportes',
        ),
      ]
    );
  }
}