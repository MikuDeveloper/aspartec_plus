import 'package:aspartec_plus/app/global/enums.dart' show Role;
import 'package:aspartec_plus/app/providers/home_providers.dart' show userDataProvider, currentUserProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/advisor_screen.dart';
import 'screens/home_error_screen.dart';
import 'screens/home_loading_screen.dart';
import 'screens/student_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserData = ref.watch(userDataProvider(null));

    return currentUserData.when(
      skipLoadingOnReload: true,
      loading: () => HomeLoadingScreen(),
      error: (error, stackTrace) => HomeErrorScreen(error: error.toString()),
      data: (aspartecUser) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => ref.read(currentUserProvider.notifier).state = aspartecUser
        );

        return switch(aspartecUser.role) {
          Role.student => StudentScreen(),
          Role.advisor => AdvisorScreen(),
        };
      },
    );
  }
}