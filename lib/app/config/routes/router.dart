import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import 'home_route.dart';
import 'login_route.dart';

final routerConfig = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/', 
  routes: [
    loginRoute,
    homeRoute,
  ],
  redirect: (context, state) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    final isLoggingInOrChild = state.uri.path == '/' || 
      state.uri.path.startsWith('/register') || 
      state.uri.path.startsWith('/forgot-password');

    if (!isLoggedIn && !isLoggingInOrChild) {
      return '/';
    }

    if (isLoggedIn && !state.uri.path.startsWith('/home')) {
      return '/home';
    }

    return null;
  },
);