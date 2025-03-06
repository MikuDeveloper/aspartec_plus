import 'package:aspartec_plus/app/global/values.dart' show Role, defaultPadding;
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
        RoleCard(value: Role.estudiante, label: 'Estudiante'),
        RoleCard(value: Role.asesor, label: 'Asesor')
      ],
    );
  }
}