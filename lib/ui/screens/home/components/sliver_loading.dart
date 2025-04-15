import 'package:flutter/material.dart';

class SliverLoading extends StatelessWidget {
  const SliverLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}