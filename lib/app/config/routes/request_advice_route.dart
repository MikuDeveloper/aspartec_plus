
import 'package:aspartec_plus/ui/screens/index.dart' show RequestAdviceScreen;
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final requestAdviceRoute = GoRoute(
  path: '/request-advice',
  name: 'request-advice',
  pageBuilder: (context, state) => CustomTransitionPage(
    child: const RequestAdviceScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
      position: animation.drive(
        Tween(begin: const Offset(0, -1), end: Offset.zero)
        .chain(
          CurveTween(curve: Curves.decelerate)
        )
      ),
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400)
  ),
);