import 'package:flutter/material.dart';

class GenerateReportButton extends StatelessWidget {
  const GenerateReportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: const Text('Generar'),
      icon: const Icon(Icons.bar_chart_rounded),
    );
  }
}