import 'package:aspartec_plus/ui/screens/index.dart' show RegisterSubjectScreen;
import 'package:go_router/go_router.dart';

final registerSubjectRoute = GoRoute(
  path: '/register-subject',
  name: 'register-subject',
  builder: (context, state) => const RegisterSubjectScreen(),
);