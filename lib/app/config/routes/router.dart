import 'package:go_router/go_router.dart';

import 'home_route.dart';
import 'login_route.dart';

final routerConfig = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/', 
  routes: [
    loginRoute,
    homeRoute,
  ]
);