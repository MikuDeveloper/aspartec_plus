import 'package:flutter/material.dart';

class AnimatedCheck extends StatelessWidget {
  const AnimatedCheck({super.key, required this.valid});

  final bool valid;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: valid 
      ? const Icon(key: ValueKey('valid'), Icons.done_all_rounded, color: Colors.green)
      : const Icon(key: ValueKey('invalid'), Icons.check_rounded, color: Colors.grey),
    );
  }
}