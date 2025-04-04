import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:flutter/material.dart';

class AdviceListTileTemplate extends StatelessWidget {
  const AdviceListTileTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}