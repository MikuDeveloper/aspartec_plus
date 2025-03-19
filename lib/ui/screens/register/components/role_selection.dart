import 'package:aspartec_plus/app/global/enums.dart' show Role;
import 'package:aspartec_plus/app/global/values.dart' show defaultPadding;
import 'package:aspartec_plus/ui/screens/register/widgets/role_card.dart';
import 'package:flutter/material.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: defaultPadding,
      runSpacing: defaultPadding / 2,
      alignment: WrapAlignment.spaceAround,
      runAlignment: WrapAlignment.center,
      children: [
        RoleCard(value: Role.student, label: Role.student.displayName),
        RoleCard(value: Role.advisor, label: Role.advisor.displayName)
      ],
    );
  }
}