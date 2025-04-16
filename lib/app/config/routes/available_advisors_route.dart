import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:aspartec_plus/ui/screens/index.dart' show AvailableAdvisorsScreen;
import 'package:go_router/go_router.dart';

final availableAvisorsRoute = GoRoute(
  path: 'available-advisors',
  name: 'available-advisors',
  builder: (context, state)  {
    final subject = state.extra is Map<String, dynamic>
        ? Subject.fromJson(state.extra as Map<String, dynamic>)
        : state.extra as Subject;
    return AvailableAdvisorsScreen(subject: subject);
  }
);