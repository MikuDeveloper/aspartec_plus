import 'package:aspartec_plus/app/global/values.dart';
import 'package:flutter/material.dart';

class AdviceLoadingAnimation extends StatefulWidget {
  const AdviceLoadingAnimation({super.key});

  @override
  State<AdviceLoadingAnimation> createState() =>
      _AdviceLoadingAnimationState();
}

class _AdviceLoadingAnimationState extends State<AdviceLoadingAnimation> {
  bool _isForward = true;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: _isForward ? 0.3 : 0.8, end: _isForward ? 0.8 : 0.3),
      duration: const Duration(milliseconds: 1000),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: ListTile(
            title: Row(
              spacing: defaultPadding,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      height: 32,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    height: 16,
                    width: 75,
                    color: Colors.grey[300],
                  ),
                )
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: defaultPadding / 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  height: 18,
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
        );
      },
      onEnd: () {
        if (mounted) {
          setState(() {
            _isForward = !_isForward; // Cambiar la dirección
          });
        }
      },
    );
  }
}