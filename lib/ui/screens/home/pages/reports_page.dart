import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show reportProvider;
import 'package:aspartec_plus/app/providers/value_providers.dart' show selectedMonthProvider;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/report_actions_bar.dart';
import '../components/report_information.dart';
import '../components/sliver_appbar_page.dart';
import '../components/sliver_error.dart';
import '../components/sliver_loading.dart';

class ReportsPage extends ConsumerWidget with PlatformFunctions {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMonth = ref.watch(selectedMonthProvider);
    final report = ref.watch(reportProvider(selectedMonth));

    return RefreshIndicator(
      onRefresh: () => ref.refresh(reportProvider(selectedMonth).future),
      child: CustomScrollView(
        slivers: [
          const SliverAppbarPage(
            title: 'Reportes',
            picture: Assets.reportsPageIcon
          ),
          const ReportActionsBar(),
          report.when(
            skipLoadingOnRefresh: !isDesktop(),
            data: (report) => SliverToBoxAdapter(
              child: ReportInformation(report: report)
            ),
            error: (error, stackTrace) => SliverError(
              error: error.toString(),
              futureProvider: reportProvider(selectedMonth)
            ),
            loading: () => const SliverLoading()
          )
        ],
      ),
    );
  }
}