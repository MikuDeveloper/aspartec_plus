import 'package:flutter/material.dart';

class CloseAdviceScreen extends StatelessWidget {
  const CloseAdviceScreen({super.key, required this.adviceId});

  final String adviceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cerrar asesoría'),
      ),
      body: SafeArea(
        child: Center(child: Text('Close advice screen with id: $adviceId')),
      ),
    );
  }
}