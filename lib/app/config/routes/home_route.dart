import 'package:aspartec_plus/ui/screens/index.dart' show HomeScreen;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final homeRoute = GoRoute(
  path: '/home',
  name: 'home',
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: const HomeScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
      position: animation.drive(
        Tween(
          begin: const Offset(1, 0),
          end: Offset.zero
        ).chain(CurveTween(curve: Curves.easeOutCubic))
      ),
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400)
  ),
  routes: []
);