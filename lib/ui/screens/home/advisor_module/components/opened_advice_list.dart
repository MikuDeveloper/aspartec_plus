import 'package:aspartec_plus/app/global/enums.dart' show Role, AdviceStatus;
import 'package:aspartec_plus/app/providers/home_providers.dart' show adviceProvider;
import 'package:aspartec_plus/ui/shared/index.dart' show EntryAnimation;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FontAwesomeIcons;

import '../../widgets/sliver_error.dart';
import '../../widgets/sliver_loading.dart';
import '../widgets/advice_list_tile.dart';

class OpenedAdviceList extends ConsumerWidget {
  const OpenedAdviceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openedAdvice = ref.watch(adviceProvider((Role.advisor, AdviceStatus.opened)));

    return openedAdvice.when(
      loading: () => const SliverLoading(),
      error: (_, __) => const SliverError(),
      data: (_) => SliverList.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 2,
        itemBuilder: (context, index) => EntryAnimation(
          beginOffset: index / 2 == 0 ? const Offset(-1, 0) : const Offset(1, 0),
          child: Slidable(
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
          ),
        )
      )
    );
  }
}