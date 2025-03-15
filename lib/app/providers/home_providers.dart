import 'package:aspartec_plus/app/global/values.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/domain/models/advice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider, StateProvider;

import 'use_cases_providers.dart';

final advisorNavigationIndexProvider = StateProvider.autoDispose((ref) => 0);
final studentNavigationIndexProvider = StateProvider.autoDispose((ref) => 0);

final adviceFilterProvider = StateProvider.family<AdviceStatus, Role>(
  (ref, role) => AdviceStatus.opened
);

final currentUserProvider = FutureProvider((ref) => ref.read(userUseCaseProvider).getData());

final adviceProvider = FutureProvider.family<List<Advice>, (Role, AdviceStatus)>(
  (ref, record) => ref.read(adviceUseCaseProvider)
    .getAdvice(role: record.$1, status: record.$2)
);

final availableSubjectsProvider = FutureProvider((ref) => ref.read(subjectsUseCaseProvider).getSubjects());