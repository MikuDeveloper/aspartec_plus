import 'package:aspartec_plus/app/global/assets.dart';
import 'package:flutter/material.dart';

import '../components/sliver_appbar_page.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppbarPage(
          title: 'Reportes',
          picture: Assets.reportsPageIcon
        )
      ],
    );
  }
}