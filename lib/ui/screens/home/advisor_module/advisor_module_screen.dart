import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorNavigationIndexProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;

import 'components/advisor_bottom_navigation.dart';
import 'pages/advisor_page.dart';
import 'pages/reports_page.dart';
import 'pages/student_page.dart';
import 'pages/subjects_page.dart';

class AdvisorModuleScreen extends ConsumerWidget {
  const AdvisorModuleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationIndex = ref.watch(advisorNavigationIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aspartec+'),
      ),
      body: SafeArea(
        child: [
          const AdvisorPage(),
          const StudentPage(),
          const SubjectsPage(),
          const ReportsPage()
        ][navigationIndex],
      ),
      bottomNavigationBar: AdvisorBottomNavigation()
    );
  }
}