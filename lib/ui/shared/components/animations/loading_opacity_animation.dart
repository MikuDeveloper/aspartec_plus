import 'package:flutter/material.dart';

class LoadingOpacityAnimation extends StatefulWidget {
  const LoadingOpacityAnimation({super.key, required this.child});

  final Widget child;

  @override
  State<LoadingOpacityAnimation> createState() => _LoadingOpacityAnimationState();
}

class _LoadingOpacityAnimationState extends State<LoadingOpacityAnimation> {
  bool _isForward = true;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: _isForward ? 0.35 : 0.85, end: _isForward ? 0.85 : 0.35),
      duration: const Duration(milliseconds: 1000),
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: widget.child
      ),
      onEnd: () {
        if (mounted) {
          setState(() {
            _isForward = !_isForward;
          });
        }
      },
    );
  }
}