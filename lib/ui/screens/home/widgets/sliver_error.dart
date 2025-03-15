import 'package:flutter/material.dart';

class SliverError extends StatelessWidget {
  const SliverError({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Text('Error al obtener la información solicitada.'),
    );
  }
}