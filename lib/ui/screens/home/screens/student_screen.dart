import 'package:flutter/material.dart';

import '../widgets/profile_action.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aspartec+'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_rounded),
          ),
          const ProfileAction()
        ],
      ),
      body: SafeArea(
        child: Placeholder(),
      ),
    );
  }
}