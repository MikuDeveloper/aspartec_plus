import 'package:flutter/material.dart';

class DragHandler extends StatelessWidget {
  const DragHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 5,
        color: Theme.of(context).brightness == Brightness.light 
          ? Colors.black38
          : Colors.white38,
      ),
    );
  }
}