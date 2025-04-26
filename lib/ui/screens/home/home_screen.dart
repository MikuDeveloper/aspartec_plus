import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider, firebaseMessagesProvider, userDataProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show MaterialBanners;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/advisor_screen.dart';
import 'screens/home_error_screen.dart';
import 'screens/home_loading_screen.dart';
import 'screens/student_screen.dart';

class HomeScreen extends ConsumerWidget with PlatformFunctions {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserData = ref.watch(userDataProvider(null));
    final currentUser = ref.watch(currentUserProvider);
    
    ref.watch(firebaseMessagesProvider).whenData((remoteMeesage) {
      final data = remoteMeesage.data;
      final title = remoteMeesage.notification?.title ?? 'Cambios en las asesorías';
      final filter = (Role.fromDisplayName(data['role'] ?? ''), AdviceStatus.fromDisplayName(data['status'] ?? ''));
      MaterialBanners.showNotificationBanner(context, ref, title, filter);
    });

    return currentUserData.when(
      skipLoadingOnReload: true,
      loading: () => HomeLoadingScreen(),
      error: (error, stackTrace) => HomeErrorScreen(error: error.toString()),
      data: (aspartecUser) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          debugPrint('User data: ${aspartecUser.uid}');
          if (currentUser?.uid != aspartecUser.uid) {
            ref.read(currentUserProvider.notifier).state = aspartecUser;
            activeNotifications(aspartecUser.uid);
          }
        });

        return switch (aspartecUser.role) {
          Role.student => StudentScreen(),
          Role.advisor => AdvisorScreen(),
        };
      },
    );
  }
}