import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/domain/models/advice.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/aspartec_user.dart';
import 'use_cases_providers.dart';

final advisorNavigationIndexProvider = StateProvider.autoDispose((ref) => 0);
final studentNavigationIndexProvider = StateProvider.autoDispose((ref) => 0);

final adviceFilterProvider = StateProvider.family<AdviceStatus, Role>(
  (ref, role) => AdviceStatus.opened
);

final adviceProvider = FutureProvider.family<List<Advice>, (Role, AdviceStatus)>(
  (ref, record) => ref.read(adviceUseCaseProvider)
    .getAdvice(role: record.$1, status: record.$2)
);

final advisorSubjectsProvider = FutureProvider(
  (ref) => ref.read(subjectsUseCaseProvider).getAdvisorSubjects(
    adviceTaught: ref.watch(currentUserProvider).value?.adviceTaught ?? []
  )
);
final availableSubjectsProvider = FutureProvider((ref) => ref.read(subjectsUseCaseProvider).getSubjects());

final currentUserProvider = StateNotifierProvider<UserDataNotifier, AsyncValue<AspartecUser>>(
  (ref) => UserDataNotifier(ref)
);

class UserDataNotifier extends StateNotifier<AsyncValue<AspartecUser>> {
  UserDataNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadUserData();
  }

  final Ref ref;

  Future<void> _loadUserData() async {
    state = const AsyncValue.loading();
    try {
      final userData = await ref.read(userUseCaseProvider).getData();
      state = AsyncValue.data(userData);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  void updateSubjects(String id) {
    state.value!.adviceTaught.add(id);
    state = AsyncValue.data(state.value!.copyWith(adviceTaught: state.value!.adviceTaught));
  }

  void removeSubject(String id) {
    state.value!.adviceTaught.remove(id);
    state = AsyncValue.data(state.value!.copyWith(adviceTaught: state.value!.adviceTaught));
  }
}