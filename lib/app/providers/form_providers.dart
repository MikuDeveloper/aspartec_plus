
import 'package:flutter/material.dart' show Colors, DropdownMenuEntry, Icon, Icons;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;

import '../global/forms.dart';
import '../global/values.dart' show genders, majors, Role;

final loginFormProvider = Provider.autoDispose((ref) => loginForm);
final forgotPasswordFormProvider = Provider.autoDispose((ref) => forgotPasswordForm);
final personalDataFormProvider = Provider.autoDispose((ref) => personalDataForm);
final schoolDataFormProvider = Provider.autoDispose((ref) => schoolDataForm);
final credentialsFormProvider = Provider.autoDispose((ref) => credentialsForm);

final genderEntriesProvider = Provider.autoDispose(
  (ref) => genders.map(
    (gender) => DropdownMenuEntry(
      leadingIcon: switch(gender) {
        'Hombre' => const Icon(Icons.male_rounded, color: Colors.blueAccent),
        'Mujer' => const Icon(Icons.female_rounded, color: Colors.pinkAccent),
        'No binario' => const Icon(Icons.transgender_rounded, color: Colors.amberAccent),
        _ => const Icon(Icons.question_mark_rounded, color: Colors.blueGrey)
      },
      value: gender,
      label: gender
    )
  ).toList()
);

final majorEntriesProvider = Provider.autoDispose(
  (ref) => majors.map(
    (major) => DropdownMenuEntry(value: major, label: major)
  ).toList()
);

final selectedRoleProvider = Provider.autoDispose<Role?>((ref) => null);