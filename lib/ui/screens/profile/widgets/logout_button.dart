import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:aspartec_plus/app/providers/use_cases_providers.dart' show userUseCaseProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogoutButton extends ConsumerWidget with PlatformFunctions {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userUseCase = ref.read(userUseCaseProvider);
    final currentUser = ref.read(currentUserProvider.notifier).state;

    return IconButton(
      onPressed: () async {
        try {
          final result = await Dialogs.showDecisiveDialog(context, 'Cerrar sesión', '¿Desea cerrar la sesión actual?');
          if (!result) return;

          if (context.mounted) Dialogs.showLoadingDialog(context);
          await desactivateNotifications(currentUser!.uid);
          await userUseCase.logout();
          if (context.mounted) {
            context.pop();
            context.goNamed('login');
          }
        } catch (error) {
          if (kDebugMode) print(error.toString());
        }
      },
      icon: const Icon(Icons.logout_outlined) 
    );
  }
}