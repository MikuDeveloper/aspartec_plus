import 'package:aspartec_plus/app/global/values.dart' show AdviceFilters, Role;
import 'package:flutter_riverpod/flutter_riverpod.dart' show StateProvider;

final advisorNavigationIndexProvider = StateProvider.autoDispose((ref) => 0);
final studentNavigationIndexProvider = StateProvider.autoDispose((ref) => 0);

final adviceFilterProvider = StateProvider.family<AdviceFilters, Role>(
  (ref, role) => AdviceFilters.opened
);
