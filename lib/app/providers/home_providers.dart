import 'package:aspartec_plus/app/global/enums.dart' show AdviceStatus, Role;
import 'package:aspartec_plus/domain/models/advice.dart';
import 'package:aspartec_plus/domain/models/aspartec_user.dart';
import 'package:aspartec_plus/domain/models/report.dart';
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'use_cases_providers.dart';

final advisorNavigationIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
final studentNavigationIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

// final firebaseMessagesProvider = StreamProvider.autoDispose<RemoteMessage?>((ref) {
//   final controller = StreamController<RemoteMessage>();
//   FirebaseMessaging.onMessage.listen((message) {
//     controller.add(message);
//   });
//   return controller.stream;
// });

final firebaseMessagesProvider = StreamProvider.autoDispose((ref) => FirebaseMessaging.onMessage);

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

final reportProvider = FutureProvider.family<Report, String>(
  (ref, arg) => ref.read(reportsUseCaseProvider).getReportByMonth(month: arg)
);

final currentUserProvider = StateProvider<AspartecUser?>((ref) => null);

final majorFilterProvider = StateProvider.autoDispose<String?>((ref) => null);