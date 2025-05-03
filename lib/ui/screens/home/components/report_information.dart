import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/domain/models/report.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import 'average_rating_component.dart';
import 'by_major_chart.dart';
import 'general_information_chart.dart';

class ReportInformation extends StatelessWidget {
  const ReportInformation({super.key, required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: defaultPadding,
      mainAxisAlignment: MainAxisAlignment.center,
      children: report.adviceCount == 0 ? 
      [
        Text(
          'No se encontraron datos de asesorías',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 400
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: SvgPicture.asset(Assets.statisticsPicture),
          ),
        ),
      ] :
      [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Asesorías totales',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              report.adviceCount.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        AverageRatingComponent(raiting: report.averageRaiting),
        const Divider(),
        Padding(
          padding: const EdgeInsets.only(
            left: defaultPadding,
            bottom: defaultPadding,
            right: defaultPadding
          ),
          child: Wrap(
            spacing: defaultPadding * 2,
            runSpacing: defaultPadding,
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.center,
            children: [
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: GeneralInformationChart(report: report),
                )
              ),
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: ByMajorChart(report: report),
                )
              )
            ],
          ),
        )
      ],
    );
  }
}