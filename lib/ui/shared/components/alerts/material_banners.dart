import 'package:aspartec_plus/app/global/enums.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MaterialBanners {
  MaterialBanners._();

  static void showNotificationBanner(BuildContext context, WidgetRef ref, String message, (Role, AdviceStatus) data) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        elevation: 5,
        padding: const EdgeInsets.all(defaultPadding / 2),
        leading: const Icon(Icons.notifications_active_rounded, color: Colors.amber),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              ref.invalidate(adviceProvider);
              ref.read(advisorNavigationIndexProvider.notifier).state = (data.$1 == Role.advisor) ? 0 : 1;
              ref.read(adviceFilterProvider(data.$1).notifier).state = data.$2;
              context.goNamed('home');
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('Ir')
          ),
          TextButton(
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            child: const Text('Ignorar')
          )
        ]
      )
    );
  }
}