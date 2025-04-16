import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorsBySubjectProvider;
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:aspartec_plus/ui/screens/available_advisors/components/empty_list_message.dart';
import 'package:aspartec_plus/ui/screens/available_advisors/providers/major_provider.dart';
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../request_advice/widgets/advisor_card.dart';
import 'widgets/major_filter_menu.dart';


class AvailableAdvisorsScreen extends ConsumerWidget with PlatformFunctions {
  const AvailableAdvisorsScreen({super.key, required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var advisors = ref.watch(advisorsBySubjectProvider(subject.id)).value ?? [];
    final majorFilter = ref.watch(majorFilterProvider);

    advisors = advisors.takeWhile((advisor) => advisor.major == majorFilter || majorFilter == null).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: MajorFilterMenu(),
                )
              ),
            ),
            advisors.isNotEmpty 
              ? SliverPadding(
                padding: const EdgeInsets.symmetric(
                  vertical: defaultPadding / 2,
                  horizontal: defaultPadding
                ),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getAxisCountForGrid(context),
                    mainAxisSpacing: defaultPadding / 2,
                    crossAxisSpacing: defaultPadding / 2
                  ),
                  itemCount: advisors.length,
                  itemBuilder: (context, index) => AdvisorCard(
                    advisor: advisors[index],
                    subject: subject
                  )
                ),
              ) 
              : SliverFillRemaining(child: const EmptyListMessage())
          ],
        )
      ),
    );
  }
}