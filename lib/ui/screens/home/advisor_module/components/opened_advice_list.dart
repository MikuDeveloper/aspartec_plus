import 'package:aspartec_plus/app/providers/advice_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;

import '../widgets/advice_list_tile.dart';

class OpenedAdviceList extends ConsumerWidget {
  const OpenedAdviceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(advisorOpenedAdviceProvider).when(
      data: (_) => SliverList.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 2,
        itemBuilder: (context, index) => Slidable(
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                padding: EdgeInsets.all(4),
                onPressed: (context) {},
                icon: FontAwesomeIcons.whatsapp,
                label: 'WhatsApp',
                backgroundColor: Colors.green,
              )
            ]
          ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                padding: EdgeInsets.all(4),
                onPressed: (context) {},
                icon: Icons.check_circle_rounded,
                label: 'Cerrar asesoría',
                backgroundColor: Colors.blue,
              ),
            ]
          ),
          child: AdviceListTile(
            username: 'Hatsune Miku',
            date: '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            subject: 'Ecuaciones',
            topic: 'Transformada de Laplace'
          )
        )
      ),
      error: (_, __) => SliverFillRemaining(
        child: Center(child: Text('Error')),
      ),
      loading: () => SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      )
    );
  }
}