import 'package:aspartec_plus/app/global/enums.dart' show Role;
import 'package:aspartec_plus/app/global/launchers.dart';
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/app/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdviceStartActionPane extends StatelessWidget {
  const AdviceStartActionPane({super.key, required this.subject, required this.phoneNumber, required this.role});

  final String subject;
  final String phoneNumber;
  final Role role;

  @override
  Widget build(BuildContext context) {
    return ActionPane(
      motion: const BehindMotion(),
      children: [
        Consumer(
          builder: (context, ref, child) {
            final currentUser = ref.watch(currentUserProvider)!;
            final username = '${currentUser.firstname} ${currentUser.lastname1} ${currentUser.lastname2}'.trim();

            return SlidableAction(
              padding: EdgeInsets.all(defaultPadding / 2),
              onPressed: (context) => Launchers.openWhatsApp(
                context: context,
                phoneNumber: phoneNumber,
                name: username,
                subject: subject,
                isAdvisor: role == Role.advisor
              ),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              label: 'WhatsApp',
              icon: FontAwesomeIcons.whatsapp,
            );
          },
        )
      ],
    );
  }
}