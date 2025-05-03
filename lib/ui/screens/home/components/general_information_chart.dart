import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/domain/models/report.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GeneralInformationChart extends StatelessWidget {
  const GeneralInformationChart({super.key, required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Asesorías impartidas',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: defaultPadding),
          child: SizedBox(
            height: 250,
            width: 300,
            child: PieChart(
              PieChartData(
                startDegreeOffset: -90,
                centerSpaceRadius: 70,
                sectionsSpace: 0,
                sections: _getSections()
              )
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: defaultPadding / 2,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.square_rounded, color: Color(0xFF27EE27)),
                Text('Completadas', style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            Row(
              spacing: defaultPadding / 2,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.square_rounded, color: Color(0xFFEE2727)),
                Text('Canceladas', style: Theme.of(context).textTheme.labelMedium),
              ],
            )
          ],
        )
      ],
    );
  }

  List<PieChartSectionData>? _getSections() {
    if (report.adviceCount == 0) return null;

    final canceledValue = ((report.canceledAdvice * 100) / report.adviceCount).roundToDouble();
    final completedValue = ((report.completedAdvice * 100) / report.adviceCount).roundToDouble();

    return [
      PieChartSectionData(
        title: '$completedValue%',
        color: const Color(0xFF27EE27),
        value: completedValue,
        radius: 25,
        titlePositionPercentageOffset: 2,
      ),
      PieChartSectionData(
        title: '$canceledValue%',
        color: const Color(0xFFEE2727),
        value: canceledValue,
        radius: 25,
        titlePositionPercentageOffset: 2,
      )
    ]; 
  }
}