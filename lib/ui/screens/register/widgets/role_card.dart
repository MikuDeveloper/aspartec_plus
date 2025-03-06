import 'package:aspartec_plus/app/global/assets.dart';
import 'package:aspartec_plus/app/global/colors.dart' show seedColor;
import 'package:aspartec_plus/app/global/values.dart' show Role, defaultPadding;
import 'package:aspartec_plus/app/providers/register_providers.dart' show selectedRoleProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:svg_flutter/svg_flutter.dart';

class RoleCard extends ConsumerWidget {
  const RoleCard({super.key, required this.value, required this.label});

  final Role value;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole = ref.watch(selectedRoleProvider);
    final role = ref.read(selectedRoleProvider.notifier);

    return Card(
      color: value == selectedRole ? seedColor.withAlpha(200) : null,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: InkWell(
        onTap: () => role.state = value,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: Column(
            spacing: defaultPadding / 2,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge
                  ?.copyWith(
                    color: value == selectedRole ? Colors.white : null,
                    fontWeight: value == selectedRole ? FontWeight.bold : null
                  ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.35
                ),
                child: _setPicture(value),
              )
            ],
          ),
        ),
      ),
    );
  }

  SvgPicture _setPicture(Role role) => switch (role) {
    Role.asesor => SvgPicture.asset(Assets.advisorRolePicture),
    Role.estudiante => SvgPicture.asset(Assets.studentRolePicture),
  };
}