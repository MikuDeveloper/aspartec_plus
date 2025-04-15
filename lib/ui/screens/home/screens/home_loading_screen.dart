import 'package:flutter/material.dart';

class HomeLoadingScreen extends StatelessWidget {
  const HomeLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}