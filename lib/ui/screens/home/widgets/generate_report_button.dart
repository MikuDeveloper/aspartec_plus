import 'package:aspartec_plus/domain/models/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GenerateReportButton extends ConsumerWidget {
  const GenerateReportButton({super.key, required this.report});

  final Report report;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => context.goNamed('report-view', extra: report),
      label: const Text('Generar'),
      icon: const Icon(Icons.bar_chart_rounded),
    );
  }
}