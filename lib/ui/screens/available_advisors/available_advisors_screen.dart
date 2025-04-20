import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart' show advisorsBySubjectProvider, majorFilterProvider;
import 'package:aspartec_plus/domain/models/subject.dart';
import 'package:aspartec_plus/ui/shared/mixins/platform_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../request_advice/widgets/advisor_card.dart';
import 'components/empty_list_message.dart';
import 'widgets/major_filter_menu.dart';


class AvailableAdvisorsScreen extends ConsumerWidget with PlatformFunctions {
  const AvailableAdvisorsScreen({super.key, required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var advisors = ref.watch(advisorsBySubjectProvider(subject.id)).value ?? [];
    final majorFilter = ref.watch(majorFilterProvider);

    final filterAdvisors = advisors.where((advisor) => advisor.major == majorFilter || majorFilter == null).toList();

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
            filterAdvisors.isNotEmpty 
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
                  itemCount: filterAdvisors.length,
                  itemBuilder: (context, index) => AdvisorCard(
                    advisor: filterAdvisors[index],
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