import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/domain/models/advice.dart';
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final userDataProvider = FutureProvider.family<AspartecUser, String?>(
  (ref, id) => ref.read(userUseCaseProvider).getData(id: id)
);

final advisorSubjectsProvider = FutureProvider<List<Subject>>(
  (ref) => ref.read(subjectsUseCaseProvider).getAdvisorSubjects(
    adviceTaught: ref.watch(currentUserProvider)!.adviceTaught
  )
);

final availableSubjectsProvider = FutureProvider<List<Subject>>(
  (ref) => ref.read(subjectsUseCaseProvider).getSubjects()
);

final advisorsBySubjectProvider = FutureProvider.family<List<AspartecUser>, String>(
  (ref, subjectId) => ref.read(subjectsUseCaseProvider)
    .getAdvisorsBySubjecy(subjectId: subjectId)
);

final currentUserProvider = StateProvider<AspartecUser?>((ref) => null);
