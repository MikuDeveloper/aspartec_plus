import 'package:aspartec_plus/app/global/colors.dart' show majorColors;
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/domain/models/report.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ByMajorChart extends StatelessWidget {
  const ByMajorChart({super.key, required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Asesorías por carrera',
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
          children: majorColors.keys.map(
            (major) => Row(
              spacing: defaultPadding / 2,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.square_rounded, color: majorColors[major]),
                Text(major, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelMedium)
              ]
            )
          ).toList(),
        )
      ],
    );
  }

  List<PieChartSectionData>? _getSections() {
    if (report.adviceCount == 0) return null;

    final double sistemasValue = ((report.adviceBySistemas * 100) / report.adviceCount).roundToDouble();
    final double ticsValue = ((report.adviceByTics * 100) / report.adviceCount).roundToDouble();
    final double mecatronicaValue = ((report.adviceByMecatronica * 100) / report.adviceCount).roundToDouble();
    final double industrialValue = ((report.adviceByIndustrial * 100) / report.adviceCount).roundToDouble();
    final double gestionValue = ((report.adviceByGestion * 100) / report.adviceCount).roundToDouble();
    final double bioquimicaValue = ((report.adviceByBioquimica * 100) / report.adviceCount).roundToDouble();
    final double nanoValue = ((report.adviceByNano * 100) / report.adviceCount).roundToDouble();

    int count = 0;
    final colors = majorColors.values.toList();
    final values = [sistemasValue, ticsValue, mecatronicaValue, industrialValue, gestionValue, bioquimicaValue, nanoValue];

    return values.map(
      (value) => PieChartSectionData(
        title: '$value%',
        value: value,
        radius: 25,
        titlePositionPercentageOffset: 2,
        color: colors[count++]
      )
    ).toList();
  }
}