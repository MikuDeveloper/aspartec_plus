import 'package:aspartec_plus/app/global/enums.dart';
import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorNavigationIndexProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/advisor_bottom_navigation.dart';
import '../pages/advice_page.dart';
import '../pages/reports_page.dart';
import '../pages/subjects_page.dart';
import '../widgets/profile_action.dart';

class AdvisorScreen extends ConsumerWidget {
  const AdvisorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationIndex = ref.watch(advisorNavigationIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aspartec+'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_rounded),
          ),
          const ProfileAction()
        ],
      ),
      body: SafeArea(
        child: [
          const AdvicePage(role: Role.advisor),
          const AdvicePage(role: Role.student),
          const SubjectsPage(),
          const ReportsPage()
        ][navigationIndex],
      ),
      bottomNavigationBar: AdvisorBottomNavigation()
    );
  }
}