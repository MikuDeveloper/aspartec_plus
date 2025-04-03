import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart';
import 'package:aspartec_plus/ui/shared/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/widgets/sliver_error.dart';
import '../home/widgets/sliver_loading.dart';

class RequestAdviceScreen extends ConsumerWidget {
  const RequestAdviceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsProvider = ref.watch(availableSubjectsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar asesor par'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(availableSubjectsProvider.future),
        child: CustomScrollView(
          slivers: [
            subjectsProvider.when(
              loading: () => const SliverLoading(),
              error: (error, stackTrace) => const SliverError(),
              data: (subjects) => SliverList.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) => ListTile(
                  title: Row(
                    children: [
                      Expanded(child: Text(subjects[index].name, overflow: TextOverflow.ellipsis)),
                      TextButton(onPressed: () {}, child: const Text('Ver más'))
                    ],
                  ),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ref.watch(advisorsBySubjectProvider(subjects[index].id)).when(
                      data: (users) => Row(
                        children: users.map((user) => SizedBox(
                          height: 150,
                          width: 150,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(defaultPadding / 2),
                              child: Column(
                                children: [
                                  Text('${user.firstname} ${user.lastname1} ${user.lastname2}'.trim(), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
                                  const ProfileAvatar()
                                ],
                              ),
                            ),
                          ),
                        )).toList()
                      ),
                      error: (error, stackTrace) => Row(children: [Center(child: Text(error.toString()))]),
                      loading: () => Row(children: [Center(child: CircularProgressIndicator())])
                    )
                  ),
                )
              )
            )
          ],
        ),
      )
    );
  }
}

// Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(child: Text(subjects[index].name, overflow: TextOverflow.ellipsis)),
//                         TextButton(onPressed: () {}, child: const Text('Ver más'))
//                       ],
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: ref.watch(advisorsBySubjectProvider(subjects[index].id)).when(
//                         loading: () => Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const CircularProgressIndicator()
//                           ],
//                         ),
//                         error: (error, stackTrace) => Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(error.toString())
//                           ],
//                         ),
//                         data: (users) => Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: users.map((user) => Card(
//                             child: Padding(
//                               padding: const EdgeInsets.all(defaultPadding / 2),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Expanded(child: const ProfileAvatar()),
//                                   FilledButton(onPressed: () {}, child: const Text('Solicitar'))
//                                 ],
//                               ),
//                             )
//                           )).toList(),
//                         )
//                       )
//                     )
//                   ],
//                 ),