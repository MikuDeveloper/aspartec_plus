import 'package:aspartec_plus/app/global/values.dart' show AdviceStatus, Role;
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateProvider;

final advisorNavigationIndexProvider = StateProvider.autoDispose((ref) => 0);
final studentNavigationIndexProvider = StateProvider.autoDispose((ref) => 0);

final adviceFilterProvider = StateProvider.family<AdviceStatus, Role>(
  (ref, role) => AdviceStatus.opened
);
