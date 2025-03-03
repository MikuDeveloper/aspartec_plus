import 'package:aspartec_plus/ui/screens/index.dart' show LoginScreen;
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'forgot_password_route.dart';
import 'register_route.dart';

final loginRoute = GoRoute(
  path: '/',
  name: 'login',
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: const LoginScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400)
  ),
  routes: [
    registerRoute,
    forgotPasswordRoute
  ]
);