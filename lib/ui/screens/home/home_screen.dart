import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/enums.dart' show Role;
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show currentUserProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg.dart';

import 'advisor_module/advisor_module_screen.dart';
import 'student_module/student_module_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
      skipLoadingOnRefresh: false,
      data: (aspartecUser) => switch(aspartecUser.role) {
        Role.student => StudentModuleScreen(),
        Role.advisor => AdvisorModuleScreen(),
      },
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Error al cargar datos'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: defaultPadding,
              runSpacing: defaultPadding / 2,
              children: [
                SvgPicture.asset(Assets.noDataPicture),
                Column(
                  spacing: defaultPadding,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error.toString(), style: Theme.of(context).textTheme.labelLarge),
                    TextButton(
                      onPressed: () => ref.refresh(currentUserProvider),
                      child: const Text('Volver a cargar')
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}