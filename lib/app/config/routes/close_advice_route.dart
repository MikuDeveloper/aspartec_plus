import 'package:aspartec_plus/ui/screens/index.dart' show CloseAdviceScreen;
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final closeAdviceRoute = GoRoute(
  path: 'close-advice/:id',
  name: 'close-advice',
  pageBuilder: (context, state) => CustomTransitionPage(
    transitionsBuilder: (context, animation, secondaryAnimaion, child) => SlideTransition(
      position: animation.drive(
        Tween(begin: const Offset(1, 0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeInOutSine))
      ),
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 400),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    child: CloseAdviceScreen(adviceId: state.pathParameters['id']!)
  )
);