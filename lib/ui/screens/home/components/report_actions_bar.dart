import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show reportProvider;
import 'package:aspartec_plus/app/providers/value_providers.dart' show selectedMonthProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show RefreshIconButton;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/generate_report_button.dart';
import '../widgets/select_period_menu.dart';

class ReportActionsBar extends ConsumerWidget with PlatformFunctions {
  const ReportActionsBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final report = ref.watch(reportProvider(selectedMonth));
    
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
        horizontal: defaultPadding
      ),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectPeriodMenu(),
                if (isDesktop())
                  RefreshIconButton(futureProvider: reportProvider(selectedMonth))
              ]
            ),
            if (report.hasValue && report.requireValue.adviceCount > 0)
              GenerateReportButton(report: report.value!)
          ],
        )
      ),
    );
  }
}