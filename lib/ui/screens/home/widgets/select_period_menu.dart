import 'package:aspartec_plus/app/global/values.dart';
import 'package:aspartec_plus/app/providers/value_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectPeriodMenu extends ConsumerWidget {
  const SelectPeriodMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);

    return MenuAnchor(
      builder: (context, controller, child) => ElevatedButton.icon(
        onPressed: controller.isOpen ? controller.close : controller.open,
        label: Text(selectedMonth),
        icon: const Icon(Icons.date_range_rounded),
      ),
      menuChildren: months.map(
        (month) => MenuItemButton(
          onPressed: () => ref.read(selectedMonthProvider.notifier).state = month,
          child: Text(
            month,
            style: selectedMonth == month 
              ? TextStyle(fontWeight: FontWeight.bold)
              : TextStyle(fontWeight: FontWeight.w300)
          ),
        )
      ).toList()
    );
  }
}