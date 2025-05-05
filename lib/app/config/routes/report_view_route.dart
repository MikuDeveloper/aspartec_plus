import 'package:aspartec_plus/domain/models/report.dart';
import 'package:aspartec_plus/ui/screens/index.dart' show ReportViewScreen;
import 'package:go_router/go_router.dart';

final reportViewRoute = GoRoute(
  path: 'report-view',
  name: 'report-view',
  builder: (context, state) {
    final data = state.extra is Map<String, dynamic>
      ? Report.fromJson(state.extra as Map<String, dynamic>)
      : state.extra as Report;
    return ReportViewScreen(reportData: data);
  }
);