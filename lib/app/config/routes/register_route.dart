import 'package:aspartec_plus/ui/screens/index.dart' show RegisterScreen;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final registerRoute = GoRoute(
  path: '/register',
  name: 'register',
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: const RegisterScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset.zero
        ).chain(CurveTween(curve: Curves.easeInOut))
      ),
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400)
  ),
);