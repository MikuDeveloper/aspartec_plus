import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/sliver_appbar_page.dart';

class SubjectsPage extends ConsumerWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        const SliverAppbarPage(
          title: 'Materias',
          picture: Assets.subjectsPageIcon
        ),
        SliverPadding(
          padding: EdgeInsets.all(defaultPadding / 2),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add_rounded), label: const Text('Agregar'))
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          sliver: SliverGrid.builder(
            itemCount: 6,
            // TODO: Replace with custom widget for subjects.
            itemBuilder: (context, index) => Card(
              child: Center(),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: defaultPadding / 2,
              crossAxisSpacing: defaultPadding / 2
            )
          ),
        )
      ],
    );
  }
}