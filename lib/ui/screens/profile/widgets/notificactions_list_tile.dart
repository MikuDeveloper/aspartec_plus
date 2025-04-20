import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show Dialogs;
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final notificationsStatusProvider = StateProvider((ref) => ref.watch(settingsProvider).value ?? false);

final settingsProvider = FutureProvider.autoDispose((ref) async {
  final prefs = SharedPreferencesAsync();
  return await prefs.getBool('notificationsEnabled');
});

class NotificactionsListTile extends ConsumerWidget with PlatformFunctions {
  const NotificactionsListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(currentUserProvider)!.uid;
    final status = ref.watch(notificationsStatusProvider);
    final statusNotifier = ref.read(notificationsStatusProvider.notifier);

    return ListTile(
      leading: const Icon(Icons.notifications_rounded, color: Colors.amber),
      title: const Text('Notificaciones'),
      trailing: Switch(
        value: status,
        onChanged: (value) async {
          Dialogs.showLoadingDialog(context);
          statusNotifier.state = value;
          value ? await activeNotifications(uid) : await desactivateNotifications(uid);
          if (context.mounted) context.pop();
        }
      ),
    );
  }
}