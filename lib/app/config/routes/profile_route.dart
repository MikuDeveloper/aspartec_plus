import 'package:aspartec_plus/ui/screens/index.dart' show ProfileScreen;
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final profileRoute = GoRoute(
  path: '/profile',
  name: 'profile',
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
      position: animation.drive(
        Tween(begin: const Offset(1, 0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.linearToEaseOut))
      ),
      child: child
    ),
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    child: const ProfileScreen()
  ),
);