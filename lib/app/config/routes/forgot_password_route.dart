import 'package:aspartec_plus/ui/screens/index.dart' show ForgotPasswordScreen;
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final forgotPasswordRoute = GoRoute(
  path: '/forgot-password',
  name: 'forgot-password',
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: const ForgotPasswordScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset.zero
        ).chain(CurveTween(curve: Curves.bounceInOut))
      ),
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400)
  ),
);